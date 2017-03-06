\version "2.18.2"
\language "english"

global= {
    \time 4/4
    \tempo "Lively" 4 = 120
}

\header{
    title = "When the Saints Go Marching In"
    arranger = \markup \italic "arr. Lars Kellogg-Stedman"
}

trumpet_notes = \relative c' {
    \key c \major

    r8 r2  c8 e[ f] |
    g r2 c,8 e[ f] |
    g r2 c,8 e[ f] |
    g4 e c e |
    d2 r8 e8 e[ d] |
    c4. c8 e4 g8 g |
    g f r2 e8 f |
    g4 g a b |
    c8. g16[ g8 g] c4 c,-> \bar "|."
}

Trumpet = \new Voice {
    \set Staff.instrumentName = #"Trumpet "
    \set Staff.midiInstrument = #"trumpet"
    \trumpet_notes
}

trombone_notes = \relative c {
    \key c \major
    r1 |
    r8 c8 e[ f] g r4. |
    r8 c,8 e[ f] g r4. |
    g4 g c, c |
    d8 c b a g r4. |
    c4 g' c, g' |
    f c' f, r4 |
    g4 g f d |
    c r2 c4-> \bar "|."
}

Trombone = \new Voice {
    \clef bass
    \key c \major
    \set Staff.instrumentName = #"Trombone "
    \set Staff.midiInstrument = #"trombone"
    \trombone_notes
}

\score {
    \new StaffGroup <<
        \new Staff << \global \Trumpet >>
        \new Staff << \global \transpose c' bf \Trombone >>
    >>
    \layout { }
}

\score {
    \new StaffGroup <<
        \new Staff << \global \Trumpet >>
        \new Staff << \global \Trombone >>
    >>
    \midi { }
}
