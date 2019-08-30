# frozen_string_literal: true

module ActiveHashData
  module Chord
    MODIFICATIONS = [
      {
        id: 1,
        symbol: 'no5',
        name: 'no five',
        remove: [7],
      }, {
        id: 2,
        symbol: 'no3',
        name: 'no three',
        remove: [3, 4],
      }, {
        id: 3,
        symbol: 'b5',
        name: 'flat five',
        remove: [7],
        add: [6],
      }, {
        id: 4,
        symbol: 'b9',
        name: 'flat nine',
        remove: [2],
        add: [1],
      }, {
        id: 5,
        symbol: 'sus4',
        name: 'suspended four',
        remove: [3, 4],
        add: [5],
      }, {
        id: 6,
        symbol: 'sus2',
        name: 'suspended two',
        remove: [3, 4],
        add: [2],
      }, {
        id: 7,
        symbol: 'add2',
        name: 'add two',
        add: [2],
      }, {
        id: 8,
        symbol: 'add4',
        name: 'add four',
        add: [5],
      }, {
        id: 9,
        symbol: 'addb6',
        name: 'add flat six',
        add: [8],
      }, {
        id: 10,
        symbol: 'add6',
        name: 'add six',
        add: [9],
      }, {
        id: 11,
        symbol: 'add9',
        name: 'add nine',
        add: [2],
      }, {
        id: 12,
        symbol: 'add11',
        name: 'add eleven',
        add: [5],
      }, {
        id: 13,
        symbol: 'addb13',
        name: 'add flat thirteen',
        add: [8],
      }, {
        id: 14,
        symbol: 'add13',
        name: 'add thirteen',
        add: [9],
      }, {
        id: 15,
        symbol: '#11',
        name: 'sharp 11',
        remove: [5],
        add: [6],
      }, {
        id: 16,
        symbol: 'b11',
        name: 'flat 11',
        remove: [5],
        add: [4],
      }
    ].freeze
  end
end
