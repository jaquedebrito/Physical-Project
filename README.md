Course Description: Physical Design of Integrated Circuits

The Physical Design of Integrated Circuits course aims to equip students with the fundamental knowledge and practical skills required to transition from logical design to physical implementation of digital circuits, using a specific fabrication technology. Throughout the course, students learn how to transform hardware description language (HDL) code into a fabrication-ready physical layout (GDSII), mastering backend design flow stages and computer-aided design (CAD) tools.

The curriculum covers key topics such as timing analysis, physical constraints, and the use of industry-standard tools for synthesis, floorplanning, placement, routing, and physical verification (DRC/LVS). Students develop complete design projects that go through the entire backend flow, gaining hands-on experience with configuration files and interpreting synthesis and physical implementation reports.

Physical Design of Integrated Circuits
🎯 Course Objective

This course introduces students to the fundamentals of physical design for digital integrated circuits, focusing on the backend design flow. The goal is to develop a solid understanding of the complete flow from HDL (Hardware Description Language) to GDSII, while using industry-standard EDA tools to perform synthesis, floorplanning, placement, clock tree synthesis (CTS), routing, and verification.

Students will also learn to work with design constraints, interpret timing and power reports, and understand the impact of physical implementation on circuit performance.
🧠 Topics Covered

    Theoretical foundations of physical design

    Backend flow overview: HDL → Netlist → Floorplanning → Placement → CTS → Routing → GDSII

    Static Timing Analysis (STA) and delay optimization

    Use of configuration files (.sdc, .spef, .lib, .lef, .gds)

    CAD tool usage: logic synthesis, layout implementation, and physical verification

📦 Project Deliverables

Students will complete a full backend design project including:

    Verilog/SystemVerilog source files

    Synthesis and place-and-route scripts

    Constraint files (.sdc, .tcl)

    Layout files (LEF/DEF/GDSII)

    Reports: timing, power, area

    Final documentation (PDF) with flow explanation and screenshots

🗂️ Suggested Repository Structure

project-physical-design/
│
├── src/                    # HDL source files (Verilog/VHDL)
│   └── multiplier32.v
│
├── constraints/            # Timing and physical constraints
│   ├── design.sdc
│   └── floorplan.tcl
│
├── scripts/                # Synthesis and PnR automation scripts
│   ├── synth.tcl
│   └── pnr.tcl
│
├── reports/                # Reports generated during the flow
│   ├── timing_report.rpt
│   ├── power_report.rpt
│   └── area_report.rpt
│
├── layout/                 # Layout files
│   ├── design.gds
│   ├── design.lef
│   └── design.def
│
├── verification/           # DRC/LVS/STA results
│   ├── drc.rpt
│   ├── lvs.rpt
│   └── sta_summary.rpt
│
└── docs/                   # Final documentation
    └── final_report.pdf

🛠️ EDA Tools Used

    Tool availability may vary by institution or license.

    Cadence Genus – Logic synthesis

    Cadence Innovus – Physical design (PnR, CTS, Routing)

    Cadence Virtuoso – Layout view and verification (optional/custom)

    KLayout / Magic VLSI – Open-source layout viewing (optional)

    Synopsys Design Compiler – Alternative to Genus

    IRSIM / Netgen / OpenSTA – Optional open tools for STA and checks

⚙️ Typical Commands & Workflow

# Synthesis with Genus
genus -f scripts/synth.tcl

# Place & Route with Innovus
innovus -f scripts/pnr.tcl

# View layout (if using KLayout)
klayout layout/design.gds

# Run timing analysis
opensta
read_liberty constraints/tech.lib
read_verilog netlist.v
read_sdc constraints/design.sdc
report_checks

📚 Prerequisites

    Digital Logic and Architecture basics

    Proficiency in Verilog or SystemVerilog

    Basic Unix/Linux command-line usage

    Familiarity with Makefiles and scripting (TCL)

📌 Final Submission Checklist

HDL Source Code

Constraint Files

Synthesis Scripts

PnR Scripts

Layout Files (GDSII, LEF, DEF)

Timing and Power Reports

Physical Verification Reports (DRC/LVS)

Final PDF Documentation with diagrams and explanations
