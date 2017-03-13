\version "2.18.2"
\language "english"

global = {
    \time 4/4
    \tempo "Lively" 4 = 120
}

\header{
    title = "Cantina Band"
    subtitle = \markup {"For " B\flat "Trumpet and Trombone"}
    arranger = \markup \italic "arr. Daniel Jensen"
    composer = "John Williams"
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
    \key f \major

    a'4 d a d |
    a8 d4 a8( a) gs a4 |
    a8 gs a g r8 fs g fs |
    f4. d r4 |
    a'4 d a d |
    a8 d4 a8( a) gs a4 |
    g g4. fs8 g4 |
    c bf a g |
    a d a d |

    \bar "|."
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet "
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

trombone_notes = \relative c {
    \key c \major

    \bar "|."
}

Trombone = \new Voice {
    \clef bass
    \key c \major
    \set Staff.instrumentName = #"Trombone "
    \set Staff.midiInstrument = #"trombone"
    \trombone_notes
}

% produce printed output with the trombone score transposed into
% b-flat.
\score {
    \new StaffGroup <<
        \new Staff << \global \Trumpet >>
    >>
    \layout { }
}

% produce playable midi score that *does not* transpose the trombone
% score.
\score {

    \new StaffGroup <<
        \new Staff << \global \unfoldRepeats \Trumpet >>
        \new Staff << \global \unfoldRepeats \Trombone >>
    >>
    \midi { }
}
