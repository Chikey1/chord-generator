
export const HAPPY_BIRTHDAY_MINOR = () => {
  return {
    keySignature: "F minor",
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      [
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        Db,
        C,
        F,
      ], [
        Object.assign(
          {},
          E,
          {length: "whole"}
        ),
      ], [
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        Db,
        C,
        G,
      ], [
        Object.assign(
          {},
          F,
          {length: "whole"}
        ),
      ], [
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        Object.assign(
          {},
          C,
          {length: "eighth"}
        ),
        C5,
        Ab,
        F,
      ], [
        E,
        Db,
        Object.assign(
          {},
          Db,
          {length: "half"}
        ),
      ], [
        Object.assign(
          {},
          Bb,
          {length: "eighth"}
        ),
        Object.assign(
          {},
          Bb,
          {length: "eighth"}
        ),
        Ab,
        F,
        G,
      ], [
        Object.assign(
          {},
          F,
          {length: "whole"}
        ),
      ]
    ],
  }
}


const C = {
  type: 'note',
  length: 'quarter',
  value: 'c4',
}

const Db = {
  type: 'note',
  length: 'quarter',
  value: 'd4',
}

const E = {
  type: 'note',
  length: 'quarter',
  value: 'e4',
  accidental: 'natural',
}

const F = {
  type: 'note',
  length: 'quarter',
  value: 'f4',
}

const G = {
  type: 'note',
  length: 'quarter',
  value: 'g4',
}

const Ab = {
  type: 'note',
  length: 'quarter',
  value: 'a5',
}


const Bb = {
  type: 'note',
  length: 'quarter',
  value: 'b5',
}

const C5 = {
  type: 'note',
  length: 'quarter',
  value: 'c5',
}