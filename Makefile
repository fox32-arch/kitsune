OKAMERON := $(CURDIR)/meta/okameron/okameron.lua
FOX32ASM := ../fox32asm/target/release/fox32asm
RYFS := $(CURDIR)/meta/ryfs/ryfs.py
GFX2INC := ../tools/gfx2inc/target/release/gfx2inc
FOX32ROMDEF := ../fox32rom/fox32rom.def.okm

IMAGE_SIZE := 16777216
ROM_IMAGE_SIZE := 65536
BOOTLOADER := bootloader/bootloader.bin
KERNEL := base_image/kernel.fxf

all: kitsune.img romdisk.img

KENREL_INPUT_FILES = \
	kernel/Main.okm \
	kernel/Allocator.okm \
	kernel/Debug.okm \
	kernel/FXF.okm \
	kernel/Process.okm \
	kernel/RYFS.okm \
	kernel/String.okm \
	kernel/Syscall.okm \
	kernel/VFS.okm

bootloader/bootloader.bin: bootloader/main.asm $(wildcard bootloader/*.asm)
	$(FOX32ASM) $< $@

base_image/kernel.fxf: $(KENREL_INPUT_FILES) $(wildcard kernel/*.okm kernel/*/*.okm kernel/*.asm kernel/*/*.asm)
	lua $(OKAMERON) -arch=fox32 -startup=kernel/start.asm $(KENREL_INPUT_FILES) $(FOX32ROMDEF) > kernel/kernel.asm
	$(FOX32ASM) kernel/kernel.asm $@
	rm kernel/kernel.asm

APPLICATIONS = \
	base_image/init.fxf \
	base_image/fbterm.fxf

APPLICATIONS_ROM = \
	base_image/init.fxf \
	base_image/fbterm.fxf

$(APPLICATIONS):
	cd applications && $(MAKE)

kitsune.img: $(BOOTLOADER) $(KERNEL) $(APPLICATIONS)
	$(RYFS) -s $(IMAGE_SIZE) -l kitsune -b $(BOOTLOADER) create $@.tmp
	$(RYFS) add $@.tmp $(KERNEL)
	for file in $(APPLICATIONS); do $(RYFS) add $@.tmp $$file; done
	mv $@.tmp $@

romdisk.img: $(BOOTLOADER) $(KERNEL) $(APPLICATIONS_ROM)
	$(RYFS) -s $(ROM_IMAGE_SIZE) -l romdisk -b $(BOOTLOADER) create $@.tmp
	$(RYFS) add $@.tmp $(KERNEL)
	for file in $(APPLICATIONS_ROM); do $(RYFS) add $@.tmp $$file; done
	mv $@.tmp $@

clean:
	rm -f $(KERNEL)
	rm -f $(APPLICATIONS)
	cd applications && $(MAKE) clean

.PHONY: clean $(APPLICATIONS)
