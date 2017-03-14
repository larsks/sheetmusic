\version "2.18.2"
\language "english"
\include "articulate.ly"

global = {
    \time 4/4
    \tempo 4 = 190
}

\header{
    title = "Cantina Band"
    subtitle = \markup {"For " B\flat "Trumpet and Trombone"}
    arranger = \markup \italic "arr. Daniel Jensen/Lars Kellogg-Stedman"
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
    a8 d4 a8 ~ a gs a4 |
    a8 gs a g r8 fs g fs |
    f4. d r4 |
    a'4 d a d |
    a8 d4 a8 ~ a gs a4 |
    g g4. fs8 g4 |
    c-. bf-. a-. g-. |
    a d a d |
    a8 d4 a8 ~ a gs a4 |
    c4 c ~ c8 a g r8 |
    f4. r8 d4. r8 |
    bf8 d f4 b,8 d f4 |
    gs8 a4 f2 ~ f8 |
    bf,8 d bf' d gs, a4 r8 |
    r1

    \bar "|."
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet "
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

trombone_notes = \relative c {
    \key f \major

    d4 a' a, a' |
    d,4 a' a, a' |
    d,4 a' a, a' |
    d, c bf a |
    d4 a' a, a' |
    d,4 a' a, a' |
    g,4 g' b, f' |
    c d ds e |
    d4 a' a, a' |
    d,4 a' a, a' |
    c, e g, e' |
    d4 a' a, a' |
    bf,4 r b r |
    c r d r |
    e4 r a r |
    f,1

    \bar "|."
}

Trombone = \new Voice {
    \clef bass
    \set Staff.instrumentName = #"Trombone "
    \set Staff.midiInstrument = #"trombone"
    \trombone_notes
}

% produce printed output with the trumpet score transposed into
% b-flat.
\score {
    \new StaffGroup <<
        \new Staff << \global \transpose bf c' \Trumpet >>
        \new Staff << \global \Trombone >>
    >>
    \layout { }
}

% produce playable midi score that *does not* transpose the trumpet
% score.
\score {
    \new StaffGroup \articulate <<
        \new Staff << \global \unfoldRepeats \articulate \Trumpet >>
        \new Staff << \global \unfoldRepeats \articulate \Trombone >>
    >>
    \midi { }
}
