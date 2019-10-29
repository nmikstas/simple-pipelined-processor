# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "REG0_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG1_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG2_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG3_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG4_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG5_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG6_INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REG7_INIT" -parent ${Page_0}


}

proc update_PARAM_VALUE.REG0_INIT { PARAM_VALUE.REG0_INIT } {
	# Procedure called to update REG0_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG0_INIT { PARAM_VALUE.REG0_INIT } {
	# Procedure called to validate REG0_INIT
	return true
}

proc update_PARAM_VALUE.REG1_INIT { PARAM_VALUE.REG1_INIT } {
	# Procedure called to update REG1_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG1_INIT { PARAM_VALUE.REG1_INIT } {
	# Procedure called to validate REG1_INIT
	return true
}

proc update_PARAM_VALUE.REG2_INIT { PARAM_VALUE.REG2_INIT } {
	# Procedure called to update REG2_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG2_INIT { PARAM_VALUE.REG2_INIT } {
	# Procedure called to validate REG2_INIT
	return true
}

proc update_PARAM_VALUE.REG3_INIT { PARAM_VALUE.REG3_INIT } {
	# Procedure called to update REG3_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG3_INIT { PARAM_VALUE.REG3_INIT } {
	# Procedure called to validate REG3_INIT
	return true
}

proc update_PARAM_VALUE.REG4_INIT { PARAM_VALUE.REG4_INIT } {
	# Procedure called to update REG4_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG4_INIT { PARAM_VALUE.REG4_INIT } {
	# Procedure called to validate REG4_INIT
	return true
}

proc update_PARAM_VALUE.REG5_INIT { PARAM_VALUE.REG5_INIT } {
	# Procedure called to update REG5_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG5_INIT { PARAM_VALUE.REG5_INIT } {
	# Procedure called to validate REG5_INIT
	return true
}

proc update_PARAM_VALUE.REG6_INIT { PARAM_VALUE.REG6_INIT } {
	# Procedure called to update REG6_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG6_INIT { PARAM_VALUE.REG6_INIT } {
	# Procedure called to validate REG6_INIT
	return true
}

proc update_PARAM_VALUE.REG7_INIT { PARAM_VALUE.REG7_INIT } {
	# Procedure called to update REG7_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG7_INIT { PARAM_VALUE.REG7_INIT } {
	# Procedure called to validate REG7_INIT
	return true
}


proc update_MODELPARAM_VALUE.REG0_INIT { MODELPARAM_VALUE.REG0_INIT PARAM_VALUE.REG0_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG0_INIT}] ${MODELPARAM_VALUE.REG0_INIT}
}

proc update_MODELPARAM_VALUE.REG1_INIT { MODELPARAM_VALUE.REG1_INIT PARAM_VALUE.REG1_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG1_INIT}] ${MODELPARAM_VALUE.REG1_INIT}
}

proc update_MODELPARAM_VALUE.REG2_INIT { MODELPARAM_VALUE.REG2_INIT PARAM_VALUE.REG2_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG2_INIT}] ${MODELPARAM_VALUE.REG2_INIT}
}

proc update_MODELPARAM_VALUE.REG3_INIT { MODELPARAM_VALUE.REG3_INIT PARAM_VALUE.REG3_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG3_INIT}] ${MODELPARAM_VALUE.REG3_INIT}
}

proc update_MODELPARAM_VALUE.REG4_INIT { MODELPARAM_VALUE.REG4_INIT PARAM_VALUE.REG4_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG4_INIT}] ${MODELPARAM_VALUE.REG4_INIT}
}

proc update_MODELPARAM_VALUE.REG5_INIT { MODELPARAM_VALUE.REG5_INIT PARAM_VALUE.REG5_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG5_INIT}] ${MODELPARAM_VALUE.REG5_INIT}
}

proc update_MODELPARAM_VALUE.REG6_INIT { MODELPARAM_VALUE.REG6_INIT PARAM_VALUE.REG6_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG6_INIT}] ${MODELPARAM_VALUE.REG6_INIT}
}

proc update_MODELPARAM_VALUE.REG7_INIT { MODELPARAM_VALUE.REG7_INIT PARAM_VALUE.REG7_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG7_INIT}] ${MODELPARAM_VALUE.REG7_INIT}
}

