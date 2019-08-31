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
3. [Chord Generator](#chord-generator)


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

## Chord Generator

### Harmony
This is the most important factor when it comes to evaluating the choice.
This can be calculated from the composition of the chords as well as the notes (weighted by length).

### Other Factors
1. **same song**
   - what chords are likely to be in the same song with each other
2. **first note**
   - what chord is likely to start
3. **last note**
   - what chord is likely to end
4. **naive next**
   - what chord is likely to follow
5. **overall frequency**
   - what chord is likely to appear
6. **unique chords**
   - how many unique chords is likely
