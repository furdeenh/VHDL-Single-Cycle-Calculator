# Makefile for compiling a VHDL project with GHDL

# Compiler options for GHDL
FSYNOPSYS = -fsynopsys  # Option for Synopsys-specific packages

# VHDL source files
SOURCES = register_file.vhdl alu.vhdl controller.vhdl single_cycle_calculator.vhdl testbench.vhdl

# Top-level testbench entity
TESTBENCH = Testbench  # Name of the testbench entity

# Compile individual components
components:  # Target for compiling components
	ghdl -a $(FSYNOPSYS) register_file.vhdl  # Compile RegisterFile
	ghdl -a $(FSYNOPSYS) alu.vhdl  # Compile ALU
	ghdl -a $(FSYNOPSYS) controller.vhdl  # Compile Controller
	ghdl -a $(FSYNOPSYS) single_cycle_calculator.vhdl  # Compile Single-Cycle Calculator

# Compile and run the testbench
compile_all: components  # Target for compiling the testbench
	ghdl -a $(FSYNOPSYS) testbench.vhdl  # Compile testbench
	ghdl -e $(FSYNOPSYS) $(TESTBENCH)  # Elaborate the testbench

run_all: compile_all  # Target to run the testbench
	ghdl -r $(TESTBENCH) --vcd=output.vcd  # Run the testbench with VCD output

# Clean build artifacts
clean:  # Target for cleaning build artifacts
	ghdl --clean  # Clean GHDL-generated files

