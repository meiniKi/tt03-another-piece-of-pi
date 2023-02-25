
DIR_ROOT 	= .
DIR_HW      = $(DIR_ROOT)/src
DIR_OUT		= $(DIR_ROOT)/out

#################################
# Simulation
#################################

ICARUS 		= iverilog
ICARUS_RTE  = vvp

SIM_TOP 		= $(DIR_HW)/tb.v
SIM_TOP_MODULE 	= tb

#################################
# Synthesis
#################################

VSRC = 	./$(DIR_HW)/decoder.v 		\
		./$(DIR_HW)/dpd.v 			\
		./$(DIR_HW)/meiniki_pi.v 	\
		./tb.v

default: all

.PHONY: sim
sim: clean
	@mkdir $(DIR_OUT)
	@$(ICARUS) -g2012 -s $(SIM_TOP_MODULE) -o $(DIR_OUT)/out $(VSRC)
	@cd out && $(ICARUS_RTE) out 

.PHONY: clean
clean:
	@rm -r $(DIR_OUT) || true
