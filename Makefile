SRCMUSIC = whenthesaints.ly
PDFMUSIC = $(SRCMUSIC:.ly=.pdf)
MIDIMUSIC = $(SRCMUSIC:.ly=.midi)

LILYPOND = lilypond

%.pdf: %.ly
	$(LILYPOND) $<

%.midi: %.ly
	$(LILYPOND) $<

all: $(PDFMUSIC)

clean:
	rm -f $(PDFMUSIC) $(MIDIMUSIC)
