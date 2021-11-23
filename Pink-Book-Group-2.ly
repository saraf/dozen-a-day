\version "2.22.1"
\include "articulate.ly"

\header {
  title = "Dozen-A-Day Pink Mini Book"
  subtitle = "Technical Exercises for the Piano"
  subsubtitle = "Group II"
  instrument = "Piano"
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
  \repeat volta 2 {c4-1^"1. Twisting Right And Left" d4-2 e4 f4 | e4 d4 c2 | r1 | r1 }

  \repeat volta 2 {c4-1^"2. Flinging Arms Out And Back" d4 e4 f4 | e4 d4 c2 | c4 d4 e4 d4 | c1}
  \break
  \repeat volta 2 {r1^"3. Touching Toes" | r1 | r1 | r1} 

  \repeat volta 2 {c4-1(^"4. Kicking Right Leg Up" f4-.-4) c2| c4( f4-.) c2 | c4( f4-.) c4( f4-.)| c1 }

  \break
  \repeat volta 2 { r1^"5. Kicking Left Leg Up"  | r1 | r1| r1  }
  \repeat volta 2 { r1^"6. Backward Bend"  | r1 | r1| r1  }

  \break
  \repeat volta 2 { c4-1^"7. Stretching Legs Out And Back (Sitting Down)" d4 e4 f4 | g4 f4 e4 d4 | c4 d4 e4 d4 | c1 }

  \repeat volta 2 { c4-1^"8. Skipping" e4 c4 e4 | c4 e4 g2 | r1 | r1}
  \break

  \repeat volta 2 {
    c,4-1^"9. Deep Breathing" e4 g2 | <<c,1-1 e1-3 g1-5>> | <<c,2 e2 g2>> <<c,2 e2 g2>> | <<c,1 e1 g1>>
    %c1-1^"9. Deep Breathing"_\markup {
    %  \italic \teeny { Set thumb down silent. Hold down throughout the exercise. } \hspace #2
    %} || e4-3 e4 e4 e4 | e4 e4 e4 e4 | e1
  }

  \repeat volta 2 { c,4-.-1^"10. Jump Rope" c4-. g'4-. g4-. | c,4-. c4-. g'4-. g4-. | r1 | r1}
  \break

  \repeat volta 2 { g4-5^"11. Walking Down A Hill" f4 e4 d4 | r1 | f4-4 e4 d4 c4 | r1 | c1 }

  \break
  \repeat volta 2 { c4-1^"12. Fit As A Fiddle And Ready To Go" d4 c4 d4 | c4 d4 e2 | g4 g4 r2 | e4 d4 c2 } \addlyrics {
    Now I'm nim ble as can be I can mel o dy}
  }

  left = \relative c' {
    \global
    %One
    \repeat volta 2 {r1 | r1 | c4 b4 a4 g4 | a4 b4 c2 }

    %Two
    \repeat volta 2 {c4-1 b4 a4 g4 | a4 b4 c2 | c4 b4 a4 b4 | c1 }

    %Three
    \repeat volta 2 {c2-1 g2-4 | g1 | c2 g4 g4 | c1 }

    %Four
    \repeat volta 2 { r1 | r1 | r1 | r1 }

    %Five
    \repeat volta 2 { c4-1( g4-.-4) g2 | c4( g4-.) g2 | c4( g4-.) c4( g4-.)| c1}

    %Six
    \repeat volta 2 { c4-1 b4 a4 g4 | f1 | f4 g4 a4 b4 | c1 }

    %Seven
    \repeat volta 2 { c4 b4 a4 g4 | f4 g4 a4 b4 | c4 b4 a4 b4 | c1 }

    %Eight
    \repeat volta 2 { r1 | r1 | c4-1 a4 c4 a4 | c1 }

    %Nine
    \repeat volta 2 { r1 | r1 | r1 | r1 }

    %Ten
    %{
      \repeat volta 2 {
      c1-1_\markup {
        \italic \teeny { Set thumb down silent. Hold throughout. } \hspace #2
      } \bar "||" a4-3 a4 a4 a4 | a4 a4 a4 a4 | a1
    }
    %}
    \repeat volta 2 { r1 | r1 | c4-. c4-. g4-. g4-.| c4-. r4 r2 }

    %Eleven
    \repeat volta 2 { r1 | c4 b4 a4 g4 | r1 | b4 a4 g2 | r1 }

    %Twelve
    \repeat volta 2 { r1 | r1 | r2 c4 c4 | r1 } \addlyrics { play this}
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
      \tempo 4=70
    }
  }