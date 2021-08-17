\version "2.23.3"
\include "articulate.ly"

\include "common.ly"
\include "trumpet-music.ly"
\include "altsax-music.ly"

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet"
    \set Staff.shortInstrumentName = #"Tpt"
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_music
}

Saxophone = \new Voice {
    \key c \major
    \set Staff.instrumentName = #"Alt. Saxophone"
    \set Staff.shortInstrumentName = #"A Sax"
    \set Staff.midiInstrument = #"alto sax"
    \altsax_music
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
        \new Staff << \unfoldRepeats \Trumpet >>
        \new Staff << \unfoldRepeats \Saxophone >>
    >>
    \midi { }
}
