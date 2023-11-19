.SUFFIXES: .pdf .png .tex

TARGETS = sel1 sel2covering sel2dag0 sel2dag1
DEFAULT := all
all:

define GEN
all: $(1).png
$(1).png: $(1).pdf
	pdftoppm -f 1 -l 1 -png $$< > $$@

$(1).pdf: $(1).tex
	xelatex -shell-escape $$<
endef

$(foreach i, $(TARGETS), $(eval $(call GEN,$(i)) ) )

clean:
	$(RM) *.log *.pdf *.png $(TARGETS)

