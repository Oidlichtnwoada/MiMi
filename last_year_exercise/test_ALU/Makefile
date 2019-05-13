all: compile

compile: 
	vsim -c -do "do scripts/compile.do;quit -f"

sim_alu: 
	vsim -c -do "do scripts/sim_alu.do;run 10 ms;quit -f"

clean:
	rm -fr work
	rm -f transcript
	rm -f *.wlf
	rm -f modelsim.ini

.PHONY: clean
.PHONY: compile

