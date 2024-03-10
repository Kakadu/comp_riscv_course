.PHONY: all debs watch clean

BUILD_DIR=_build
DEFAULT := all

all: bin
	bin/sphinx-build . $(BUILD_DIR)

debs:
	sudo apt install --yes python3-pip
	pip3 install \
		sphinxcontrib_bibtex docxbuilder sphinx_bootstrap_theme sphinx_rtd_theme sphinx_autobuild sphinx_subfigure

watch: bin
	bin/sphinx-autobuild . $(BUILD_DIR) --port 8008

bin:
	python3 -m venv .

clean:
	$(RM) -r $(BUILD_DIR)
	$(MAKE) -C images clean

$(BUILD_DIR)/sphinx.docx: bin index.rst
	bin/sphinx-build -b docx . $(BUILD_DIR)

$(BUILD_DIR)/comp_riscv.docx: $(BUILD_DIR)/sphinx.docx
	cp $^ $@
