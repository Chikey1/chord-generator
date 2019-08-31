# README

## If you lose your db or want to update your data
1. `DataAnalysis::DataFormatterService.call`
    - this will create the chords you need in the backend to index
    - this will also update the formatted data
2. `DataAnalysis::NumericalFrequencyService.call`
    - this will create frequency data from the formatted data
3. `DataAnalysis::NumericalFrequencyPercentageService.call`
    - this will create some factors you need for recommendation from the frequency data
4. `DataAnalysis::NumericalProgressionService.call`
    - this will create some factors you need for recommendation from the formatted data

## Sections

1. [Data](#data)
   1. [raw](#raw)
   2. [analysis](#analysis)
2. [Services](#services)
   1. [converter](#converter)
   2. [data analysis](#data-analysis)
   3. [other](#other)


backend: https://drive.google.com/file/d/12H74gR6_ta_tq-g9l5z4RJe-RFU9lgbO/view?usp=sharing

## Data
### RAW

has one file for each tonality

each file has one line for each song

the line is formatted as:

`title: chord, chord, chord, chord`

### ANALYSIS
NOTE: BEFORE RECALCULATING, RUN `DataAnalysis::CheckChordsService.call` TO CHECK FOR ERRORS
is split into the following, all stored as:
- **formatted** (json 2D array)
  - raw data formatted into `[song][order] = chord_id`
  - reformat by running `DataAnalysis::DataFormatterService.call`
- **numerical_frequency**
  - overall
  - appears with other chords in a song
  - first note
  - last note
- **numerical_progression**
  - what numerical chord is most likely to come after the current
  - uses formatted data

## Services
### CONVERTER::
- **MacroChordService**
  - `.call`
    - input: clean chord name - `"Dmaj7add13"`
    - ouput: `MacroChord` attributes - `{ key: "D", quality: "maj7add13", base: "maj", modifications: "add13", unknown: ""}`
    - *if unknown is present, there is an error with the input

### DATA ANALYSIS::
- **DataCleanerService**
  - `.clean_line`
    - input: a line of raw data - `title: chord, chord, chord, chord`
    - output: array of clean chords
- **DataFormatterService**
  - `.call`
    - converts raw data into formatted data
    - [see data](#data) for more information
- **NumericalFrequencyService**
  - `.call`
    - converts formatted data into factors
    - [see data](#data) for more information

- **NumericalProgressionService**
  - `.call`
    - converts formatted data into factors
    - [see data](#data) for more information

### OTHER
- **NoteService**
  - `.semitone_distance`
  - `.get_note_index`
  - `.sharp?`
  - `.flat?`

- **PerformanceTester**
- `.call`
    - for development purposes to test performance
- **ScaleService**
  - `.scale_from_key`
    - input: `'Am'`
    - output: `["A", "B", "C", "D", "E", "F", "G", "A"]`
  - `.build_scale(root, mode)`
    - input: root - "C", mode - "major"
    - output: same as `scale_from_key`

## MODELS
### Chord::
- **Base**
  - ActiveHash
- **Modification**
  - ActiveHash
- **NumericalChord**
  - ActiveRecord

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




Melody (macro) -> Melody (numerical) -> Chords (numerical) -> Chords(macro)
