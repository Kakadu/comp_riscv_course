.PHONY: all debs watch clean

BUILD_DIR = _build
DEFAULT := all


all: venv venv/bin/sphinx-build
	venv/bin/sphinx-build . $(BUILD_DIR)

bin/sphinx-autobuild bin/sphinx-build: bin
	pip3 install \
		sphinx-reload sphinx-autobuild  \
		sphinxcontrib_bibtex  sphinx_bootstrap_theme sphinx_rtd_theme  sphinx_book_theme  sphinx_subfigure \
		"docxbuilder[math]"

bin:
	python -m venv .

debs:
	sudo apt install --yes python3-pip

watch: bin bin/sphinx-autobuild
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

$(BUILD_DIR)/Course_description.docx: Course_description.docx
	cp $^ $@
