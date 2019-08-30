# README

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
- **frequency**
  - how often the macro chord appears
  - by song (json array of hashes)
  - by key (json hash)
  - uses raw data
  - recalculate frequency by song: `DataAnalysis::FrequencyService.calculate`
  - recalculate frequency by key: `DataAnalysis::FrequencyService.calculate_total`
- **numerical_frequency**
  - how often the numerical chord appears
  - by song (json array of hashes)
  - by key (json hash)
  - uses formatted data
  - recalculate frequency by song: `DataAnalysis::NumericalFrequencyService.calculate`
  - recalculate frequency by key: `DataAnalysis::NumericalFrequencyService.calculate_total`
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
- **NumericalChordService**
  - `.id_from_name`
    - input: clean chord name - `"Dmaj7add13"`, tonality - `"D"`
    - ouput: integer

### DATA ANALYSIS::
- **CheckChordsService**
  - `.call`
    - run in console to check that raw data is correct
    - will output any unknown chords to console
- **DataCleanerService**
  - `.clean_line`
    - input: a line of raw data - `title: chord, chord, chord, chord`
    - output: array of clean chords
- **DataFormatterService**
  - `.call`
    - converts raw data into formatted data
    - [see data](#data) for more information

- **FrequencyService**
  - `.calculate`
    - calculates macro chord frequencies by song
  - `.calculate_total`
    - calculates macro chord frequencies by tonality
  - [see data](#data) for more information

- **NumericalFrequencyService**
  - work in prog

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

# MODELS
1. ~~Chord::Base~~
2. ~~Chord::Modification~~




## NUMERICAL ANAYLYSIS
### convert to numerical chords
(steps in while loops)
1. key: [A-G](#|b)?
1. add
2. sus
3. no
4. base_chord
5. other_modification



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
