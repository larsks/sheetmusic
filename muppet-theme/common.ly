\language "english"

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
    instrument = \markup {"For " B\flat "Trumpet and Alto Saxophone"}
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

