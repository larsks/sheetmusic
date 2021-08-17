\version "2.23.3"
\language "english"
\include "articulate.ly"

\paper {
    left-margin=0.5\in
}

global = {
    \key c \major
    \time 4/4
    \tempo "Ragtime" 4 = 180

    \set Score.markFormatter = #format-mark-box-alphabet
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
}

\header{
    title = "Muppet Theme Song"
    subtitle = \markup {"For " B\flat "Trumpet and Alto Saxophone"}
    arranger = \markup \italic "arr. Lars Kellogg-Stedman"
    composer = "Sam Pottle"
    copyright = \markup {
      "Licensed under the terms of the Creative Commons "
      "Attribution-ShareAlike 4.0 International Public License "
    }
    tagline = \markup {
      "(Sources available from "
      \bold "https://github.com/larsks/sheetmusic/"
      ")"
    }
}

trumpet_notes = \relative c' {
    \global

    \mark \default
    c4 c8 c r a( c4) |
    f4 f8 f r c( f4) |
    a4 a8 a r f( d4) | e\staccato r2. |

    \mark \default
    c'4 r2. | fs4 r2. |
    b,8 b r b( c4\staccato) cs\staccato |
    d4\staccato r g,2

    \mark \default
    c,4 r ef r d r g, r |
    c4 r ef r d r g, r |

    \mark \default
    c4 r ef r d r g, r |

    R1*6

    \mark \default
    r4 c' c a | b as8 b~ b4 g |
    r4 c c a | b a8 g~ g2 |
    r4 e e g | f e8 f~ f c' c, d |
    e4 e8 e~ e d c4

    R1*9

    \mark \default
    r4 c' c a | b as8 b8~ b4 g |
    r4 c c a | b a8 g8~ g2 |
    r4 e e g | f e8 f~ f c' r4 |
    R1*2
    r4 e, e g | f e8 f~ f c' c, d |
    e4 e8 e4 c8 e4 | a4 a8 a4 e8 a4 |
    c4 c8 c4 a8 c4 | e2
    a,2^\markup{ \italic Rit. } b c d e e e e g2~ | g2. r4
}

saxophone_notes = \relative c' {
    \global

    \mark \default
    f4 r2. | ds4 r2. | d4 r2. | c4\staccato c d e |

    \mark \default
    e4 e8 e r c( e4) |
    a4 a8 a r e( a4) |
    g8 g r g( a4\staccato) bf\staccato |
    b4\staccato r g2

    \mark \default
    r4 g r a | r b8( g4\staccato) b8( g4\staccato) |
    r4 g r a | r b8( g4\staccato) b8( g4\staccato) |

    \mark \default
    r4 c c a | b as8 b~ b4 g |
    r4 c c a | b a8 g~ g2 |
    r4 e e g | f e8 f~ f8 c' c, d |
    e4 e8 e~ e e g4 |
    r4 g a b |

    \mark \default

    R1*8

    \mark \default
    c4^"Lyrically"( d c b | d c g) r | c( d c b d c2) r4 |
    c4( d c b | d e g,) r |
    g a^( a8) b4^( b8) | c4 d r2 |
    
    R1*6

    r4 e, e g | f e8 f~ f c' r4 |
    r4 e, e g | f e8 f~ f c' c, d |
    c4 c8 c4 a8 c4 | e4 e8 e4 c8 e4 |
    a4 a8 a4 e8 a4 | c2
    c,2 d e f g g g g c~ | c2. c,4
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet"
    \set Staff.shortInstrumentName = #"Tpt"
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

Saxophone = \new Voice {
    \key c \major
    \set Staff.instrumentName = #"Alt. Saxophone"
    \set Staff.shortInstrumentName = #"A Sax"
    \set Staff.midiInstrument = #"alto sax"
    \saxophone_notes
}

% produce printed output
\score {
<<
\new Staff \Trumpet
\new Staff \Saxophone
>>
}

% produce playable midi score
% score.
\score {

    \articulate <<
        \new Staff << \global \unfoldRepeats \Trumpet >>
        \new Staff << \global \unfoldRepeats \Saxophone >>
    >>
    \midi { }
}
