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

#(define right-arrow-and-lh-over-to-slur
   (grob-transformer 'stencil (lambda (grob orig)
     (let* ((cpts (ly:grob-property grob 'control-points))
            (middle-left-coord (cadr cpts))
            (middle-right-coord (caddr cpts))
            (right-coord (cadddr cpts))
            (raw-arrow (grob-interpret-markup grob (markup #:arrow-head Y DOWN #t)))
            (arr-ext (ly:stencil-extent raw-arrow Y))
            (arr-neg-height (- (car arr-ext) (cdr arr-ext)))
            (corrected-arrow (ly:stencil-translate-axis raw-arrow arr-neg-height Y))
            (arrow (ly:stencil-translate corrected-arrow right-coord))
            (lh-raw (grob-interpret-markup grob (markup #:fontsize -2 #:italic "L.H. over")))
            (lh-cent (ly:stencil-aligned-to (ly:stencil-aligned-to lh-raw X CENTER) Y DOWN))
            (middle-coord (cons (/ (+ (car middle-left-coord) (car middle-right-coord)) 2) (/ (+ (cdr middle-left-coord) (cdr middle-right-coord)) 2)))
            (lh (ly:stencil-translate lh-cent middle-coord)))
       (display middle-coord)
     (ly:stencil-add
       orig arrow lh)))))

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

    %{This part was much improved with help from music.stackexchange 
    \repeat volta 2 { 
      \time 4/4
      r4^"8. Cartwheels" c4-1 e4 g4| 
      \once\voiceTwo
      R1  
      |  
      r4 c,4 e4 g4 | 
      \once\voiceTwo
      r2 
      c,2^"R.H." | R1 
    }
    %}

    \break
    \repeat volta 2 { 
      \time 4/4
      \mark \markup \small "8. Cartwheels"
       r4
       c4-1 e4 g4| 
      \change Staff = "left"
      R1  
      \change Staff = "right"
      |  
      r4 c,4 e4 g4 | 
      s2 c,2-\tweak parent-alignment-X #CENTER ^\markup\smaller\smaller\italic\center-align "R.H." | R1 \bar "|."
    }

    \break
    \repeat volta 2 { 
      \time 4/4
      \tieDown
      \mark \markup \small "9. Leapfrog"
      <c e g>~ | <c e g> | <c e g>~ | <c e g> | <c e g>
    }
    \break

    

    \repeat volta 2 {
      c4^\markup \teeny "2-1" \mark \markup \small "10. Tightrope Walking"
      d4^\markup \teeny "2-1" 
      e4^\markup \teeny "2-1" 
      f4^\markup \teeny "2-1" | 
      e4^\markup \teeny "2-1" 
      d4^\markup \teeny "2-1" 
      c2^\markup \teeny "2-1" | 
      r1^\markup \teeny "Silent change. Keep key down while changing fingers." | 
      r1
    }

    \break
    \repeat volta 2 {
      c4-.-2 \mark \markup \small "11. Walking On Tiptoes"
      c4-.-1 d4-.-2 d4-.-1 | e4-.-2 e4-.-1 d4-.-2 d4-.-1 | R1 | c4-.-2 c4-.-1 c2-2
    }

    {
      c4-1^\markup \small "12. Fit As A Fiddle And Ready To Go"
      d4-2 e4 f4 | g4 e4 c2 | r2 f4-4 f4 | e4 d4 c2 \bar "|."
    }
    \addlyrics {
      "Fin" -- "gers" -- "read" -- "y" "as" "can" "be"
      "mu" -- "sic"
      "just" "for" "me"
    }

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
    }

    %Six
    \repeat volta 2 { 
      r1 | r1 | r1 | c1
    }

    %Seven
    \repeat volta 2 { 
      r1 | r1 | r1 | r1
    }

    %{Eight
    % This attempt was much improved by an answer on music.stackexchange.com
    \repeat volta 2 { 
      \stemUp
      \override VoiceFollower #'style  = #'dashed-line
      \showStaffSwitch
      c4_5 r4 r2 
      \change Staff = "right"
      c''1^2
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
  %}
    %Eight
    \repeat volta 2 { 
      \clef bass
      \phrasingSlurDashed
      \override PhrasingSlur.thickness = #0.6
      \override PhrasingSlur.stencil = #right-arrow-and-lh-over-to-slur
      \shape #'((-0.4 . 3) (-1 . 9) (0 . 4) (0.3 . 1.7)) PhrasingSlur
      c4_5^\( r4 r2 
      \change Staff = "right"
      c''1-\tweak Y-offset -1.5 -\tweak whiteout 1 _2\)-\tweak parent-alignment-X #CENTER _\markup\smaller\smaller\italic\center-align "L.H."
      \change Staff = "left"
      |  
      \shape #'((-0.4 . 3) (-1 . 9) (0 . 4) (0.3 . 1.7)) PhrasingSlur
      c,,4_5\( r4 r2 
      <<
        { \change Staff = "right"
          c''2\)-\tweak Y-offset -1.5 -\tweak whiteout 1 _2-\tweak parent-alignment-X #0.6 _\markup\smaller\smaller\italic\center-align "L.H."
          \change Staff = "left"
        }
        \new Voice R1
      >>
      c,,1-5
    }

    \repeat volta 2 { 
      r2
      \showStaffSwitch
      \change Staff="right"
      c''4-.^2 \mark \markup \teeny \italic "L.H. Over and back" 
      \change Staff="left"
      r4
      | 
      c,,1_5
      | 
      r2 
      \showStaffSwitch
      \change Staff="right"
      c''4-.^2 \mark \markup \teeny \italic "L.H. Over and back" 
      \change Staff="left"
      r4
      |c,,2 c2| c1
    }

    %Ten
    \repeat volta 2 {
      r1
       | r1 | 
      c'4_\markup \teeny "2-1"
      b4_\markup \teeny "2-1"
      a4_\markup \teeny "2-1"  
      g4_\markup \teeny "2-1" | 
      a4_\markup \teeny "2-1" 
      b4_\markup \teeny "2-1" 
      c2_\markup \teeny "2-1" 
    }

    %Eleven
    \repeat volta 2{
      R1 | r1 | c4-.-2 c4-.-1 b4-.-2 b4-.-1 | r1
    }

    %Twelve
    {
      R1 | R1 | g4-4 g4 r2  | r1
    }
    \addlyrics {
      "play" -- "ing"
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
