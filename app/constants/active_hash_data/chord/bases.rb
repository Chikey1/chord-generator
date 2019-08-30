module ActiveHashData
  module Chord
    BASES = [
      {
        id: 1,
        symbol: 'unison',
        name: 'unison',
        composition: [0],
      }, {
        id: 2,
        symbol: '5',
        name: 'power chord',
        composition: [0, 7],
      }, {
        id: 3,
        symbol: '',
        name: 'major',
        composition: [0, 4, 7],
      }, {
        id: 4,
        symbol: 'm',
        name: 'minor',
        composition: [0, 3, 7],
      }, {
        id: 5,
        symbol: 'dim',
        name: 'diminished',
        composition: [0, 3, 6],
      }, {
        id: 6,
        symbol: 'aug',
        name: 'augmented',
        composition: [0, 4, 8],
      }, {
        id: 7,
        symbol: '7',
        name: 'dominant seventh',
        composition: [0, 4, 7, 10],
      }, {
        id: 8,
        symbol: 'maj7',
        name: 'major seventh',
        composition: [0, 4, 7, 11],
      }, {
        id: 9,
        symbol: 'm7',
        name: 'minor seventh',
        composition: [0, 3, 7, 10],
      }, {
        id: 10,
        symbol: 'dim7',
        name: 'diminished seventh',
        composition: [0, 3, 6, 9],
      }, {
        id: 13,
        symbol: '9',
        name: 'dominant ninth',
        composition: [0, 4, 7, 10, 2],
        omit: [7],
      }, {
        id: 14,
        symbol: 'm9',
        name: 'minor ninth',
        composition: [0, 3, 7, 10, 2],
        omit: [7],
      }, {
        id: 15,
        symbol: 'maj9',
        name: 'major ninth',
        composition: [0, 4, 7, 11, 2],
        omit: [7],
      }, {
        id: 16,
        symbol: '11',
        name: 'dominant eleventh',
        composition: [0, 4, 7, 10, 2, 5],
        omit: [4, 7],
      }, {
        id: 17,
        symbol: 'maj11',
        name: 'major eleventh',
        composition: [0, 4, 7, 11, 2, 5],
        omit: [4, 7],
      }, {
        id: 18,
        symbol: 'm11',
        name: 'minor eleventh',
        composition: [0, 3, 7, 10, 2, 5],
        omit: [3, 7],
      }, {
        id: 19,
        symbol: '13',
        name: 'dominant thirteenth',
        composition: [0, 4, 7, 10, 2, 5, 9],
        omit: [7, 2, 5],
      }, {
        id: 20,
        symbol: 'm13',
        name: 'minor thirteenth',
        composition: [0, 3, 7, 10, 2, 5, 9],
        omit: [7, 2, 5],
      }, {
        id: 21,
        symbol: 'maj13',
        name: 'major thirteenth',
        composition: [0, 4, 7, 11, 2, 5, 9],
        omit: [7, 2, 5],
      }
    ].freeze
  end
end
