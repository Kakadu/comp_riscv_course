.SUFFIXES: .pdf .png .tex

TARGETS = sel1 sel2covering sel2dag0 sel2dag1 cfg1satsum ssa_graph1
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

all: Click_Paleczny1.png
Click_Paleczny1.png: ssa_graph1.pdf
	pdftoppm -f 2 -l 2 -png $< > $@

all: UPsetadd.png
UPsetadd.png: ssa_graph1.pdf
	pdftoppm -f 3 -l 3 -png $< > $@

all: Expr_parsing1.png
Expr_parsing1.png: sel1.pdf
	pdftoppm -f 2 -l 2 -png $< > $@

clean:
	$(RM) *.log *.pdf *.png $(TARGETS)

