LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf

MAIN=loom-hotcloud
SOURCES=$(MAIN).tex Makefile abstract.tex intro.tex background.tex future_work.tex motivation.tex relwork.tex methodology.tex evaluation.tex references.bib
FIGURES := $(shell find figures/* images/* -type f)

all:    $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(SOURCES) $(FIGURES)
	        $(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
			-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
		$(LATEXMK) -C $(MAIN)
		rm -f $(MAIN).pdfsync
		rm -rf *~ *.tmp
		rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk

once:
	    $(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)
