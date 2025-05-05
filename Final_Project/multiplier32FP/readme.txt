Project multiplier32FP – 32-bit Floating-Point Multiplier

Date: 2025-02-28
Student: Jaqueline Ferreira de Brito
1. Project Structure

multiplier32FP/
├── frontend/                   # RTL code, testbench, and SDF
│   ├── src/                    # RTL design (multiplier32FP.sv)
│   ├── tb/                     # Testbench (multiplier32FP_tb.sv) and test vectors
│   └── sdf/                    # SDF commands for simulation
│
├── backend/
│   ├── synthesis/              # Logical synthesis
│   │   ├── constraints/        # Constraints (multiplier32FP.sdc)
│   │   ├── deliverables/       # Netlists, SDFs
│   │   ├── reports/            # Reports (area, timing)
│   │   ├── scripts/            # TCL automation scripts
│   │   └── work/               # Execution directory
│   │
│   ├── layout/                 # Physical synthesis
│   │   ├── constraints/
│   │   ├── deliverables/       # Post-layout netlists, DEF, SDF
│   │   ├── reports/            # Power reports
│   │   ├── scripts/            # Layout script (layout.tcl)
│   │   └── work/
│   │
│   └── verification/           # Post-synthesis verification
│       └── work/

2. Execution Flow
2.1. Environment Setup

export DESIGNS="multiplier32FP"
export USER="student"
export PROJECT_DIR="/home/${USER}/projeto_fisico/project_final/${DESIGNS}"
export TECH_DIR="/pdks/cadence/GPDK045"
export HDL_NAME=${DESIGNS}

Copy vetor.txt to frontend/tb/.
2.2. Logic Synthesis (10MHz and 110MHz)

cd ${PROJECT_DIR}/backend/synthesis/work
genus -abort_on_error -files ../scripts/complete_flow.tcl -log genus.log

2.3. Pre-Layout Simulation (with SDF)

cd ${PROJECT_DIR}/frontend

# Compile SDF
xmsdfc -iocondsort -compile ../backend/synthesis/deliverables/${DESIGNS}_normal_worst_10MHz.sdf

# Run simulation
xrun -timescale 1ns/10ps -mess -64bit -v200x -v93 -noneg_tchk \
     -sv ${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc \
     -sdf_cmd_file sdf/sdf_cmd_file.cmd -input vetor.txt +define+DUMP_VCD

2.4. Layout Generation

cd ${PROJECT_DIR}/backend/layout/work
innovus -stylus -files ../scripts/layout.tcl -log innovus.log

2.5. Post-Layout Simulation (with SDF)

cd ${PROJECT_DIR}/frontend

# Compile SDF
xmsdfc -iocondsort -compile ../backend/layout/deliverables/${DESIGNS}_normal_layout_MAX_10MHz.sdf

# Run simulation
xrun -timescale 1ns/10ps -mess -64bit -v200x -v93 -noneg_tchk \
     -sv ${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc \
     -sdf_cmd_file sdf/sdf_cmd_file_layout.cmd -input vetor.txt +define+DUMP_VCD

3. Key Files

    multiplier32FP.sv: RTL implementation of the multiplier

    multiplier32FP_tb.sv: Testbench with coverage

    vetor.txt: Input vectors

    *.sdf: Timing delay files

    complete_flow.tcl: Main synthesis script

    layout.tcl: Layout generation script

    generate_table.tcl: Performance table generation

    *_area_*.rpt, *_timing_*.rpt, power_*.rpt: Reports

4. Results and Verification
4.1. Reports

    Area and timing after logic synthesis

    Power after layout

    Comparative performance table (10MHz vs 110MHz)

4.2. Testbench Coverage

    Special cases: NaN, Infinity, Zero

    Glitch detection and invalid state checking

5. Automation
Full Flow Automation (via run_all.sh)

graph TD
    A[run_all.sh] --> B[complete_flow.tcl]
    B --> C[run_first.tcl]
    B --> D[run_sdf_flow.tcl]
    B --> E[Logic Synthesis]
    B --> F[SDF Pre-layout]
    B --> G[Layout]
    B --> H[SDF Post-layout]

6. Notes

    Scripts overwrite previous logs and output files

    Reports and tables are generated automatically

    SDFs follow standardized naming convention

    Simulations verify IEEE 754 special cases
