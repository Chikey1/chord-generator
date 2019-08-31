# frozen_string_literal: true

module DataConversion
  CHORD_QUALITIES = {
    # SUSPICIOUS CONVERSIONS
    # https://tabs.ultimate-guitar.com/tab/itchyworms/di_na_muli_chords_1903333
    'maj3' => '',
    'm3' => 'm',
    'maj5' => '7',
    'm5' => 'maj7',
    'm7h' => 'm7', # stupid custom notation by author  -____-
    'mmaj9' => '7b5',
    'addG' => '', # why the hell would someone notate like this
    '6b' => 'aug',
    'maug' => 'maddb6', # ehhh not technially correct, but close enough
    '*' => '', # stupid custom notation by author -____-

    # SPECIAL
    'OCTAVE' => 'unison',

    # TRIADS
    'maj' => '',
    'major' => '',
    'ma' => '',
    'M' => '',
    '3' => '',
    '-' => 'm',
    'minor' => 'm',
    'mi' => 'm',
    'min' => 'm',
    'o' => 'dim',
    '-5' => 'dim',
    'mb5' => 'dim',
    '+5' => 'aug',
    '+' => 'aug',
    'Aug' => 'aug',

    # SEVENTHS
    'ma7' => 'maj7',
    'M7' => 'maj7',
    'Maj7' => 'maj7',
    '7M' => 'maj7',
    'major7' => 'maj7',
    'min7' => 'm7',
    '7m' => 'm7',
    'mM7' => '7b5',
    'mMaj7' => '7b5',
    'mmaj7' => '7b5',

    # EXTENSIONS
    'ma9' => 'maj9',
    'M9' => 'maj9',
    '-9' => 'm9',
    'min9' => 'm9',
    'min11' => 'm11',

    # MODIFIED
    'M7no3' => 'maj7no3',

    # SUSPENSIONS
    'sus' => 'sus4',
    '2' => 'sus2',
    '4' => 'sus4',
    's4' => 'sus4',
    'm2' => 'msus2',
    'Maj7sus2' => 'maj7sus2',
    'maj7s4' => 'maj7sus4',
    'maj7sus' => 'maj7sus4',
    '7s4' => '7sus4',
    '7sus' => '7sus4',
    'sus7' => '7sus4',
    '9sus' => '9sus4',

    # ADD
    '6' => 'add6',
    '5add9' => 'add9',

    '6add4' => 'add4add6',
    'add9add4' => 'add4add9',
    '6add9' => 'add6add9',
    '6add11' => 'add6add11',

    'm6' => 'madd6',
    'min6' => 'madd6',
    'mb6' => 'maddb6',
    'mb9' => 'maddb9',
    'm6add9' => 'madd6add9',

    '7b13' => '7addb13',
    '7sus4b9' => '7sus4addb9',
    'm7b11' => 'm7addb11',

    '6sus' => 'sus4add6',
    '6sus2' => 'sus2add6',
    '6sus4' => 'sus4add6',
    'm7b13' => 'm7addb13',
  }.freeze
end
