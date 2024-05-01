APPLICATIONS = \
	init \
	fbterm \
	sh

OUTPUT_FILES = $(foreach app,$(APPLICATIONS),$(app)/$(app).fxf)

all: $(OUTPUT_FILES)

$(OUTPUT_FILES): %:
	# extracts the application name from the target name
	# e.g. init/init.fxf --> init init.fxf --> init
	cd $(word 1,$(subst /, ,$@)) && $(MAKE)

.PHONY: $(OUTPUT_FILES) clean
clean:
	for app in $(APPLICATIONS); do \
		(cd $$app && $(MAKE) clean); \
	done
