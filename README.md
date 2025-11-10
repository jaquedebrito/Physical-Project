# 🔬 Physical Design - IEEE 754 Floating-Point Multiplier

[![Technology](https://img.shields.io/badge/Technology-45nm%20GPDK045-blue)](https://www.cadence.com)
[![Language](https://img.shields.io/badge/HDL-SystemVerilog-orange)](https://ieeexplore.ieee.org/document/8299595)
[![Standard](https://img.shields.io/badge/Standard-IEEE%20754-green)](https://standards.ieee.org/standard/754-2019.html)
[![License](https://img.shields.io/badge/License-Academic-yellow)](LICENSE)

**Course: Specialization in Microelectronics**  
**Author:** Jaqueline Ferreira de Brito  
**Date:** February 28, 2025

---

## 📋 Executive Summary

This repository presents a complete **Physical Design** project implementing a **32-bit IEEE 754 Floating-Point Multiplier** from RTL to GDSII. The project demonstrates the full backend design flow using industry-standard CAD tools (Cadence Genus and Innovus) on 45nm technology, achieving successful implementations at both 10MHz and 110MHz operating frequencies.

**Key Achievements:**
- ✅ Full IEEE 754 compliance with special case handling (NaN, Infinity, Zero)
- ✅ Complete backend flow: Synthesis → Layout → Verification
- ✅ Multi-frequency validation (10MHz and 110MHz)
- ✅ Comprehensive verification including post-layout simulation
- ✅ Automated workflow with reproducible results

> 💡 **Quick Links:** [Summary](SUMMARY.md) | [Project Specification](Final_Project/Especificações_do_Projeto_Final.pdf) | [Full Report](Final_Project/multiplier32FP/Projeto%20Físico.pdf)

---

## 📚 Table of Contents

1. [Course Objectives](#course-objectives)
2. [Project Overview](#final-project-32-bit-ieee-754-floating-point-multiplier)
3. [Technical Specifications](#technical-specifications)
4. [Project Structure](#project-structure)
5. [Prerequisites](#prerequisites)
6. [Quick Start](#quick-start)
7. [Design Flow](#design-flow-steps)
8. [Results](#results)
9. [Learnings](#relevant-learnings-from-the-course)
10. [Author](#author)

---

## 🎯 Course Objectives
- **Understand Theoretical Foundations**: Gain knowledge of the theoretical principles underlying integrated circuit design.
- **Comprehend Backend Flow**: Learn to analyze configuration files, reports, and key steps in a backend design flow.
- **Timing Analysis**: Explore timing aspects of circuits in a given fabrication technology.
- **Hands-on CAD Tool Experience**: Work with CAD tools in a practical setting to understand the physical design process.
- **Execute Backend Flow**: Perform the complete backend flow of a project, from HDL to GDSII.

## 🔄 Design Flow Steps

### 1. **Synthesis Analysis**
- **Design Rule Constraints**: During optimization, the logic synthesis tool ensures all design rule constraints are satisfied. These constraints may be derived from module or port attributes or from the technology library.
  - A design cannot proceed to further ASIC flow stages if the following constraints are not met:
    - **Max Transition**: Maximum signal transition time
    - **Max Fanout**: Maximum number of driven gates
    - **Max Capacitance**: Maximum load capacitance
- **Timing Verification**: Timing analysis is performed during synthesis to ensure all timing requirements are satisfied.

### 2. **Constraint Analysis**
- **Max Fanout**: Number of load gates connected to the output of a driving gate.
  - High fanout can slow down the driving gate.
- **Fan-in**: Number of inputs to a gate.

### 3. **Complete Backend Flow Stages**

#### Stage 1: General Definitions
- Define project hierarchy and naming conventions
- Set up working directories and file structure
- Configure tool settings and preferences

#### Stage 2: Loading Technology Files
- Load GPDK045 technology library
- Import timing libraries for different corners
- Configure physical library (LEF files)

#### Stage 3: Reading HDL Files
- Import SystemVerilog RTL description
- Parse design hierarchy
- Validate syntax and semantics

#### Stage 4: Elaborate
- Analyze design structure
- Build design database
- Identify hierarchy and connectivity

#### Stage 5: Applying Constraints
- Load timing constraints (SDC file)
- Set clock definitions and relationships
- Define input/output delays
- Set load and drive strengths

#### Stage 6: Generic Synthesis
- Technology-independent optimization
- Boolean minimization
- Resource sharing
- Initial area optimization

#### Stage 7: Mapped Synthesis
- Technology mapping to GPDK045 library
- Gate-level optimization
- Timing-driven optimization
- Area and power optimization

#### Stage 8: Synthesis Results Analysis
- Review timing reports (setup/hold)
- Analyze area utilization
- Check power consumption
- Verify design rule compliance

#### Stage 9: File Export
- Generate structural netlist (Verilog)
- Export timing information (SDF)
- Create constraint files for layout
- Generate synthesis reports

### 4. **Physical Implementation (Layout)**

#### Floorplanning
- Define chip dimensions
- Place I/O pads
- Create power grid
- Plan macro placement

#### Placement
- Initial global placement
- Detailed placement optimization
- Timing-driven placement
- Congestion optimization

#### Clock Tree Synthesis (CTS)
- Build balanced clock distribution
- Minimize clock skew
- Optimize clock latency
- Insert clock buffers

#### Routing
- Global routing planning
- Detailed routing
- Via minimization
- Timing and SI optimization

#### Physical Verification
- Design Rule Check (DRC)
- Layout vs. Schematic (LVS)
- Antenna rule checking
- Electrical rule checking

### 5. **Post-Layout Verification**
- Extract parasitics (RC)
- Back-annotate timing (SDF)
- Run gate-level simulation
- Verify functionality with delays
- Sign-off timing analysis

---

## 🎓 Relevant Learnings from the Course

### Project Implementation Overview

The final project implemented a 32-bit floating-point multiplier adhering to the IEEE 754 standard with support for "round toward zero" rounding mode. The project encapsulated the entire physical design flow, from RTL description in SystemVerilog to a fabrication-ready layout in 45nm technology.

**Key Implementation Features:**
- **State Machine Design**: 5-state FSM with one-hot encoding for efficient hardware implementation
- **Special Case Handling**: Comprehensive detection and processing of NaN, Infinity, and Zero inputs
- **Error Detection**: Real-time overflow and underflow detection with appropriate result generation
- **Normalization**: Automatic mantissa normalization and exponent adjustment
- **Verification**: Extensive testbench covering corner cases and IEEE 754 compliance

### Theoretical Knowledge Acquired
- **Floating-Point Representation**: Advanced understanding of the IEEE 754 standard and hardware arithmetic computation.
- **Timing and Performance**: Insights into critical paths, timing slack, and performance optimization techniques.
- **Power Analysis**: Comprehension of energy consumption components (dynamic, static, leakage) and reduction methods.
- **Process Corners**: Circuit behavior evaluation under varying process, voltage, and temperature (PVT) conditions.

### Technical Skills Developed
- **Complete Design Flow Execution**: Mastery of backend processes, from HDL to GDSII, including logic synthesis, floorplanning, placement, CTS, routing, and physical verification.
- **Static Timing Analysis (STA)**: Ability to interpret timing reports and resolve setup and hold violations.
- **Constraint Development**: Crafting timing and physical constraints to guide synthesis and implementation.
- **Automated Workflow**: Creating scripts to automate repetitive tasks, enhancing reproducibility and efficiency.

### Tool Proficiencies
- **Logic Synthesis**: Transforming RTL code into structural netlists with optimizations for area, timing, and power.
- **Physical Implementation**: Expertise in floorplanning, placement, CTS, and routing, accounting for trade-offs between quality metrics.
- **Physical Verification**: Using DRC (Design Rule Check) and LVS (Layout vs. Schematic) to ensure manufacturing compliance.
- **Post-Layout Simulation**: Validating designs with real delays through SDF-annotated simulations.

### Project Methodology Insights
- **Verification Importance**: Extensive multi-level verification was crucial to ensure design correctness.
- **Multi-Objective Optimization**: Balancing conflicting requirements (area, power, performance) based on project goals.
- **Architectural Decisions**: Recognizing how early architectural choices significantly impact final physical circuit metrics.
- **Automation Value**: Leveraging workflow automation to explore multiple configurations and ensure consistent results.

### Project Structure

The project follows a well-organized structure separating frontend (RTL and verification) from backend (synthesis and layout) components:

```
Physical-Project/
│
├── README.md                          # This file - Project documentation
├── SUMMARY.md                         # Bilingual project summary
├── .gitignore                         # Git ignore rules
│
└── Final_Project/
    ├── Especificações_do_Projeto_Final.pdf   # Project specifications
    │
    └── multiplier32FP/
        ├── Projeto Físico.pdf         # Complete project report
        ├── readme.txt                 # Detailed execution instructions
        ├── run_flow.sh               # Main automation script
        │
        ├── frontend/                  # RTL code and verification
        │   ├── multiplier32FP.sv     # RTL implementation
        │   ├── multiplier32FP_tb.sv  # Testbench with coverage
        │   ├── run_sim.sh            # Simulation script
        │   └── vetor.txt             # Test vectors
        │
        └── backend/                   # Physical design flow (not in repo)
            ├── synthesis/             # Logic synthesis
            │   ├── constraints/       # Timing constraints (SDC)
            │   ├── deliverables/      # Netlists and SDF files
            │   ├── reports/           # Area and timing reports
            │   ├── scripts/           # TCL automation scripts
            │   └── work/              # Working directory
            │
            ├── layout/                # Physical implementation
            │   ├── constraints/       # Physical constraints
            │   ├── deliverables/      # Post-layout files (DEF, SDF)
            │   ├── reports/           # Power and timing reports
            │   ├── scripts/           # Layout TCL scripts
            │   └── work/              # Working directory
            │
            └── verification/          # Post-synthesis verification
                └── work/              # Verification working directory
```

**Note:** The `backend/` directory structure is created during execution and contains generated files excluded from version control.

---

## 📦 Prerequisites

### Required Tools
- **Cadence Genus** - Logic synthesis
- **Cadence Innovus** - Physical layout
- **Cadence Xcelium** - Simulation and verification
- **GPDK045 PDK** - 45nm technology library

### Environment Setup
```bash
# Set required environment variables
export DESIGNS="multiplier32FP"
export USER="your_username"
export PROJECT_DIR="/path/to/project"
export TECH_DIR="/path/to/GPDK045"
```

### System Requirements
- Linux-based operating system
- Access to Cadence license server
- Minimum 16GB RAM recommended
- ~5GB free disk space for working files

---

## 🏃 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/jaquedebrito/Physical-Project.git
cd Physical-Project/Final_Project/multiplier32FP
```

### 2. Setup Environment
```bash
# Edit run_flow.sh with your paths
export PROJECT_DIR=/your/project/path
export TECH_DIR=/your/pdk/path
```

### 3. Run Logic Synthesis (10MHz)
```bash
./run_flow.sh
# Select option 1 from menu
```

### 4. Run Physical Layout (10MHz)
```bash
./run_flow.sh
# Select option 3 from menu
```

### 5. Run Simulation
```bash
cd frontend
./run_sim.sh
```

For detailed execution instructions, see [readme.txt](Final_Project/multiplier32FP/readme.txt).

---

## 🔄 Design Flow Steps

---

## 📊 Results

### Implementation Summary

| Metric | 10MHz Design | 110MHz Design |
|--------|--------------|---------------|
| **Clock Period** | 100ns | 9.09ns |
| **Status** | ✅ Timing Met | ✅ Timing Met |
| **Special Cases** | ✅ All Validated | ✅ All Validated |
| **DRC** | ✅ Clean | ✅ Clean |
| **LVS** | ✅ Clean | ✅ Clean |

### Key Accomplishments
- **IEEE 754 Compliance**: Full support for standard floating-point operations
- **Special Case Handling**: Correct treatment of NaN, Infinity, Zero, Overflow, and Underflow
- **Multi-Frequency Success**: Both 10MHz and 110MHz implementations meet all requirements
- **Verification Coverage**: Extensive testbench with edge case coverage
- **Manufacturing Ready**: DRC and LVS verified, layout ready for fabrication

### Automation in the Workflow
Automation scripts were developed to streamline the workflow, minimizing manual errors and boosting productivity. These scripts supported all stages, from synthesis to final verification, enabling:
- Rapid exploration of configurations and trade-offs.
- Reproducibility of the entire design flow.
- Comparative analysis across different design versions.
- Standardized report generation for consistent analysis.

### Conclusions

This final project provided a comprehensive application of the knowledge and skills acquired during the course. By implementing a 32-bit IEEE 754 multiplier, the project bridged high-level algorithmic considerations and detailed physical implementation.

The experience of contrasting implementations targeting 10MHz and 110MHz demonstrated the trade-offs in integrated circuit design and underscored the importance of structured design methodologies. Practical CAD tool experience and a complete understanding of the design flow leave students well-equipped for future, more complex projects.

---

## 👤 Author

**Jaqueline Ferreira de Brito**  
Microelectronics Specialization Student  
February 28, 2025

---

## 📄 License

This project is part of an academic course in Microelectronics. All rights reserved.

---

## 🙏 Acknowledgments

- Specialization in Microelectronics Course Instructors
- Cadence Design Systems for CAD tools
- IEEE for the 754 floating-point standard

---

## 📚 References

- IEEE Standard for Floating-Point Arithmetic (IEEE 754-2019)
- Cadence Genus Synthesis User Guide
- Cadence Innovus Implementation System User Guide
- GPDK045 Process Design Kit Documentation

---

**For more information, see:**
- 📄 [Detailed Summary (PT/EN)](SUMMARY.md)
- 📋 [Project Specification](Final_Project/Especificações_do_Projeto_Final.pdf)
- 📊 [Complete Report](Final_Project/multiplier32FP/Projeto%20Físico.pdf)
- 📖 [Execution Instructions](Final_Project/multiplier32FP/readme.txt)
