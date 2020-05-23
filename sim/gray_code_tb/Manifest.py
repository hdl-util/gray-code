action = "simulation"
sim_tool = "modelsim"
sim_top = "gray_code_tb"

sim_post_cmd = "vsim -novopt -do ../vsim.do -c gray_code_tb"

modules = {
  "local" : [ "../../test/" ],
}
