\version "2.18.2"
\language "english"
\include "articulate.ly"

global = {
    \time 4/4
    \tempo 4 = 120
}

\header{
    title = "Seven Nation Army"
    arranger = \markup \italic "arr. Lars Kellogg-Stedman"
    composer = "Jack White"
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

    R1*7
    r2 r8 e e e |
    g e e r8 r2 |
    r4. e8 e e e e |
    e e e e e4 e |
    e4 r4. e8 e e |
    g e e r8 r2 |
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet "
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

trombone_notes = \relative c {
    \key c \major

    \unfoldRepeats \repeat volta 6 {
    e4. e8 \tuplet 3/2 { g4 e d } |
    c2 b2 |
    }
}

Trombone = \new Voice {
    \clef bass
    \key c \major
    \set Staff.instrumentName = #"Trombone "
    \set Staff.midiInstrument = #"trombone"
    \trombone_notes
}

DrumBass = \drummode {
    R1*4
    \unfoldRepeats \repeat volta 10 {
        bd4 bd bd bd |
    }
    bd4 r bd r
}

DrumHigh = \drummode {
    R1*4
    \unfoldRepeats \repeat volta 10 {
        hh4 hh hh hh |
    }
    \unfoldRepeats \repeat volta 4 {
        hh4 <ss sn> hh <ss sn>
    }
}

% produce printed output with the trombone score transposed into
% b-flat.
\score {
    <<
        \new Staff << \global \Trumpet >>
        \new Staff << \global \Trombone >>
        \new DrumStaff <<
            \global
            \new DrumVoice { \voiceOne \DrumHigh }
            \new DrumVoice { \voiceTwo \DrumBass }
        >>
    >>
    \layout { }
}

% produce playable midi score that *does not* transpose the trombone
% score.
\score {

    \articulate <<
        \new Staff << \global \unfoldRepeats \Trumpet >>
        \new Staff << \global \unfoldRepeats \Trombone >>
        \new DrumStaff <<
            \global
            \new DrumVoice { \unfoldRepeats \DrumHigh }
            \new DrumVoice { \unfoldRepeats \DrumBass }
        >>
    >>
    \midi { }
}
