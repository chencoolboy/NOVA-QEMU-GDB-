c compile :
	make -C kern/build
	make -C user/build
QEMU = qemu-system-x86_64

r run :
	cd boot && $(QEMU) -net nic,model=ne2k_pci -net user -fda grub_disk -tftp . -display sdl -serial stdio -gdb tcp::1234 


cl clean :
	make -C kern/build clean

cla cleanall : clean
	make -C kern/build cleanall
