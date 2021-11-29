\version "2.22.1"
\include "articulate.ly"

\header {
  title = "Dozen-A-Day Pink Mini Book - Group IV"
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
    \repeat volta 2 {c4-1^"1. Walking On A Sunny Day" d4-2 e4 f4 | g4 f4 e4 d4 | c2 r2 | c1 }
    \repeat volta 2 {c4-1^"1. Walking On A Cloudy Day" d4-2 ees4-3 f4-4 | g4 f4 ees4 d4 | c2 r2 | c1 }

    \break
    \repeat volta 2 {c4-1^"3. Skipping On A Sunny Day" e4 c4 e4 | c4 e4 g2 | r1 | r1} 

    \repeat volta 2 {
      \time 4/4
      c,4-1^"4. Skipping On A Cloudy Day" ees4-3 c4 e4 | c4 ees4 g2 | r1 | r1
      } 

    \break
    \repeat volta 2 { 
      \time 4/4
      c,4-1^"5. Deep Breathing On A Sunny Day" e4 g2 | <c, e g> 1 | <c e g> 2 4 4 | <c e g> 1
    }

    \repeat volta 2 {
      \time 4/4
      %c4-1^"6. Deep Breathing On A Cloudy Day" d4-2 e4-3| f4-1 e4-3 d4-2 | c2.-1 |  c2. 
      c4-1^"6. Deep Breathing On A Cloudy Day" ees4-3 g2 | <c, ees g> 1 | <c ees g> 2 4 4 | <c ees g> 1
    }

    \break
    \time 4/4
    \repeat volta 2 { 
      c4-1^"7. Baby Steps" cis4-3 d4-1 des4-3 |  
      \repeat unfold 2 {
        c4-1 cis4-3 d4-1 des4-3       
      } |
      c1-1
      }


    \repeat volta 2 { 
      \time 4/4
      r4^"8. Cartwheels" c4-1 e4 g4| 
      \hideStaffSwitch
      \change Staff = "left"
      R1  
      \change Staff = "right"
      |  
      r4 c,4 e4 g4 | 

      \change Staff = "left"
      r2 
      \change Staff = "right"
      c,2^"R.H." | R1 
    }

    \break
  }

  left = \relative c' {
    \global
    %One
    \repeat volta 2 {r1| r1  | r2 g2| r1}

    %Two
    \repeat volta 2 {r1| r1  | r2 g2| r1}

    %Three
    \repeat volta 2 {r1 | r1 | g2 g2 | c1 }

    %Four
    \repeat volta 2 {r1 | r1 | g2 g2 | c1 }

    %Five
    \repeat volta 2 { 
      r1 | r1 | r1 | c,1
      %c'4_1 b4_2 a4_3 | g4_1 a4_3 b4_2 | c2._1 | c2.  
    }

    %Six
    \repeat volta 2 { 
      r1 | r1 | r1 | c1
      %c'4_1 b4_2 a4_3 | g4_1 a4_3 b4_2 | c2._1 | c2.  
    }

    %Seven
    \repeat volta 2 { 
      r1 | r1 | r1 | r1
      %c4_1 b4_2 a4_3 g4_1 | c,1_5| c'4_1 b4_2 a4_3 g4_1 | c1
    }

    %Eight
    \repeat volta 2 { 
      \stemUp
      \override VoiceFollower #'style  = #'dashed-line
      \showStaffSwitch
      c4_5 r4 r2 
      \change Staff = "right"
      c''1_2
      \hideStaffSwitch
      \change Staff = "left"
      |  
      c,,4_5 r4 r2 
      \showStaffSwitch
      \change Staff = "right"
      \stemDown
      c''2_2_"L.H."
      \hideStaffSwitch
      \change Staff = "left"
      r2 
      c,,1-5
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
