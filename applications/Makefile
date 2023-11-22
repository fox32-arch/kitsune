OUTPUT_FILES = \
	init/init.fxf \
	fbterm/fbterm.fxf

# FIXME: there has to be a better way to do this

all: $(OUTPUT_FILES)

init/init.fxf:
	cd init && $(MAKE)

fbterm/fbterm.fxf:
	cd fbterm && $(MAKE)

.PHONY: $(OUTPUT_FILES) clean
clean:
	cd init && $(MAKE) clean
	cd fbterm && $(MAKE) clean
