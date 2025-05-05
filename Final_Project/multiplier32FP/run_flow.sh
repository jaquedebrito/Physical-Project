#!/bin/bash

# Configurações do ambiente - FIXAS
export DESIGNS="multiplier32FP"
export USER=aluno
export PROJECT_DIR=/home/${USER}/projeto_fisico/project_final/${DESIGNS}
export BACKEND_DIR=${PROJECT_DIR}/backend
export TECH_DIR=/pdks/cadence/GPDK045
export HDL_NAME=${DESIGNS}
export VLOG_LIST="$BACKEND_DIR/synthesis/deliverables/${DESIGNS}.v $BACKEND_DIR/synthesis/deliverables/${DESIGNS}_io.v $BACKEND_DIR/synthesis/deliverables/${DESIGNS}_chip.v"

# Log de início
TIME=$(date -u "+%Y-%m-%d %H:%M:%S")
echo "=== Iniciando fluxo de síntese ==="
echo "Current Date and Time (UTC): ${TIME}"
echo "User: ${USER}"
echo "Project Directory: ${PROJECT_DIR}"
echo "Backend Directory: ${BACKEND_DIR}"
echo "Technology Directory: ${TECH_DIR}"

# Verifica se os diretórios existem
echo -e "\nVerificando diretórios..."
if [ ! -d "${PROJECT_DIR}" ]; then
    echo "ERRO: Diretório do projeto não encontrado: ${PROJECT_DIR}"
    exit 1
fi

if [ ! -d "${PROJECT_DIR}/frontend" ]; then
    echo "ERRO: Diretório frontend não encontrado: ${PROJECT_DIR}/frontend"
    exit 1
fi

if [ ! -d "${BACKEND_DIR}/synthesis/deliverables" ]; then
    echo "ERRO: Diretório de deliverables não encontrado: ${BACKEND_DIR}/synthesis/deliverables"
    exit 1
fi


   
#-----------------------------------------------------------------------------
# Menu principal
#-----------------------------------------------------------------------------
show_menu() {
    clear
    echo "=== Fluxo de Síntese e Simulação ==="
    echo "1. Síntese Lógica (Genus) 10MHz"
    echo "2. Síntese Lógica (Genus) 110MHz"
    echo "3. Síntese Física (Innovus) 10MHz"
    echo "4. Síntese Física (Innovus) 110MHz"
    echo "0. Sair"
}

run_genus() {
    local freq=$1
    echo "=== Iniciando Genus para ${freq}MHz ==="
    echo "1. Aguarde o Genus pausar na mensagem 'Pressione Enter para continuar...'"
    echo "2. Abra outro terminal e execute: ./run_flow.sh vcd ${freq}"
    echo "3. Após gerar os VCDs, volte ao Genus e pressione Enter"
    
    cd "${PROJECT_DIR}/backend/synthesis/work"
    
    # Pergunta se quer continuar
    read -p "Pressione Enter para iniciar o Genus ou Ctrl+C para cancelar..."
    
    genus -abort_on_error -lic_startup Genus_Synthesis -lic_startup_options Genus_Physical_Opt \
          -log genus -overwrite -files "${PROJECT_DIR}/backend/synthesis/scripts/${DESIGNS}.tcl"
}

run_innovus() {
    local freq=$1
    echo "=== Iniciando Innovus para ${freq}MHz ==="
    echo "1. Aguarde o Innovus pausar na mensagem 'Pressione Enter para continuar...'"
    echo "2. Abra outro terminal e execute: ./run_flow.sh vcd_layout ${freq}"
    echo "3. Após gerar os VCDs, volte ao Innovus e pressione Enter"
    
    cd "${PROJECT_DIR}/backend/layout/work"

 # Pergunta se quer continuar
    read -p "Pressione Enter para iniciar o Innovus ou Ctrl+C para cancelar..."

    innovus -stylus -files "../scripts/layout.tcl"
}

generate_vcd() {
    local freq=$1      # 10 ou 110
    local type=$2      # synthesis ou layout
    local delay=$3     # MAX ou MIN
    
    cd "${PROJECT_DIR}/frontend"
    
    echo "=== Gerando VCD ${delay} para ${freq}MHz ==="
    
    # Primeira simulação - Xns (MAX ou MIN)
    echo "1. Execute a simulação normal e salve o VCD como: ${DESIGNS}_${freq}MHz_Xns_${delay}.vcd"
    echo "   Usando SDF compilado: ${DESIGNS}_normal_worst.sdf.X"
    
    xmsdfc -iocondsort -compile "${BACKEND_DIR}/${type}/deliverables/${DESIGNS}_normal_worst.sdf" && \
    xrun -timescale 1ns/10ps -mess -64bit -v200x -v93 -noneg_tchk \
        "${TECH_DIR}/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v" \
        "${BACKEND_DIR}/${type}/deliverables/${DESIGNS}_${freq}MHz.v" \
        "${DESIGNS}_tb.sv" -top "${DESIGNS}_tb" -access +rwc \
        -sdf_cmd_file "sdf_cmd_file_${type}_${delay}.cmd" -gui

    read -p "Pressione Enter para iniciar a simulação 2x ou Ctrl+C para sair..."
    
    # Segunda simulação - 2Xns (MAX ou MIN)
    echo "2. Execute a simulação 2x e salve o VCD como: ${DESIGNS}_${freq}MHz_2Xns_${delay}.vcd"
    echo "   Usando SDF compilado: ${DESIGNS}_normal_worst.sdf.X com multiply_delay 2"
    
    xmsdfc -iocondsort -compile "${BACKEND_DIR}/${type}/deliverables/${DESIGNS}_normal_worst.sdf" -multiply_delay 2 && \
    xrun -timescale 1ns/10ps -mess -64bit -v200x -v93 -noneg_tchk \
        "${TECH_DIR}/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v" \
        "${BACKEND_DIR}/${type}/deliverables/${DESIGNS}_${freq}MHz.v" \
        "${DESIGNS}_tb.sv" -top "${DESIGNS}_tb" -access +rwc \
        -sdf_cmd_file "sdf_cmd_file_${type}_${delay}.cmd" -gui
}

vcd_layout() {
    local freq=$1      # 10 ou 110
    local type="layout"  # sempre layout
    local delay=$2     # MAX ou MIN
    
    cd "${PROJECT_DIR}/frontend"
    
    xmsdfc -iocondsort -compile ${PROJECT_DIR}/backend/layout/deliverables/${DESIGNS}_layout_10MHz.sdf & xrun -timescale 1ns/10ps -mess -64bit -v200x -v93 -noneg_tchk ${TECH_DIR}/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v ${PROJECT_DIR}/backend/layout/deliverables/${DESIGNS}_layout_10MHz.v ${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc -sdf_cmd_file ${PROJECT_DIR}/frontend/sdf_cmd_file_layout_MAX.cmd -gui

   
}

# Função de teste
test_configuration() {
    echo -e "\n=== Testando configuração ==="
    echo "Verificando diretórios principais:"
    for dir in "${PROJECT_DIR}" "${PROJECT_DIR}/frontend" "${BACKEND_DIR}/synthesis/deliverables" "${BACKEND_DIR}/layout/work"; do
        if [ -d "$dir" ]; then
            echo "✓ $dir existe"
        else
            echo "✗ $dir NÃO existe"
        fi
    done

    echo -e "\nVerificando arquivos necessários:"
    files=(
        "${PROJECT_DIR}/frontend/${DESIGNS}_tb.sv"
        "${PROJECT_DIR}/frontend/sdf_cmd_file_synthesis_MAX.cmd"
        "${PROJECT_DIR}/frontend/sdf_cmd_file_synthesis_MIN.cmd"
    )
    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            echo "✓ $file existe"
        else
            echo "✗ $file NÃO existe"
        fi
    done
}

# Adicione "test" no case principal
case $1 in
    "test")
        test_configuration
        ;;
    "vcd")
        generate_vcd $2 "synthesis"
        ;;
    vcd_layout)
        if [ -z "$2" ]; then
            echo "Erro: Frequência não especificada para vcd_layout"
            echo "Uso: $0 vcd_layout <freq>"
            echo "Exemplo: $0 vcd_layout 10"
            exit 1
        fi
        vcd_layout "$2"
        ;;
    *)
        while true; do
            show_menu
            read -p "Escolha uma opção (0-4): " choice
            
            case $choice in
                1) run_genus 10 ;;
                2) run_genus 110 ;;
                3) run_innovus 10 ;;
                4) run_innovus 110 ;;
                0) 
                    echo "Saindo..."
                    exit 0
                    ;;
                *)
                    echo "Opção inválida!"
                    ;;
            esac
            
            read -p "Pressione Enter para continuar..."
        done
        ;;
esac
