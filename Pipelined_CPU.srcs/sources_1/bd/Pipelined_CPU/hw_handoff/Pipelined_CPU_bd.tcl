
################################################################
# This is a generated script based on design: Pipelined_CPU
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source Pipelined_CPU_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ALU, ALU_MUX, Branch_AND, Branch_Adder, Branch_MUX, Compare, Control, Data_Memory, Dmem_MUX, EX_MEM, Flush_Control, Forward_MUX, Forward_MUX, Forward_MUX, Forward_MUX, Forwarding_Logic, ID_EX, IF_ID, Instruction_Memory, Left_Shifter, MEM_WB, Mem_DMUX, Mem_MUX, OR_gate, PC_Adder, PC_MUX, Program_Counter, Reg_MUX, Reg_MUX, Register_File, Sign_Extension, Stall_Control, Stall_MUX, Unsigned_Extension

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35tcpg236-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name Pipelined_CPU

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set an [ create_bd_port -dir O -from 7 -to 0 an ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set led [ create_bd_port -dir O -from 15 -to 0 led ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set seg [ create_bd_port -dir O -from 6 -to 0 seg ]

  # Create instance: ALU_0, and set properties
  set block_name ALU
  set block_cell_name ALU_0
  if { [catch {set ALU_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ALU_MUX_0, and set properties
  set block_name ALU_MUX
  set block_cell_name ALU_MUX_0
  if { [catch {set ALU_MUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_MUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Branch_AND, and set properties
  set block_name Branch_AND
  set block_cell_name Branch_AND
  if { [catch {set Branch_AND [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Branch_AND eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Branch_Adder, and set properties
  set block_name Branch_Adder
  set block_cell_name Branch_Adder
  if { [catch {set Branch_Adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Branch_Adder eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Branch_MUX_0, and set properties
  set block_name Branch_MUX
  set block_cell_name Branch_MUX_0
  if { [catch {set Branch_MUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Branch_MUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Compare, and set properties
  set block_name Compare
  set block_cell_name Compare
  if { [catch {set Compare [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Compare eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Constant_2, and set properties
  set Constant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 Constant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {2} \
   CONFIG.CONST_WIDTH {32} \
 ] $Constant_2

  # Create instance: Control, and set properties
  set block_name Control
  set block_cell_name Control
  if { [catch {set Control [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Control eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Data_Memory_0, and set properties
  set block_name Data_Memory
  set block_cell_name Data_Memory_0
  if { [catch {set Data_Memory_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Data_Memory_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.MEM00_INIT {0x0000000c} \
   CONFIG.MEM01_INIT {0x0000000a} \
   CONFIG.MEM02_INIT {0x00000010} \
   CONFIG.MEM03_INIT {0x00000002} \
   CONFIG.MEM05_INIT {0x00000006} \
   CONFIG.MEM06_INIT {0x00000008} \
   CONFIG.MEM07_INIT {0x0000000A} \
   CONFIG.MEM08_INIT {0x0000000C} \
   CONFIG.MEM09_INIT {0x0000000e} \
   CONFIG.MEM10_INIT {0x00000010} \
   CONFIG.MEM11_INIT {0x00000012} \
   CONFIG.MEM12_INIT {0x00000014} \
   CONFIG.MEM13_INIT {0x00000000} \
   CONFIG.MEM14_INIT {0x00000000} \
   CONFIG.MEM15_INIT {0x00000000} \
   CONFIG.MEM16_INIT {0x00000000} \
   CONFIG.MEM17_INIT {0x00000000} \
   CONFIG.MEM18_INIT {0x00000000} \
   CONFIG.MEM19_INIT {0x00000000} \
   CONFIG.MEM20_INIT {0x00000000} \
   CONFIG.MEM21_INIT {0x00000000} \
   CONFIG.MEM22_INIT {0x00000000} \
   CONFIG.MEM23_INIT {0x00000000} \
   CONFIG.MEM24_INIT {0x00000000} \
   CONFIG.MEM25_INIT {0x00000000} \
   CONFIG.MEM26_INIT {0x00000000} \
   CONFIG.MEM27_INIT {0x00000000} \
   CONFIG.MEM28_INIT {0x00000000} \
   CONFIG.MEM29_INIT {0x00000000} \
 ] $Data_Memory_0

  # Create instance: Dmem_MUX_0, and set properties
  set block_name Dmem_MUX
  set block_cell_name Dmem_MUX_0
  if { [catch {set Dmem_MUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Dmem_MUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: EX_MEM_0, and set properties
  set block_name EX_MEM
  set block_cell_name EX_MEM_0
  if { [catch {set EX_MEM_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $EX_MEM_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Flush_Control, and set properties
  set block_name Flush_Control
  set block_cell_name Flush_Control
  if { [catch {set Flush_Control [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Flush_Control eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forward_MUX_0, and set properties
  set block_name Forward_MUX
  set block_cell_name Forward_MUX_0
  if { [catch {set Forward_MUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forward_MUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forward_MUX_1, and set properties
  set block_name Forward_MUX
  set block_cell_name Forward_MUX_1
  if { [catch {set Forward_MUX_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forward_MUX_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forward_MUX_2, and set properties
  set block_name Forward_MUX
  set block_cell_name Forward_MUX_2
  if { [catch {set Forward_MUX_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forward_MUX_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forward_MUX_3, and set properties
  set block_name Forward_MUX
  set block_cell_name Forward_MUX_3
  if { [catch {set Forward_MUX_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forward_MUX_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Forwarding_Logic_0, and set properties
  set block_name Forwarding_Logic
  set block_cell_name Forwarding_Logic_0
  if { [catch {set Forwarding_Logic_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Forwarding_Logic_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ID_EX_0, and set properties
  set block_name ID_EX
  set block_cell_name ID_EX_0
  if { [catch {set ID_EX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ID_EX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: IF_ID, and set properties
  set block_name IF_ID
  set block_cell_name IF_ID
  if { [catch {set IF_ID [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $IF_ID eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Instruction_Memory, and set properties
  set block_name Instruction_Memory
  set block_cell_name Instruction_Memory
  if { [catch {set Instruction_Memory [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Instruction_Memory eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Left_Shifter, and set properties
  set block_name Left_Shifter
  set block_cell_name Left_Shifter
  if { [catch {set Left_Shifter [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Left_Shifter eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MEM_WB_0, and set properties
  set block_name MEM_WB
  set block_cell_name MEM_WB_0
  if { [catch {set MEM_WB_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MEM_WB_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Mem_DMUX_0, and set properties
  set block_name Mem_DMUX
  set block_cell_name Mem_DMUX_0
  if { [catch {set Mem_DMUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Mem_DMUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Mem_MUX_0, and set properties
  set block_name Mem_MUX
  set block_cell_name Mem_MUX_0
  if { [catch {set Mem_MUX_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Mem_MUX_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: OR_gate, and set properties
  set block_name OR_gate
  set block_cell_name OR_gate
  if { [catch {set OR_gate [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $OR_gate eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC_Adder, and set properties
  set block_name PC_Adder
  set block_cell_name PC_Adder
  if { [catch {set PC_Adder [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC_Adder eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: PC_MUX, and set properties
  set block_name PC_MUX
  set block_cell_name PC_MUX
  if { [catch {set PC_MUX [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PC_MUX eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Program_Counter, and set properties
  set block_name Program_Counter
  set block_cell_name Program_Counter
  if { [catch {set Program_Counter [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Program_Counter eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Reg_MUX_A, and set properties
  set block_name Reg_MUX
  set block_cell_name Reg_MUX_A
  if { [catch {set Reg_MUX_A [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Reg_MUX_A eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Reg_MUX_B, and set properties
  set block_name Reg_MUX
  set block_cell_name Reg_MUX_B
  if { [catch {set Reg_MUX_B [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Reg_MUX_B eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Register_File, and set properties
  set block_name Register_File
  set block_cell_name Register_File
  if { [catch {set Register_File [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Register_File eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Sign_Extension, and set properties
  set block_name Sign_Extension
  set block_cell_name Sign_Extension
  if { [catch {set Sign_Extension [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Sign_Extension eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Stall_Control_0, and set properties
  set block_name Stall_Control
  set block_cell_name Stall_Control_0
  if { [catch {set Stall_Control_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Stall_Control_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Stall_MUX, and set properties
  set block_name Stall_MUX
  set block_cell_name Stall_MUX
  if { [catch {set Stall_MUX [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Stall_MUX eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Unsigned_Extension_0, and set properties
  set block_name Unsigned_Extension
  set block_cell_name Unsigned_Extension_0
  if { [catch {set Unsigned_Extension_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Unsigned_Extension_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ALU_0_s [get_bd_pins ALU_0/s] [get_bd_pins EX_MEM_0/alu_out]
  connect_bd_net -net ALU_MUX_0_o [get_bd_pins ALU_MUX_0/o] [get_bd_pins Forward_MUX_3/normal]
  connect_bd_net -net Branch_AND_0_branch [get_bd_pins Branch_AND/branch] [get_bd_pins Flush_Control/branch] [get_bd_pins PC_MUX/branch_select]
  connect_bd_net -net Branch_Adder_0_branch_address [get_bd_pins Branch_Adder/branch_address] [get_bd_pins PC_MUX/branch_address]
  connect_bd_net -net Branch_MUX_0_r [get_bd_pins Branch_MUX_0/r] [get_bd_pins Forwarding_Logic_0/IF_ID_r2] [get_bd_pins ID_EX_0/r2_store] [get_bd_pins Register_File/r2]
  connect_bd_net -net Compare_eq [get_bd_pins Branch_AND/compare] [get_bd_pins Compare/eq]
  connect_bd_net -net Constant_2_dout [get_bd_pins Constant_2/dout] [get_bd_pins PC_Adder/constnt]
  connect_bd_net -net Control_add_sub [get_bd_pins Control/add_sub] [get_bd_pins Stall_MUX/add_sub]
  connect_bd_net -net Control_brnch [get_bd_pins Branch_AND/branch_inst] [get_bd_pins Control/brnch] [get_bd_pins OR_gate/a] [get_bd_pins Stall_Control_0/branch]
  connect_bd_net -net Control_dat_mem [get_bd_pins Control/dat_mem] [get_bd_pins Stall_MUX/dm]
  connect_bd_net -net Control_jmp [get_bd_pins Control/jmp] [get_bd_pins Flush_Control/jump] [get_bd_pins PC_MUX/jump_select]
  connect_bd_net -net Control_ld [get_bd_pins Control/ld] [get_bd_pins Stall_MUX/ld]
  connect_bd_net -net Control_reg_lit [get_bd_pins Control/reg_lit] [get_bd_pins Stall_MUX/reg_lit]
  connect_bd_net -net Control_str [get_bd_pins Control/str] [get_bd_pins OR_gate/b] [get_bd_pins Stall_MUX/str]
  connect_bd_net -net Data_Memory_0_M_data_out [get_bd_pins Data_Memory_0/M_data_out] [get_bd_pins MEM_WB_0/dmem_out]
  connect_bd_net -net Data_Memory_0_an [get_bd_ports an] [get_bd_pins Data_Memory_0/an]
  connect_bd_net -net Data_Memory_0_led [get_bd_ports led] [get_bd_pins Data_Memory_0/led]
  connect_bd_net -net Data_Memory_0_seg [get_bd_ports seg] [get_bd_pins Data_Memory_0/seg]
  connect_bd_net -net Dmem_MUX_0_o [get_bd_pins Dmem_MUX_0/o] [get_bd_pins Forward_MUX_0/MEM_WB_mux_out] [get_bd_pins Forward_MUX_1/MEM_WB_mux_out] [get_bd_pins Forward_MUX_2/MEM_WB_mux_out] [get_bd_pins Forward_MUX_3/MEM_WB_mux_out] [get_bd_pins Mem_DMUX_0/WB_odata] [get_bd_pins Mem_MUX_0/wb] [get_bd_pins Reg_MUX_A/reg_data_in] [get_bd_pins Reg_MUX_B/reg_data_in] [get_bd_pins Register_File/dat]
  connect_bd_net -net EX_MEM_0__alu_out [get_bd_pins Data_Memory_0/M_address] [get_bd_pins EX_MEM_0/_alu_out] [get_bd_pins Forward_MUX_0/EX_MEM_rd] [get_bd_pins Forward_MUX_1/EX_MEM_rd] [get_bd_pins Forward_MUX_2/EX_MEM_rd] [get_bd_pins Forward_MUX_3/EX_MEM_rd] [get_bd_pins MEM_WB_0/alu_out] [get_bd_pins Mem_MUX_0/mem]
  connect_bd_net -net EX_MEM_0__dm [get_bd_pins EX_MEM_0/_dm] [get_bd_pins MEM_WB_0/dm] [get_bd_pins Stall_Control_0/EX_MEM_dat_mem]
  connect_bd_net -net EX_MEM_0__dmem_data [get_bd_pins EX_MEM_0/_dmem_data] [get_bd_pins Mem_DMUX_0/MEM_mdata]
  connect_bd_net -net EX_MEM_0__ld [get_bd_pins EX_MEM_0/_ld] [get_bd_pins Forwarding_Logic_0/MEM_load] [get_bd_pins MEM_WB_0/ld]
  connect_bd_net -net EX_MEM_0__r2_store [get_bd_pins EX_MEM_0/_r2_store] [get_bd_pins Forwarding_Logic_0/MEM_r2_store]
  connect_bd_net -net EX_MEM_0__rd [get_bd_pins EX_MEM_0/_rd] [get_bd_pins Forwarding_Logic_0/MEM_rd] [get_bd_pins MEM_WB_0/rd]
  connect_bd_net -net EX_MEM_0__str [get_bd_pins Data_Memory_0/we] [get_bd_pins EX_MEM_0/_str] [get_bd_pins Forwarding_Logic_0/MEM_store]
  connect_bd_net -net Flush_Control_0_flush [get_bd_pins Flush_Control/flush] [get_bd_pins IF_ID/flush]
  connect_bd_net -net Forward_MUX_0_o [get_bd_pins Compare/r1] [get_bd_pins Forward_MUX_0/o]
  connect_bd_net -net Forward_MUX_1_o [get_bd_pins Compare/r2] [get_bd_pins Forward_MUX_1/o]
  connect_bd_net -net Forward_MUX_2_o [get_bd_pins ALU_0/a] [get_bd_pins Forward_MUX_2/o]
  connect_bd_net -net Forward_MUX_3_o [get_bd_pins ALU_0/b] [get_bd_pins Forward_MUX_3/o]
  connect_bd_net -net Forwarding_Logic_0_a [get_bd_pins Forward_MUX_2/s] [get_bd_pins Forwarding_Logic_0/a]
  connect_bd_net -net Forwarding_Logic_0_b [get_bd_pins Forward_MUX_3/s] [get_bd_pins Forwarding_Logic_0/b]
  connect_bd_net -net Forwarding_Logic_0_c [get_bd_pins Forward_MUX_0/s] [get_bd_pins Forwarding_Logic_0/c]
  connect_bd_net -net Forwarding_Logic_0_d [get_bd_pins Forward_MUX_1/s] [get_bd_pins Forwarding_Logic_0/d]
  connect_bd_net -net Forwarding_Logic_0_e [get_bd_pins Forwarding_Logic_0/e] [get_bd_pins Mem_MUX_0/s]
  connect_bd_net -net Forwarding_Logic_0_f [get_bd_pins Forwarding_Logic_0/f] [get_bd_pins Mem_DMUX_0/s]
  connect_bd_net -net Forwarding_Logic_0_rf_a [get_bd_pins Forwarding_Logic_0/rf_a] [get_bd_pins Reg_MUX_A/s]
  connect_bd_net -net Forwarding_Logic_0_rf_b [get_bd_pins Forwarding_Logic_0/rf_b] [get_bd_pins Reg_MUX_B/s]
  connect_bd_net -net ID_EX_0__add_sub [get_bd_pins ALU_0/add] [get_bd_pins ID_EX_0/_add_sub]
  connect_bd_net -net ID_EX_0__dm [get_bd_pins EX_MEM_0/dm] [get_bd_pins ID_EX_0/_dm] [get_bd_pins Stall_Control_0/ID_EX_dat_mem]
  connect_bd_net -net ID_EX_0__ld [get_bd_pins EX_MEM_0/ld] [get_bd_pins ID_EX_0/_ld] [get_bd_pins Stall_Control_0/ID_EX_load]
  connect_bd_net -net ID_EX_0__r1 [get_bd_pins Forwarding_Logic_0/EX_r1] [get_bd_pins ID_EX_0/_r1]
  connect_bd_net -net ID_EX_0__r1_data [get_bd_pins Forward_MUX_2/normal] [get_bd_pins ID_EX_0/_r1_data]
  connect_bd_net -net ID_EX_0__r2 [get_bd_pins Forwarding_Logic_0/EX_r2] [get_bd_pins ID_EX_0/_r2]
  connect_bd_net -net ID_EX_0__r2_data [get_bd_pins ALU_MUX_0/r2] [get_bd_pins ID_EX_0/_r2_data] [get_bd_pins Mem_MUX_0/normal]
  connect_bd_net -net ID_EX_0__r2_store [get_bd_pins EX_MEM_0/r2_store] [get_bd_pins Forwarding_Logic_0/EX_r2_store] [get_bd_pins ID_EX_0/_r2_store]
  connect_bd_net -net ID_EX_0__rd [get_bd_pins EX_MEM_0/rd] [get_bd_pins ID_EX_0/_rd] [get_bd_pins Stall_Control_0/ID_EX_r2]
  connect_bd_net -net ID_EX_0__reg_lit [get_bd_pins ALU_MUX_0/s] [get_bd_pins Forwarding_Logic_0/EX_reg_lit] [get_bd_pins ID_EX_0/_reg_lit]
  connect_bd_net -net ID_EX_0__sign_ex [get_bd_pins ALU_MUX_0/lit] [get_bd_pins ID_EX_0/_sign_ex]
  connect_bd_net -net ID_EX_0__str [get_bd_pins EX_MEM_0/str] [get_bd_pins Forwarding_Logic_0/EX_store] [get_bd_pins ID_EX_0/_str]
  connect_bd_net -net IF_ID_inc_adr [get_bd_pins Branch_Adder/pc_plus_4] [get_bd_pins IF_ID/inc_adr]
  connect_bd_net -net IF_ID_lit [get_bd_pins IF_ID/lit_6bit] [get_bd_pins Sign_Extension/literal_6bit]
  connect_bd_net -net IF_ID_lit_12bit [get_bd_pins IF_ID/lit_12bit] [get_bd_pins Unsigned_Extension_0/literal_12bit]
  connect_bd_net -net IF_ID_opcode [get_bd_pins Control/opcode] [get_bd_pins IF_ID/opcode]
  connect_bd_net -net IF_ID_r1 [get_bd_pins Forwarding_Logic_0/IF_ID_r1] [get_bd_pins ID_EX_0/r1] [get_bd_pins IF_ID/r1] [get_bd_pins Register_File/r1] [get_bd_pins Stall_Control_0/IF_ID_r1]
  connect_bd_net -net IF_ID_r2 [get_bd_pins Branch_MUX_0/r2] [get_bd_pins ID_EX_0/r2] [get_bd_pins IF_ID/r2] [get_bd_pins Stall_Control_0/IF_ID_r2]
  connect_bd_net -net IF_ID_rd [get_bd_pins Branch_MUX_0/rd] [get_bd_pins ID_EX_0/rd] [get_bd_pins IF_ID/rd]
  connect_bd_net -net Instruction_Memory_instruction [get_bd_pins IF_ID/instruction] [get_bd_pins Instruction_Memory/instruction]
  connect_bd_net -net Left_Shifter_o [get_bd_pins Branch_Adder/branch_in] [get_bd_pins Left_Shifter/o]
  connect_bd_net -net MEM_WB_0__alu_out [get_bd_pins Dmem_MUX_0/reg_dat] [get_bd_pins MEM_WB_0/_alu_out]
  connect_bd_net -net MEM_WB_0__dm [get_bd_pins Dmem_MUX_0/s] [get_bd_pins Forwarding_Logic_0/WB_dm] [get_bd_pins MEM_WB_0/_dm]
  connect_bd_net -net MEM_WB_0__dmem_out [get_bd_pins Dmem_MUX_0/dmem_dat] [get_bd_pins MEM_WB_0/_dmem_out]
  connect_bd_net -net MEM_WB_0__ld [get_bd_pins Forwarding_Logic_0/WB_load] [get_bd_pins MEM_WB_0/_ld] [get_bd_pins Register_File/we]
  connect_bd_net -net MEM_WB_0__rd [get_bd_pins Forwarding_Logic_0/WB_rd] [get_bd_pins MEM_WB_0/_rd] [get_bd_pins Register_File/rd]
  connect_bd_net -net Mem_DMUX_0_odata [get_bd_pins Data_Memory_0/M_data_in] [get_bd_pins Mem_DMUX_0/odata]
  connect_bd_net -net Mem_MUX_0_o [get_bd_pins EX_MEM_0/dmem_data] [get_bd_pins Mem_MUX_0/o]
  connect_bd_net -net Net [get_bd_pins IF_ID/inc_address] [get_bd_pins PC_Adder/inc_address] [get_bd_pins PC_MUX/inc_address]
  connect_bd_net -net OR_gate_o [get_bd_pins Branch_MUX_0/branch_inst] [get_bd_pins OR_gate/o]
  connect_bd_net -net PC_MUX_0_next_address [get_bd_pins PC_MUX/next_address] [get_bd_pins Program_Counter/next_address]
  connect_bd_net -net Program_Counter_address [get_bd_pins Instruction_Memory/address] [get_bd_pins PC_Adder/address] [get_bd_pins Program_Counter/address]
  connect_bd_net -net Register_File_r1_data [get_bd_pins Forward_MUX_0/normal] [get_bd_pins ID_EX_0/r1_data] [get_bd_pins Reg_MUX_A/reg_data_out]
  connect_bd_net -net Register_File_r1_data1 [get_bd_pins Reg_MUX_A/reg_file_out] [get_bd_pins Register_File/r1_data]
  connect_bd_net -net Register_File_r2_data [get_bd_pins Forward_MUX_1/normal] [get_bd_pins ID_EX_0/r2_data] [get_bd_pins Reg_MUX_B/reg_data_out]
  connect_bd_net -net Register_File_r2_data1 [get_bd_pins Reg_MUX_B/reg_file_out] [get_bd_pins Register_File/r2_data]
  connect_bd_net -net Sign_Extension_0_literal_32bit [get_bd_pins ID_EX_0/sign_ex] [get_bd_pins Left_Shifter/i] [get_bd_pins Sign_Extension/literal_32bit]
  connect_bd_net -net Stall_Control_0_IF_ID_write [get_bd_pins IF_ID/write] [get_bd_pins Stall_Control_0/IF_ID_write]
  connect_bd_net -net Stall_Control_0_PC_en [get_bd_pins Program_Counter/en] [get_bd_pins Stall_Control_0/PC_en]
  connect_bd_net -net Stall_Control_0_stall_out [get_bd_pins Flush_Control/stall] [get_bd_pins Stall_Control_0/stall_out] [get_bd_pins Stall_MUX/stall]
  connect_bd_net -net Stall_MUX_0__add_sub [get_bd_pins ID_EX_0/add_sub] [get_bd_pins Stall_MUX/_add_sub]
  connect_bd_net -net Stall_MUX_0__dm [get_bd_pins ID_EX_0/dm] [get_bd_pins Stall_MUX/_dm]
  connect_bd_net -net Stall_MUX_0__ld [get_bd_pins ID_EX_0/ld] [get_bd_pins Stall_MUX/_ld]
  connect_bd_net -net Stall_MUX_0__reg_lit [get_bd_pins ID_EX_0/reg_lit] [get_bd_pins Stall_MUX/_reg_lit]
  connect_bd_net -net Stall_MUX_0__str [get_bd_pins ID_EX_0/str] [get_bd_pins Stall_MUX/_str]
  connect_bd_net -net Unsigned_Extension_0_literal_32bit [get_bd_pins PC_MUX/jump_address] [get_bd_pins Unsigned_Extension_0/literal_32bit]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins Data_Memory_0/clk] [get_bd_pins EX_MEM_0/clk] [get_bd_pins ID_EX_0/clk] [get_bd_pins IF_ID/clk] [get_bd_pins MEM_WB_0/clk] [get_bd_pins Program_Counter/clk] [get_bd_pins Register_File/clk]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins Data_Memory_0/rst] [get_bd_pins EX_MEM_0/rst] [get_bd_pins ID_EX_0/rst] [get_bd_pins IF_ID/rst] [get_bd_pins MEM_WB_0/rst] [get_bd_pins Program_Counter/rst] [get_bd_pins Register_File/rst]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


