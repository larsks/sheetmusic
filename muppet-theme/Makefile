SRCMUSIC = \
	   score.ly \
	   trumpet-part.ly \
	   altsax-part.ly

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

trumpet-part.pdf: trumpet-part.ly trumpet-music.ly common.ly
altsax-part.pdf: altsax-part.ly altsax-music.ly common.ly
score.pdf: score.ly trumpet-music.ly altsax-music.ly common.ly
