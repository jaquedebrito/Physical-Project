# 32-bit IEEE 754 Floating-Point Multiplier - Project Documentation

## Project Information

**Project Name:** multiplier32FP  
**Author:** Jaqueline Ferreira de Brito  
**Date:** February 28, 2025  
**Course:** Specialization in Microelectronics - Physical Design  

## Quick Reference

### Files in This Directory

- **Especificações_do_Projeto_Final.pdf** - Original project specifications and requirements
- **multiplier32FP/** - Main project directory containing all implementation files
  - **Projeto Físico.pdf** - Complete project report with results and analysis
  - **readme.txt** - Detailed execution instructions
  - **run_flow.sh** - Main automation script for synthesis and layout
  - **frontend/** - RTL design and verification files

## Project Objectives

1. **Design**: Implement a 32-bit IEEE 754 floating-point multiplier in SystemVerilog
2. **Synthesis**: Perform logic synthesis using Cadence Genus at 10MHz and 110MHz
3. **Layout**: Complete physical implementation using Cadence Innovus
4. **Verification**: Validate design functionality at all stages
5. **Analysis**: Generate comprehensive reports on area, timing, and power

## Getting Started

### Quick Navigation

1. **To understand the project requirements**: Read `Especificações_do_Projeto_Final.pdf`
2. **To see complete results and analysis**: Read `multiplier32FP/Projeto Físico.pdf`
3. **To run the design flow**: Follow instructions in `multiplier32FP/readme.txt`
4. **To understand the RTL design**: See `multiplier32FP/frontend/multiplier32FP.sv`

### Execution Overview

The main automation script (`run_flow.sh`) provides an interactive menu for:
- Running logic synthesis at different frequencies
- Generating physical layouts
- Running simulations with timing annotation
- Generating verification waveforms (VCD files)

For detailed step-by-step instructions, refer to the [readme.txt](multiplier32FP/readme.txt) file.

## Design Highlights

### IEEE 754 Compliance
- Single precision (32-bit) format
- Sign-magnitude representation
- 8-bit exponent with bias of 127
- 23-bit mantissa with implicit leading 1

### Special Cases Handled
✅ **NaN (Not a Number)** - Invalid operations  
✅ **Infinity** - Overflow to infinity  
✅ **Zero** - Signed zero handling  
✅ **Denormalized Numbers** - Subnormal number support  
✅ **Overflow** - Exponent overflow detection  
✅ **Underflow** - Exponent underflow detection  

### State Machine
The design uses a 5-state FSM with one-hot encoding:
1. **IDLE** - Waiting for start signal
2. **CHECK_SPECIAL** - Detecting special cases
3. **MULTIPLY** - Performing mantissa multiplication
4. **NORMALIZE** - Normalizing result
5. **DONE** - Operation complete

## Multi-Frequency Implementation

### 10MHz Design
- **Clock Period**: 100ns
- **Focus**: Area and power optimization
- **Application**: Low-power embedded systems

### 110MHz Design
- **Clock Period**: 9.09ns
- **Focus**: Performance optimization
- **Application**: High-performance computing

Both designs demonstrate the trade-offs between performance, area, and power consumption in IC design.

## Verification Strategy

### Testbench Coverage
- Random test vectors for general functionality
- Targeted tests for special cases (NaN, Infinity, Zero)
- Edge case testing (maximum/minimum values)
- Glitch detection and state monitoring
- IEEE 754 compliance verification

### Simulation Levels
1. **RTL Simulation** - Functional verification without timing
2. **Post-Synthesis Simulation** - Gate-level with estimated delays
3. **Post-Layout Simulation** - Final verification with extracted delays

## Reports and Deliverables

### Synthesis Deliverables
- Structural netlist (Verilog)
- Timing constraints (SDC)
- Standard Delay Format (SDF) files
- Area reports
- Timing reports (setup/hold)

### Layout Deliverables
- Physical netlist
- DEF (Design Exchange Format) file
- Post-layout SDF
- Power analysis reports
- DRC/LVS verification reports

## Technology Information

**Process Node:** 45nm  
**PDK:** Cadence GPDK045  
**Standard Cell Library:** gsclib045  
**Operating Voltage:** 1.0V  
**Operating Temperature:** 25°C (typical)  

## Learning Outcomes

This project demonstrates:
- Complete ASIC design flow from RTL to GDSII
- Handling of complex arithmetic operations in hardware
- Multi-objective optimization (area vs. performance)
- Verification methodology and best practices
- CAD tool proficiency (Genus, Innovus, Xcelium)
- Constraint development and timing closure
- Physical design awareness and DFM principles

## References

1. IEEE Standard 754-2019 - Floating-Point Arithmetic
2. Cadence Genus Synthesis Solution User Guide
3. Cadence Innovus Implementation System User Guide
4. GPDK045 Process Design Kit Documentation
5. SystemVerilog IEEE Standard 1800-2017

## Support

For questions or clarifications about this project:
- Review the complete project report in `Projeto Físico.pdf`
- Check the detailed execution instructions in `readme.txt`
- Refer to the course materials and references
- Contact the course instructors

---

**Note:** This is an academic project. The backend directory structure (synthesis, layout, verification) is created during execution and contains generated files that are not included in the repository.
