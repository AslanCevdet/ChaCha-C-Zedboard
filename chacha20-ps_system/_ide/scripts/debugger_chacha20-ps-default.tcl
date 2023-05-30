# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20-ps_system\_ide\scripts\debugger_chacha20-ps-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20-ps_system\_ide\scripts\debugger_chacha20-ps-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/pc/Desktop/VitisWs/ChaCha20_ps/chacha20_wrapper/export/chacha20_wrapper/hw/chacha20_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/pc/Desktop/VitisWs/ChaCha20_ps/chacha20-ps/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/pc/Desktop/VitisWs/ChaCha20_ps/chacha20-ps/Debug/chacha20-ps.elf
configparams force-mem-access 0
bpadd -addr &main
