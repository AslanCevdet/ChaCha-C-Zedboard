# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {chacha20_wrapper}\
-hw {C:\Users\pc\Desktop\VivadoWs\chacha20_ps\chacha20_wrapper.xsa}\
-out {C:/Users/pc/Desktop/VitisWs/ChaCha20_ps}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {chacha20_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp config stdin "ps7_uart_1"
bsp config stdout "ps7_uart_1"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
<<<<<<< HEAD
platform generate
=======
>>>>>>> 263c7b802de7131cf8514339e330812d398df814
platform generate
