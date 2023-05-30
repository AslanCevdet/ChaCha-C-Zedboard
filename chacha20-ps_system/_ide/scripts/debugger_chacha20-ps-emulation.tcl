# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20-ps_system\_ide\scripts\debugger_chacha20-ps-emulation.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\pc\Desktop\VitisWs\ChaCha20_ps\chacha20-ps_system\_ide\scripts\debugger_chacha20-ps-emulation.tcl
# 
connect -url tcp:localhost:4351
targets 3
dow C:/Users/pc/Desktop/VitisWs/ChaCha20_ps/chacha20-ps/Debug/chacha20-ps.elf
bpadd -addr &main
