#(set-default-paper-size "letter" 'landscape)

\version "2.18.2"
\language "english"
\include "articulate.ly"

global = {
    \time 4/4
    \tempo 4 = 120
}

\header{
    title = "The Ultimate Warmup"
    subtitle = \markup {"Trombones/Baritone"}
    composer = "Gary P. Gilroy"
    copyright = \markup {
      "Copyright 1995 Known Music"
      "All Rights Reserved"
    }
    tagline = ""
}

\relative c {
    \key c \major
    \clef bass
    \compressEmptyMeasures
    \set Score.markFormatter = #format-mark-box-alphabet

    R1*2
    bf1\mp( f' bf f2.) r4 |
    bf,2( f' bf f) |
    bf,4( f' bf f bf) r2. |

    \mark \default              % A
    a,1( e' a e2.) r4 |
    a,2( e' a e) |
    a,4( e' a e a,) r2. |

    \mark \default              % B
    af2( ef' af ef)
    af,4( ef' af ef)
    af,8( ef' af ef af,4) r

    g2( d' g d)
    g,4( d' g d)
    g,8( d' g d g,4) r

    gf2( df' gf df)
    gf,4( df' gf df)
    gf,8( df' gf df gf,4) r

    f2( c' f c)
    f,4( c' f c)
    f,8( c' f c f,4) r

    \mark \default              % C
    bf4\mf( f' bf f bf,2.) r4 |
    <f' bf d>1-- |
    <g c ef>1-- |
    <f a c>2-- <a c f>-- |
    <f bf d>2.-- r4 |

    \mark \default              % D
    bf,8( c d ef f ef d c | bf) bf bf bf bf8 r4. |
    bf8( c d ef f) f f f | bf4( f bf,) r4 |

    R1*2

    \mark \default              % E
    bf8-. bf-. bf-. bf-.
    cf-. cf-. cf-. cf-.
    c-. c-. c-. c-.
    df-. df-. df-. df-. |
    d r4.  ef8-. ef-. ef-. ef-. |
    f f g a bf r4. |

    bf8( a af g gf f ff ef | d df c cf bf4) r4 |
    <f' bf d>2.-- r4 | R1 |

    \mark \default              % F
    bf8-. bf16-. bf-. bf8-. r bf16-. bf-. bf8-. bf-. r |
    bf8.-- bf16-. bf8-. bf-. r g-. g4-- |
    gf16-- gf8-. gf16-. gf8-. r f[ f ] f r |
    bf,8-. bf16-. bf-. bf8-. r bf16-- bf8-. bf16-. bf8-. r |
    R1 |

    \mark \default              % G
    f'1\mf~ f~ <f c'>~ <f c'>~ <f a c>~ | <f a c>2. r4 |

    \mark \default              % H
    <f bf d>1~\f <f bf d> |
    <g c e>~ <g c e>2. r4 |
    <a c f>1~ <a c f>2. r4 |

    \mark \default              % I
    <a c f>2-- <f a c>-- |

    <f af df>1\ff( |
    <g bf ef>2.) r4 |

    <a c f>2.-- r4 |
    <a c f>2.-> r4 |

    <a c f>1--\fff~ <a c f>8 r8 r2. |
    \bar "|."
}
