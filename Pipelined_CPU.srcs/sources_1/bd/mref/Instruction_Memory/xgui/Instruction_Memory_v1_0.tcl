# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DEPTH_BITS" -parent ${Page_0}


}

proc update_PARAM_VALUE.DEPTH_BITS { PARAM_VALUE.DEPTH_BITS } {
	# Procedure called to update DEPTH_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEPTH_BITS { PARAM_VALUE.DEPTH_BITS } {
	# Procedure called to validate DEPTH_BITS
	return true
}


proc update_MODELPARAM_VALUE.DEPTH_BITS { MODELPARAM_VALUE.DEPTH_BITS PARAM_VALUE.DEPTH_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEPTH_BITS}] ${MODELPARAM_VALUE.DEPTH_BITS}
}

