.PHONY: all debs watch clean

BUILD_DIR=_build
DEFAULT := all

all:
	sphinx-build . $(BUILD_DIR)

debs:
	sudo apt install python3-sphinx-rtd-theme python3-sphinx-autobuild python3-pip

watch:
	sphinx-autobuild . $(BUILD_DIR) --port 8008

clean:
	$(RM) -r $(BUILD_DIR)
