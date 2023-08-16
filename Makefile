ifeq (run,$(firstword $(MAKECMDGOALS)))
 RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
 $(eval $(RUN_ARGS):;@:)
endif

run :
	@./c.sh $(RUN_ARGS)
	@iverilog -o out top/top_test.v
	@vvp out

dc :
	dc_shell-t -f runscript.tcl | tee log