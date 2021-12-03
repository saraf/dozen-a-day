\version "2.22.1"
\include "articulate.ly"

\header {
  title = "Dozen-A-Day Pink Mini Book - Group V"
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
    \repeat volta 2 {c8-1[^"1. Running" d8-2] e8[ f8] g8[ f8] e8[ d8]| c8[ d8] e8[  d8] c2| r1 | r1 }

    \repeat volta 2 {
      \mark \markup \small "2. In A Swing"
      \repeat unfold 3 {
        c8-1[ d8-2] e8[ f8] r2
      }
      %\mark \markup \small "2. In A Swing"
      c1
    }

    \break
    \repeat volta 2 {
       % c4-1^"3. Teeter-Totter" e4 c4 e4 | c4 e4 g2 | r1 | r1
      \mark \markup \small "3. Teeter-Totter"
       \repeat unfold 3 {
         c4-1 g'4-5 r2
       }
      
      c,1
    } 

    \repeat volta 2 {
      \time 3/4
      c4-1^"4. Whirly Gig Ride" e4 g4 | c,4 e4 g4 | r2. | c,2. 
      } 

    \break
    \repeat volta 2 { 
      \time 4/4
      f4-4^"5. Swimming" e4 d4 c4 | R1 | f4 e4 d4 c4| c1
    }

    \repeat volta 2 {
      \time 4/4
      g'4-5^"6. Going Down A Slide" f4 e4 d4 | R1 | R1 | g4 f4 e4 d4 | R1 | R1 
    }

    \time 4/4
    \repeat volta 2 { 
      c4-1^"7. Climbing Monkey Bars" e4-3 d4-2 f4-4 | e4 g4 e4 g4 | R1 | R1 
      }

    \repeat volta 2 { 

      %\mark \markup \small "8. Hanging By Knees On Acting Bar" 
      R1 | R1^"8. Hanging By Knees On Acting Bar"  | R1 | R1  
    }

    \repeat volta 2 { 
      \time 4/4
      \tieDown
      
      r4 c,4-1^"9. Walking On Trapeze Rings" r4 d4-2 | r4 e4-3 r4 e4 |  r4 c4 r4 d4 | R1
    }

    \repeat volta 2 {
      \time 4/4
      r2 e4-.-3^"10. Jump Rope" e4-. |r2 e4-.-3 e4-. | r2 c'4-.-5 c4-. | R1 
    }

    \break
    \repeat volta 2 {
     c,8-1([^"11. Tether Ball" d8] e8[ f8] g4-.) r4  | 
     R1 |  
     c,8([d8] e8[ f8] g4-.) r4  | 
     c,1
    }

    \repeat volta 2 {
      c8-1[^\markup \small "12. Fit As A Fiddle And Ready To Go"
      d8] c8[ d8] e4 c4 | R1 | c8[ d8] c8[ d8] e4 d4 | c2 c'2-5 
    }
    \addlyrics {
      "Nim" -- "ble" -- "nim" -- "ble" "fin" -- "gers" 
      "Lots" "of" "nim" -- "ble" "notes" "to" --
      "day." 
    }
  }

  left = \relative c' {
    \global
    %One
    \repeat volta 2 {r1| r1  | c8[ b8] a8[ g8] f8[ g8] a8[ b8] | c8[ b8] a8[ b8] c2}

    %Two
    \repeat volta 2 {r2 c8[ b8] a8[ g8]| r2 c8[ b8] a8[ g8]  | r2 c8[ b8] a8[ g8]| r1}

    %Three
    \repeat volta 2 {
      \repeat unfold 3 {
        r2 c4-1 f,4 
      }
      R1
    }

    %Four
    \repeat volta 2 {r2. | r2. | c'4 a4 g4 | r2. }

    %Five
    \repeat volta 2 { 
      R1 | g4 a4 b4 c4 |  R1 | R1
    }

    %Six
    \repeat volta 2 { 
      R1 | c4_1 b4_2 a4_3 g4_1 | c,1_5 | R1 | c4_1 b4_2 a4_3 g4_1 | c1
    }

    %Seven
    \repeat volta 2 { 
      R1 | R1 | c'4_1 a4_3 b4_2 g4_4 | c1
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
      %  warning: maybe input should specify polyphonic voices
      %  warning: cannot have note heads and rests together on a stem
      
      << {c1^1_\markup \teeny "Hold Middle C down while playing other notes in measure." } \\ {r4 a4_3 a4 a4}>> | 
      << {c1^1} \\ {r4 g4_4 g4 g4}>> | 
      << {c1^1} \\ {r4 f,4_5 f4 f4}>> | 
      c'2_1 c,2_5
      %{
      \new Voice = "longc" 
      \relative {
        \voiceThree
        c1-1 | 
        c1-1 | 
        c1-1 | 
      }
      \new Voice = "notes" 
      \relative {
        \voiceFour
      r4 a4_3 a4 a4| 
      r4 g4_4 g4 g4| 
      r4 f,4_5 f4 f4| 
      c'2_1 c,2_5
      }
      %}
    }

    %Nine
    \repeat volta 2 { 
      a'4_3 r4 b4_2 r4 | c4_1 r4 c4 r4 | a4 r4 b4 r4 | c1
    }

    %Ten
    \repeat volta 2 {
      c4-._1 c4-. r2 | g4-. g4-. r2 | c4-. c4-. r2 | c4-. r4 r2
    }

    %Eleven
    \repeat volta 2{
      R1 | 
      c8([ b8] a8[ g8] f4-.) r4 | 
      R1 | 
      R1
    }

    %Twelve
    {
      R1 | g4 g4 c2| R1 | r2 c,2_5 
    }
    \addlyrics {
      "like" "to" "play"
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