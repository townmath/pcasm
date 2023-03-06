LATEX = latex

DVIPS = dvips

PDFFLAGS = -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress  \
           -dCompressPages=true -dUseFlateCompression=true  \
           -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100


%.dvi: %.tex
	$(LATEX) $<

%.ps: %.dvi
	$(DVIPS) -o $@ $<

%.pdf: %.ps
	ps2pdf $@

all:	pcasm.tex
	pdflatex pcasm.tex

index: pcasm.idx
	makeindex pcasm.idx

DEST = .

distrib:
	rsync pcasm.pdf $(DEST)

clean:
	rm -f *~ *.aux *.log *.dvi *.idx *.ilg *.ind *.toc *.out
