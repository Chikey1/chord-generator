# README
see the demo here!
https://chord-generator.herokuapp.com/

<!-- ## Pre-Commit

1. `rubocop`
2. `eslint`
3. `yarn flow` -->

## Sections
1. [Chord Generator](#chord-generator)
2. [Data](#data)
   1. [raw](#raw)
   2. [analysis](#analysis)
   3. [data recovery](#data-recovery)
3. [Services](#services)
   1. [converter](#converter)
   2. [data analysis](#data-analysis)
   3. [other](#other)
4. [Models](#models)
5. [Looking Ahead](#looking-ahead)




**application structure**

pdf: https://drive.google.com/file/d/1pEjt-SkXFFnrrDXKdpylT-wp3gapSbSI/view?usp=sharing

drawio: https://drive.google.com/file/d/12H74gR6_ta_tq-g9l5z4RJe-RFU9lgbO/view?usp=sharing


## Chord Generator
can be found in `ChordGenerator::GenerateService`
most of the matrix calculations is in `ChordGenerator::CalculateChordsService`

### Harmony
This is the most important factor when it comes to evaluating the choice.
This can be calculated from the composition of the chords as well as the notes (weighted by length).

### Other Factors
1. **chord groupings**
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

## Data
### RAW
raw data is exported from web scraper: https://github.com/Chikey1/music-web-scraper

has one file for each tonality

each file has one line for each song

the line is formatted as:

`title: chord, chord, chord, chord`

### DATA ANALYSIS
NOTE: BEFORE RECALCULATING, RUN `DataAnalysis::CheckChordsService.call` TO CHECK FOR ERRORS

is split into the following, all stored as:
- **formatted** (json 2D array)
  - raw data formatted into `[song][order] = chord_id`
- **analysis/factors**
  - overall chord appearance
  - chord groupings
  - first note
  - last note
  - next chord frequency (chord relationships)

### DATA RECOVERY
If you lose your db or want to update your data
1. `DataAnalysis::DataFormatterService.call`
    - this will create the chords you need in the backend to index
    - this will also update the formatted data
2. `DataAnalysis::NumericalFrequencyService.call`
    - this will create frequency data from the formatted data
3. `DataAnalysis::NumericalFrequencyPercentageService.call`
    - this will create some factors you need for recommendation from the frequency data
4. `DataAnalysis::NumericalProgressionService.call`
    - this will create some factors you need for recommendation from the formatted data
5. `DataAnalysis::PerSongFrequencyService.call`
    - this will create some factors you need for recommendation from the formatted data
6. `Matrices::GenerateService.call`
    - this will create the matrices needed to generate chords

**RUN `rake db:seed:dump FILE=db/seeds/chords.rb` IF NEW CHORDS ARE ADDED!


## Services (may be outdated)
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

### OTHER (may be outdated)
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

## MODELS (may be outdated)
### Chord::
- **Base**
  - ActiveHash
- **Modification**
  - ActiveHash
- **NumericalChord**
  - ActiveRecord

## LOOKING AHEAD
### Front-End:
- add multiple clefs (backend already supports this)
- add multiple time signatures (backend already supports this)
- add more musical notation (backend already supports this)
- rethink UX design of editing score (maybe drag and drop?)

### Back-End:
- currently only have chord progression data, try to get chords + melody data
- play around with some ML potentially?
- more fun to be had back here