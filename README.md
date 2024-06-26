# LC2K CPU in Verilog

This repository contains the source code for an LC2K CPU implemented in Verilog.

LC2K design is from EECS 370 Course @ University of Michigan - Ann Arbor. 

## LC2K Instructions Guide
LC2K ISA supports 32-bit address, 8 registors, and 8 opcodes.
<img width="886" alt="Screenshot 2024-06-26 at 9 51 40 PM" src="https://github.com/jinw06k/lc2k-cpu/assets/49907866/d353dec8-8eb0-4a39-b457-7847ec64f045">

## CPU Design Diagram
![cpu_design](https://github.com/jinw06k/lc2k-cpu/assets/49907866/de797f0a-99e8-407f-95ff-c3fccabfd371)
![cpu_inout_design](https://github.com/jinw06k/lc2k-cpu/assets/49907866/2219b768-7bc2-4128-8d42-ead387338dd5)

## Simulation
The LC2K assembly language program can be run using iverilog vvp command. 
```
iverilog -o dsn ALU_ValB_Mux.v ALU.v Clock.V Control_ROM.v CPU.v Data_Memory.v Instr_Memory.v Program_Counter.v Program_Mux.v Reg_Memory.v Sign_Extend.v Write_Data_Mux.v Write_Reg_Mux.v
vvp dsn
```
<br />
With $monitor display, I was able to produce the log of value changes in register 1. In the following program, REG1 begins with loading the value of 5 [PC=0], and inside the loop, it decreases by 1 until the value equals 2 [PC=3-5]. Then, the program performs load and store actions where the value of REG1 becomes 7 [PC=7-9]. Finally, REG1 loads the changed value from memory and gets the value 2 [PC=10].
<br />
<img width="733" alt="Screenshot 2024-06-29 at 10 06 38 PM" src="https://github.com/jinw06k/lc2k-cpu/assets/49907866/74218c9c-7cef-4a3b-9e12-d755f912bc9c">
<br />
<br />
A VCD file was also generated to check the working functionality of all individual modules. 
<br />
<img width="1383" alt="Screenshot 2024-06-29 at 10 06 20 PM" src="https://github.com/jinw06k/lc2k-cpu/assets/49907866/00137e77-1002-4b86-b374-fea96f8ee706">

## FPGA Demo
I have used Tang Nano 20k FPGA to run my CPU and a demo program. Tang Nano 20k is a Gowin FPGA based board, so I used Gowin EDA to synthesize the code and hooked up some LEDs to check it working. 
https://youtu.be/ApysinIOpjY

[![Demo Video](https://img.youtube.com/vi/ApysinIOpjY/0.jpg)](https://www.youtube.com/watch?v=ApysinIOpjY)

## Todo

- [x] Run it on FPGA 
- [ ] Multicycle Implementation
- [ ] Pipeline Implementation
