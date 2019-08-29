# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


#CONSTANTS

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
  symbol
  base_chord - enum(major, minor, dominant_seventh, etc)
  modifications - [enum(flat_five, etc)]

base_chord
  name
  symbol

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