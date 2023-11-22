OKAMERON := ../../meta/okameron/okameron.lua
FOX32ASM := ../../../fox32asm/target/release/fox32asm
FOX32ROMDEF := ../../../fox32rom/fox32rom.def.okm
KITSUNEDEF := ../kitsune.def.okm

all: fbterm.fxf

%.fxf: Main.okm
	lua $(OKAMERON) -arch=fox32 -startup=start.asm Main.okm $(KITSUNEDEF) $(FOX32ROMDEF) > out.asm
	$(FOX32ASM) out.asm $@
	rm out.asm
	cp $@ ../../base_image/

.PHONY: clean
clean:
	rm -f out.asm *.fxf
