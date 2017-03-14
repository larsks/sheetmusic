SRCMUSIC = \
	   whenthesaints.ly \
	   cantina-band.ly
PDFMUSIC = $(SRCMUSIC:.ly=.pdf)
MIDIMUSIC = $(SRCMUSIC:.ly=.midi)
PSSOURCE = $(SRCMUSIC:.ly=.ly.ps)

LILYPOND = lilypond
ENSCRIPT = enscript

%.ly.ps: %.ly
	$(ENSCRIPT) --highlight=ly -G -o $@ $<

%.pdf: %.ly
	$(LILYPOND) $<

%.midi: %.ly
	$(LILYPOND) $<

all: $(PDFMUSIC)

ps: $(PSSOURCE)

clean:
	rm -f $(PDFMUSIC) $(MIDIMUSIC) $(PSSOURCE)
