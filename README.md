# DE10-Lite-Code-Cracker

A progam that takes a user input using switches from the DE10-Lite FPGA board. This input can be used to create a password or to crack a password using the binary input of the switches.
Users can overwrite existing passwords only if the existing password has already been cracked.
The 7-segment display is used to display error messages to the user if the password is incorrect, or if the password is not able to be reset.

This program was developed using Quartus Prime on the DE10-Lite board from Intel. Project.sv is a SystemVerilog file that contains the main code for the program
