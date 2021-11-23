\version "2.22.1"
\include "articulate.ly"

\header {
  title = "Dozen-A-Day Pink Mini Book - Group I"
  subtitle = "Technical Exercises for the Piano"
  %subsubtitle = "Group I"
  composer = "Edna Mae Burnham"
}

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key c \major
  \time 4/4
}


right = \relative c' {
  \global
  \repeat volta 2 {c4-1^"1. Walking" d4-2 c4 d4 | c4 d4 c2 | c4 d4 c4 d4 | c1 }

  \repeat volta 2 {c4-.-1^"2. Hopping" c4-. d4-. d4-. | r1 | c4-. c4-. d4-. d4-. | c1}
  \break
  \repeat volta 2 {c4-1^"3. Bouncing a ball with Right Hand"( d4-2-.) c2 | c4( d4-.) c2 | c4( d4-.) c4( d4-.) | c1 }

  \repeat volta 2 {r1^"4. Bouncing a ball with Left Hand" | r1 | r1 | r1 }

  \break
  \repeat volta 2 { c4-1^"5. Rolling" d4 e4 d4 | r1 | c4 d4 e4 d4 | c1  }

  \repeat volta 2 { c2-1^"6. Arms Up and Down" d2 | c1 | c4 d4 c4 d4 | c1 }

  \break
  \repeat volta 2 { c4-1^"7. Skipping" e4-3 c2 | r1 | c4 e4 c4 e4 | c1 }

  \repeat volta 2 { c2-1^"8. Deep Breathing" e2-3 | <<c1 e1>> | <<c2 e2>> <<c4 e4>><<c4 e4>> | <<c1 e1>>}
  \break
  \repeat volta 2 {
    c1-1^"9. Hammering with Right Hand"_\markup {
      \italic \teeny { Set thumb down silent. Hold down throughout the exercise. } \hspace #2
    } || e4-3 e4 e4 e4 | e4 e4 e4 e4 | e1
  }

  \repeat volta 2 { r1^"10. Hammering with Left Hand" \bar "||" r1 | r1 | r1}
  \break
  \repeat volta 2 { c2-1^"11. Walking In A Water Puddle In Boots" <<c2 d2>> | r1 | c2 <<c2 e2>> | r1 | <<c2 e2>> <<c2 e2>> | <<c1 e1>>}

  \break
  \repeat volta 2 { c4-1^"12. Fit As A Fiddle And Ready To Go" d4 e4 c4 | d4 e4 d2 | r1 | e4 d4 c2 } \addlyrics {
    Now my fin gers feel so good way I should}
  }

  left = \relative c' {
    \global
    \repeat volta 2 {r1 | r1 | r1 | r1  }

    \repeat volta 2 {r1 | c4-. c4-. c2 | r1 | r1 }

    \repeat volta 2 {r1 | r1 | r1 | r1 }

    \repeat volta 2 {c4-1( b4-2-.) c2| c4( b4-.) c2 | c4( b4-.) c4( b4-.) |c1 }

    \repeat volta 2 { r1 | c4-1 b4 a4 b4 | r1 | r1  }

    \repeat volta 2 { c2-1 b2 | c1 | c4 b4 c4 b4 | c1 }

    \repeat volta 2 { r1 | c4 a4 c2 | r1 | r1 }

    \repeat volta 2 { r1 | r1 | r1 | r1 }

    \repeat volta 2 { r1 | r1 | r1 | r1 }

    \repeat volta 2 {
      c1-1_\markup {
        \italic \teeny { Set thumb down silent. Hold throughout. } \hspace #2
      } \bar "||" a4-3 a4 a4 a4 | a4 a4 a4 a4 | a1
    }

    \repeat volta 2 { r1 | c2-1 <<b2 c2>> | r1 | c2 <<a2 c2>> | r1 | r1 }

    \repeat volta 2 { r1 | r1 | c4 b4 c4 c4 | r1 } \addlyrics { I can play the }
  }

  %{right = \relative c' {
  \global
  c4 d4 c4 d4 | c4 d4 c2 | c4 d4 c4 d4 | c1
  c4-. c4-. d4-. d4-. | r1 | c4-. c4-. d4-. d4-. | c1

}

left = \relative c {
  \global
  r1 | r1 | r1 | r1
  r1 | c4-. c4-. c2 | r1 | r1
}
  %}


  %{ REPEATS IN MIDI
To get repeats to display in proper notation in the PDF,
but to also unfold in the MIDI,
you will actually need to make two score blocks.
One score block with a \layout{}, and one with a \midi{}.
Put the \unfoldRepeats command in the midi score block.
(see 3.5.6 Using repeats with MIDI)
https://lilypond.org/doc/v2.20/Documentation/notation/using-repeats-with-midi
  %}

  %%THE MUSIC
  theMusic = {
    \new PianoStaff \with {
      instrumentName = ""
    } <<
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } \right
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } { \clef bass \left }
    >>
  }

  %%PDF SCORE
  \score {
    \theMusic
    \layout {
      ragged-left = ##t
      indent = 0\cm
    }
  }


  %%MIDI SCORE
  \score {
    \unfoldRepeats 
    { 
      \theMusic
    }
    \midi {
      \tempo 4=100
    }
  }