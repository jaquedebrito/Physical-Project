# Resumo do Projeto / Project Summary

## 🇧🇷 Resumo em Português

### Visão Geral
Este repositório contém o projeto final do curso de **Especialização em Microeletrônica**, focado em **Projeto Físico (Physical Design)**. O projeto implementa um **Multiplicador de Ponto Flutuante de 32 bits** seguindo o padrão IEEE 754 com modo de arredondamento "round toward zero".

### Objetivo do Projeto
Implementar um multiplicador de ponto flutuante completo, executando todo o fluxo de projeto físico, desde a descrição RTL em SystemVerilog até o layout final pronto para fabricação em tecnologia de 45nm.

### Especificações Técnicas
- **Formato**: IEEE 754 Single Precision (32 bits)
- **Modo de Arredondamento**: Round Toward Zero
- **Linguagem HDL**: SystemVerilog
- **Tecnologia**: 45nm (GPDK045)
- **Ferramentas CAD**: Cadence Genus (Síntese) e Innovus (Layout)
- **Frequências de Operação**: 10MHz e 110MHz

### Características Implementadas
✅ Multiplicação de números de ponto flutuante IEEE 754  
✅ Tratamento de casos especiais (NaN, Infinito, Zero)  
✅ Detecção de overflow e underflow  
✅ Máquina de estados para controle de pipeline  
✅ Normalização automática de resultados  
✅ Flags de status detalhadas  
✅ Verificação completa com testbench  

### Estrutura do Fluxo de Projeto
1. **Síntese Lógica** - Transformação de RTL para netlist estrutural
2. **Análise de Timing** - Verificação de requisitos temporais
3. **Síntese Física** - Floorplanning, placement, CTS, e roteamento
4. **Verificação Física** - DRC e LVS
5. **Simulação Pós-Layout** - Validação com delays reais

### Resultados Principais
- ✅ Fluxo completo executado com sucesso para 10MHz e 110MHz
- ✅ Todos os casos especiais IEEE 754 tratados corretamente
- ✅ Layout gerado e verificado (DRC e LVS clean)
- ✅ Simulação pós-layout validada com arquivos SDF
- ✅ Análises de área, timing e potência realizadas

### Aprendizados Principais
- Compreensão profunda do fluxo de projeto físico backend
- Experiência prática com ferramentas CAD industriais
- Análise de trade-offs entre área, potência e performance
- Importância da verificação em múltiplos níveis
- Automação de fluxos de projeto através de scripts

---

## 🇺🇸 English Summary

### Overview
This repository contains the final project for the **Microelectronics Specialization** course, focusing on **Physical Design**. The project implements a **32-bit Floating-Point Multiplier** following the IEEE 754 standard with "round toward zero" rounding mode.

### Project Objective
Implement a complete floating-point multiplier, executing the entire physical design flow from RTL description in SystemVerilog to fabrication-ready layout in 45nm technology.

### Technical Specifications
- **Format**: IEEE 754 Single Precision (32 bits)
- **Rounding Mode**: Round Toward Zero
- **HDL Language**: SystemVerilog
- **Technology**: 45nm (GPDK045)
- **CAD Tools**: Cadence Genus (Synthesis) and Innovus (Layout)
- **Operating Frequencies**: 10MHz and 110MHz

### Implemented Features
✅ IEEE 754 floating-point number multiplication  
✅ Special cases handling (NaN, Infinity, Zero)  
✅ Overflow and underflow detection  
✅ State machine for pipeline control  
✅ Automatic result normalization  
✅ Detailed status flags  
✅ Complete verification with testbench  

### Design Flow Structure
1. **Logic Synthesis** - RTL to structural netlist transformation
2. **Timing Analysis** - Temporal requirements verification
3. **Physical Synthesis** - Floorplanning, placement, CTS, and routing
4. **Physical Verification** - DRC and LVS
5. **Post-Layout Simulation** - Validation with real delays

### Key Results
- ✅ Complete flow successfully executed for 10MHz and 110MHz
- ✅ All IEEE 754 special cases correctly handled
- ✅ Layout generated and verified (DRC and LVS clean)
- ✅ Post-layout simulation validated with SDF files
- ✅ Area, timing, and power analyses performed

### Main Learnings
- Deep understanding of backend physical design flow
- Hands-on experience with industrial CAD tools
- Analysis of trade-offs between area, power, and performance
- Importance of multi-level verification
- Design flow automation through scripting

---

## 📊 Quick Stats

| Metric | Value |
|--------|-------|
| **Technology Node** | 45nm GPDK045 |
| **Design Language** | SystemVerilog |
| **Input Format** | IEEE 754 Single Precision |
| **Output Format** | IEEE 754 Single Precision |
| **Tested Frequencies** | 10MHz, 110MHz |
| **State Machine** | 5-state FSM (One-hot encoding) |
| **Special Cases** | NaN, Infinity, Zero, Overflow, Underflow |

## 🎯 Project Highlights

- **Academic Excellence**: Complete physical design implementation from RTL to GDSII
- **Industry-Standard Tools**: Cadence Genus and Innovus workflow
- **Robust Design**: Comprehensive special case handling and error detection
- **Automation**: Scripted workflow for reproducibility
- **Multi-Frequency**: Successful implementation at both 10MHz and 110MHz
- **Thorough Verification**: Multi-level testing including post-layout simulation

## 👤 Author

**Jaqueline Ferreira de Brito**  
Microelectronics Specialization Student  
Date: February 28, 2025
