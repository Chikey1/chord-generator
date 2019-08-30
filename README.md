# README

## Sections

[Data](#data)


backend: https://drive.google.com/file/d/12H74gR6_ta_tq-g9l5z4RJe-RFU9lgbO/view?usp=sharing

## Data
### RAW

has one file for each tonality

each file has one line for each song

the line is formatted as:

`title: chord, chord, chord, chord`

### ANALYSIS

is split into the following:
- **formatted**
  - raw data formatted into [song][order] = chord_id
  - reformat by running `DataAnalysis::DataFormatterService.call`
- **frequency**
  - how often the macro chord appears
- **numerical_frequency**
  - how often the numerical chord appears



## NUMERICAL ANAYLYSIS
### convert to numerical chords
(steps in while loops)
1. key: [A-G](#|b)?
1. add
2. sus
3. no
4. base_chord
5. other_modification

# MODELS
1. ~~Chord::Base~~
2. ~~Chord::Modification~~

# CONSTANTS

note
  name - string
  symbol - string

scale
  name - string
  semitone_composition - [integer]

enharmonic
  all - [note.symbol => note.symbol]

key_signature
  sharps - [note.symbol]
  flats - [note.symbol]

# ACTIVE HASH

base_chord
  name
  symbol

modifications
  name
  symbol
  category


tonality
  symbol - string (comprised of key and mode: currently combined since we usually care about the unique combination)
  flats - integer
  sharps - integer
  type - string

chord_quality (this should be changed into a table eventually)
  name - string
  symbol - string
  type - string


<!-- PROPOSAL -->
chord_quality
  name
  symbol - base_chord.symbol + modifications.symbol
  base_chord - enum(major, minor, dominant_seventh, etc)
  modifications - [enum(flat_five, etc)]

<!-- END PROPOSAL -->

chord_quality_alt_name
  all - [chord_quality.symbol => chord_quality.symbol]

clef
  name - string


# MODEL
time_signature
  beats - integer
  value - integer (power of 2)

melody_note
  note - note.symbol
  octave - integer
  length - integer?
  start - measure_id
  song_id - song.id

song
  melody - [melody_note]
  tonality - tonality.symbol
  measures - [measures]
  time_signature_id - time_signature.id
  clef - clef.name

# SERVICES

generate_chords_for_melody


# ANALYSIS (Numerical)
  data[song][order][chords]
  cluster chord frequency
  graph chord transitions




<<<<<<< Updated upstream
Melody (macro) -> Melody (numerical) -> Chords (numerical) -> Chords(macro)
=======
Melody (macro) -> Melody (numerical) -> Chords (numerical) -> Chords(macro)
>>>>>>> Stashed changes
