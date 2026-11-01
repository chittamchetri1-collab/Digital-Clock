# Digital-Clock
# Digital Clock Design Using Verilog HDL and Xilinx Vivado

## 1. Project Overview

This project focuses on the design and implementation of a digital clock using **Verilog Hardware Description Language (HDL)** and **Xilinx Vivado 2025.2**.

The design uses a 100 MHz input clock, a 27-bit clock divider, and sequential counter modules to track seconds, minutes, and hours. The counters are interconnected to implement the cascading operation of a 24-hour digital clock.

The project demonstrates fundamental concepts of digital system design, including clock division, sequential logic, counter design, module instantiation, and FPGA synthesis.

## 2. Project Objectives

- Design a digital clock using Verilog HDL.
- Generate a slower clock signal using a 27-bit clock divider.
- Implement seconds, minutes, and hours counters.
- Establish cascading connections between the counter modules.
- Verify counter functionality using behavioral simulation.
- Analyze FPGA hardware resource utilization using Vivado synthesis reports.

## 3. Design Architecture

The project consists of the following functional blocks:

1. **Clock Divider:** Uses a 27-bit counter and bit selection to generate a slower clock signal from the 100 MHz input clock.
2. **Seconds Counter:** Counts from 00 to 59 and generates a minute tick when the count rolls over.
3. **Minutes Counter:** Counts from 00 to 59 and increments when the seconds counter completes one cycle.
4. **Hours Counter:** Counts from 00 to 23 and increments when the minutes counter completes one cycle.
5. **Top-Level Module:** Integrates the clock divider and counter modules into a complete digital clock design.


## 4. Technologies and Tools Used

| Category | Technology |
|---|---|
| Hardware Description Language | Verilog HDL |
| Design and Simulation Tool | Xilinx Vivado 2025.2 |
| FPGA Family | Kintex-7 |
| Target Device | xc7k70tfbv676-1 |
| Verification | Behavioral Simulation |
| Synthesis Analysis | Vivado Synthesis |
| Debugging | Integrated Logic Analyzer (ILA) - planned |

## 5. Verilog Modules

The project is organized into the following modules:

| Module | Description |
|---|---|
| `digital_clock_top` | Top-level module integrating the design |
| `clock_divider` | Generates a slower clock using a 27-bit counter |
| `digital_clock_counters` | Connects the seconds, minutes, and hours counters |
| `seconds_counter` | Counts seconds from 00 to 59 |
| `minutes_counter` | Counts minutes from 00 to 59 |
| `hours_counter` | Counts hours from 00 to 23 |
| `digital_clock_tb` | Verilog testbench for behavioral simulation |

## 6. Simulation and Verification

The design was tested using **Xilinx Vivado 2025.2 Behavioral Simulation**.

The simulation waveform demonstrates the operation and interaction of the seconds, minutes, and hours counters.

### Simulation Observations

- The seconds counter operates within the range of 00–59.
- The minutes counter increments when the seconds counter rolls over from 59 to 00.
- The hours counter increments when the minutes counter rolls over from 59 to 00.
- The cascading counter operation was observed in the simulation waveform.

### Important Waveform Observations

The simulation waveform demonstrates:

- Seconds, minutes, and hours counter signals.
- Binary transitions of individual counter bits.
- Minutes rollover from 59 to 00.
- Hours increment from 1 to 2 following the minute rollover.

### Simulation Screenshot

![Digital Clock Simulation Waveform]([images/digital_clock_waveform.png](https://github.com/chittamchetri1-collab/Digital-Clock/blob/main/waveform.png))

*Figure 1: Vivado behavioral simulation waveform showing the seconds, minutes, and hours counter transitions.*

**Verification Tool:** Xilinx Vivado 2025.2  
**Verification Method:** Verilog Behavioral Simulation

## 7. FPGA Resource Utilization Report

The FPGA resource utilization was analyzed using the Vivado `report_utilization` command after synthesis.

**Target Device:** xc7k70tfbv676-1  
**Design Name:** digital_clock_top  
**Synthesis Tool:** Xilinx Vivado 2025.2

### Resource Utilization Summary

| FPGA Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| Slice LUTs | 17 | 41,000 | 0.04% |
| Slice Registers | 46 | 82,000 | 0.06% |
| Block RAM Tiles | 0 | 135 | 0.00% |
| DSPs | 0 | 240 | 0.00% |
| Bonded IOBs | 19 | 300 | 6.33% |
| BUFGCTRL | 1 | 32 | 3.13% |

### Register Utilization

The synthesized design uses 46 flip-flops for sequential logic.

| Register Type | Count |
|---|---:|
| Total Registers | 46 |
| Registers with Synchronous Reset | 46 |
| Registers with Asynchronous Reset | 0 |
| Registers with Clock Enable | 46 |


### Resource Analysis

- The design utilizes only 17 LUTs (0.04%) of the available slice LUT resources.
- A total of 46 slice registers (0.06%) are used for sequential operations.
- No Block RAM or DSP resources are required.
- The design uses one BUFGCTRL resource for clock distribution.
- The reported bonded I/O utilization is 6.33%.

These results indicate that the synthesized digital clock design has a relatively small FPGA resource requirement on the selected Kintex-7 device.

*Note: The above figures are post-synthesis resource utilization results, not final post-implementation utilization or proof of timing closure.*

## 8. Current Project Status

| Project Stage | Status |
|---|---|
| Verilog module development | Completed |
| Top-level module integration | Completed |
| Behavioral simulation | Performed |
| Counter rollover verification | Observed in simulation |
| RTL elaboration | Completed |
| FPGA synthesis | Completed |
| FPGA implementation | Completed |
| Resource utilization analysis | Completed |
| ILA-based hardware debugging | Pending |
| Physical FPGA board testing | Not yet verified |

## 9. Future Improvements

- Verify and improve the clock divider frequency to achieve an accurate 1 Hz clock.
- Add appropriate timing constraints for reliable FPGA timing analysis.
- Integrate the Integrated Logic Analyzer (ILA) for real-time signal monitoring.
- Test the complete design on a compatible physical FPGA development board.
- Explore improvements in clock distribution and timing optimization.

## 10. Learning Outcomes

Through this project, I gained practical experience in:

- Writing synthesizable Verilog HDL code.
- Designing sequential logic circuits.
- Understanding clock dividers and binary counters.
- Connecting multiple Verilog modules using module instantiation.
- Creating and running Verilog testbenches.
- Analyzing simulation waveforms in Vivado.
- Understanding FPGA synthesis and hardware resource utilization.

## Author

**Chittam Chetri**

B.Tech – Electronics and Communication Engineering  
Tezpur University, Assam, India

**Areas of Interest:** VLSI Design, Digital System Design, FPGA Design, and Semiconductor Technology.

---

*This project was developed as an academic mini-project to gain practical experience in FPGA-based digital system design using Verilog HDL and Xilinx Vivado.*
