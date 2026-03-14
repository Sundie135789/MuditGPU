SRCS = pll.v regfile.v alu.v
SIM = sim

all:
	iverilog -o $(SIM) $(SRCS) && vvp $(SIM) && gtkwave out.vcd

clean:
	rm -f $(SIM) out.vcd
