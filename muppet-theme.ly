\version "2.18.2"
\language "english"
\include "articulate.ly"

global = {
    \time 4/4
    \tempo "Ragtime" 4 = 180
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
    \key c \major
    \set Score.markFormatter = #format-mark-box-alphabet

    \mark \default
    c4 c8 c8 r8 a8( c4) |
    f4 f8 f8 r8 c8( f4) |
    a4 a8 a8 r8 f8( d4) | e4\staccato r2. |

    \mark \default
    c'4 r2. | fs4 r2. |
    b,8 b8 r8 b8( c4\staccato) cs4\staccato |
    d4\staccato r4 g,2

    \mark \default
    c,4 r4 ef4 r4 d4 r4 g,4 r4 |
    c4 r4 ef4 r4 d4 r4 g,4 r4 |

    \mark \default
    c4 r4 ef4 r4 d4 r4 g,4 r4 |

    R1*6

    \mark \default
    r4 c'4 c4 a4 | b4 as8 b8~ b4 g4 |
    r4 c4 c4 a4 | b4 a8 g8~ g2 |
    r4 e4 e4 g4 | f4 e8 f8~ f8 c'8 c,8 d8 |
    e4 e8 e8~ e8 d8 c4
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet "
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

saxophone_notes = \relative c' {
    \key c \major

    f4 r2. | ds4 r2. | d4 r2. | c4\staccato c4 d4 e4 |

    e4 e8 e8 r8 c8( e4) |
    a4 a8 a8 r8 e8( a4) |
    g8 g8 r8 g8( a4\staccato) bf4\staccato |
    b4\staccato r4 g2

    r4 g4 r4 a4 | r4 b8( g4\staccato) b8( g4\staccato) |
    r4 g4 r4 a4 | r4 b8( g4\staccato) b8( g4\staccato) |

    r4 c4 c4 a4 | b4 as8 b8~ b4 g4 |
    r4 c4 c4 a4 | b4 a8 g8~ g2 |
    r4 e4 e4 g4 | f4 e8 f8~ f8 c'8 c,8 d8 |
    e4 e8 e8~ e8 e8 g4 |
    r4 g4 a4 b4 |
}

Saxophone = \new Voice {
    \key c \major
    \set Staff.instrumentName = #"Saxophone "
    \set Staff.midiInstrument = #"alto sax"
    \saxophone_notes
}

% produce printed output
\score {
    <<
        \new Staff << \global \Trumpet >>
        \new Staff << \global \Saxophone >>
    >>
    \layout { }
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
