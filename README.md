## Physical Design

**Course: Specialization in Microelectronics**  

### Course Objectives
- **Understand Theoretical Foundations**: Gain knowledge of the theoretical principles underlying integrated circuit design.
- **Comprehend Backend Flow**: Learn to analyze configuration files, reports, and key steps in a backend design flow.
- **Timing Analysis**: Explore timing aspects of circuits in a given fabrication technology.
- **Hands-on CAD Tool Experience**: Work with CAD tools in a practical setting to understand the physical design process.
- **Execute Backend Flow**: Perform the complete backend flow of a project, from HDL to GDSII.

### Key Steps in the Backend Design Flow

#### **Synthesis Analysis**
- **Design Rule Constraints**: During optimization, the logic synthesis tool ensures all design rule constraints are satisfied. These constraints may be derived from module or port attributes or from the technology library.
  - A design cannot proceed to further ASIC flow stages if the following constraints are not met:
    - **Max Transition**
    - **Max Fanout**
    - **Max Capacitance**
- **Timing Verification**: Timing analysis is performed during synthesis to ensure all timing requirements are satisfied.

#### **Constraint Analysis**
- **Max Fanout**: Number of load gates connected to the output of a driving gate.
  - High fanout can slow down the driving gate.
- **Fan-in**: Number of inputs to a gate.

#### **Stages in the Design Flow**
1. General Definitions
2. Loading Technology Files
3. Reading HDL Files
4. Elaborate
5. Applying Constraints
6. Generic Synthesis
7. Mapped Synthesis
8. Synthesis Results Analysis
9. File Export

## Final Project: 32-bit IEEE 754 Floating-Point Multiplier

### Project Overview
The final project implemented a 32-bit floating-point multiplier adhering to the IEEE 754 standard with support for "round toward zero" rounding mode. The project encapsulated the entire physical design flow, from RTL description in SystemVerilog to a fabrication-ready layout in 45nm technology.

### Relevant Learnings from the Course

#### **Theoretical Knowledge Acquired**
- **Floating-Point Representation**: Advanced understanding of the IEEE 754 standard and hardware arithmetic computation.
- **Timing and Performance**: Insights into critical paths, timing slack, and performance optimization techniques.
- **Power Analysis**: Comprehension of energy consumption components (dynamic, static, leakage) and reduction methods.
- **Process Corners**: Circuit behavior evaluation under varying process, voltage, and temperature (PVT) conditions.

#### **Technical Skills Developed**
- **Complete Design Flow Execution**: Mastery of backend processes, from HDL to GDSII, including logic synthesis, floorplanning, placement, CTS, routing, and physical verification.
- **Static Timing Analysis (STA)**: Ability to interpret timing reports and resolve setup and hold violations.
- **Constraint Development**: Crafting timing and physical constraints to guide synthesis and implementation.
- **Automated Workflow**: Creating scripts to automate repetitive tasks, enhancing reproducibility and efficiency.

#### **Tool Proficiencies**
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
The project was structured to streamline the physical design workflow:
```
multiplier32FP/
├── frontend/                 # RTL code and verification
├── backend/                  # Physical design flow files
│   ├── synthesis/            # Logic synthesis
│   ├── layout/               # Physical implementation
│   └── verification/         # Post-layout verification
└── docs/                     # Project documentation
```

### Automation in the Workflow
Automation scripts were developed to streamline the workflow, minimizing manual errors and boosting productivity. These scripts supported all stages, from synthesis to final verification, enabling:
- Rapid exploration of configurations and trade-offs.
- Reproducibility of the entire design flow.
- Comparative analysis across different design versions.
- Standardized report generation for consistent analysis.

### Conclusions
This final project provided a comprehensive application of the knowledge and skills acquired during the course. By implementing a 32-bit IEEE 754 multiplier, the project bridged high-level algorithmic considerations and detailed physical implementation.

The experience of contrasting implementations targeting 10MHz and 110MHz demonstrated the trade-offs in integrated circuit design and underscored the importance of structured design methodologies. Practical CAD tool experience and a complete understanding of the design flow leave students well-equipped for future, more complex projects.
