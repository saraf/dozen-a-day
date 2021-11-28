\version "2.22.1"
\include "articulate.ly"

\header {
  title = "Dozen-A-Day Pink Mini Book - Group III"
  subtitle = "Technical Exercises for the Piano"
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
    \repeat volta 2 {c4-1^"1. The Splits" d4-2 e4 f4 | g4 f4 e4 d4 | c2 c'2-5 | c1 }

    \repeat volta 2 {r2^"2. Deep Breathing" <<c,2 e2 g2>>| r2 <<c,2 e2 g2>>|r2 <<c,2 e2 g2>>| <<c,1 e1 g1>>}
    \break
    \repeat volta 2 {c,4-1^"3. Wide Walk (Stiff-Legged)" g'4-5 c,4 g'4 | r1 | c,4 g'4 c,4 g'4 | c,1} 

    \repeat volta 2 {
      \time 3/4
        c4-1^"4. Right Knee Up And Back (Lying Down)" d4-2 e4-3| f4-1 e4-3 d4-2 | c2.-1 |  c2. 
    }

    \break
    \repeat volta 2 { 
      \time 3/4
      r2.^"5. Left Knee Up And Back"  | r2. | r2.| r2.  
    }
    \repeat volta 2 {
      \time 3/4
      c4-1^"6. Both Knees up and Back (Lying Down)" d4-2 e4-3| f4-1 e4-3 d4-2 | c2.-1 |  c2. 
    }

    \break
    \time 4/4
    \repeat volta 2 { 
      r1^"7. Backward Bend" |r1 |r1 | r1 
      }

    \repeat volta 2 { 
      \time 3/4
      c4-1^"8. Twirling To The Right" e4-3 g4-5 | 
      c,4 e4 g4 | 
      c,4 e4 g4 | 
      c,2.
    }

    \break

    \repeat volta 2 {
      \time 3/4
      r2.^"9. Twirling To The Left"  | r2. | r2.| r2.
    }

    \break
    
      \time 4/4
      \repeat volta 2 {
            <c e> 1-1-3^"10. Jumping Over The Bench" |
            \repeat unfold 3 {
                <c e>1 |
        }
      }
    \break

    \repeat volta 2 {
      \time 4/4
      e2-3^"11. Jumping Off A Big Box" r2 | e2 r2 | e2 r2 | r1
    }

    \repeat volta 2 {
      \time 4/4
      g2-5^"12. Fit As A Fiddle And Ready To Go" e4 c4 | r1 | f2 e4 d4 | c1
    }
  }

  left = \relative c' {
    \global
    %One
    \repeat volta 2 {c4-1 b4 a4 g4 | f4 g4 a4 b4  | c2 c,2-5| c1}

    %Two
    \repeat volta 2 {g'2_1 r2| g2 r2 | g2 r2| c,1_5 }

    %Three
    \repeat volta 2 {r1 | c4_1 g4_4 c4 g4| r1 | r1 }

    %Four
    \repeat volta 2 { 
      r2. | r2. | r2. | r2. 
    }

    %Five
    \repeat volta 2 { 
      c'4_1 b4_2 a4_3 | g4_1 a4_3 b4_2 | c2._1 | c2.  
    }

    %Six
    \repeat volta 2 { 
      c4_1 b4_2 a4_3 | g4_1 a4_3 b4_2 | c2._1 | c2.  
    }

    %Seven
    \repeat volta 2 { 
      c4_1 b4_2 a4_3 g4_1 | c,1_5| c'4_1 b4_2 a4_3 g4_1 | c,1
    }

    %Eight
    \repeat volta 2 { 
      r2. | r2. | r2. | r2. 
    }

    %Nine
    \repeat volta 2 { 
      c'4_1 a4_3 f4_5 | c'4 a4 f4 | c'4 a4 f4 | c'2.
    }

    %Ten
    \repeat volta 2 {
       \stemDown
                \showStaffSwitch
                r4 
                    \change Staff = "right"
                    g'4-._2_\markup{\italic"L.H."}
                    \change Staff = "left"  
                    g,2_5 | 
                r4 
                    \change Staff = "right"
                    g'4-.
                    \change Staff = "left"  
                    g,2 | 
                r4 
                    \change Staff = "right"
                    g'4-.
                    \change Staff = "left"
                    g,4 g4 | 
                \stemNeutral
                \hideStaffSwitch
                R1 |
      %without the staff switch - this is how I wrote it before
      % https://music.stackexchange.com/q/118805/82475
      %r4 g'4-._2 g,2 | r4 g'4-.  g,2 | r4 g'4-. g,4 g4 | r1
    }

    %Eleven
    \repeat volta 2 {
      c2_1 c,4-._5 r4 | c'2 c,4-. r4 | c'2 c,4-. c4-. | c1 
    }

    %Twelve
    \repeat volta 2 {
      r1 | g'2 g4 g4 | r1 |  r1 
    }
  }


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
