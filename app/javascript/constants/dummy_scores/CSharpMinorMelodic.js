
export const C_SHARP_MINOR_MELODIC = () => {
  return {
    keySignature: "C# minor",
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      [
        C,
        D,
        E,
        F,
      ], [
        G,
        Object.assign(
          {},
          A,
          {accidental: "sharp"}
        ),
        Object.assign(
          {},
          B,
          {accidental: "sharp"}
        ),
        C5,
      ], [
        Object.assign(
          {},
          B,
          {accidental: "natural"}
        ),
        Object.assign(
          {},
          A,
          {accidental: "natural"}
        ),
        G,
        F,
      ], [
        E,
        D,
        Object.assign(
          {},
          C,
          {length: "half"}
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

const D = {
  type: 'note',
  length: 'quarter',
  value: 'd4',
}

const E = {
  type: 'note',
  length: 'quarter',
  value: 'e4',
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

const A = {
  type: 'note',
  length: 'quarter',
  value: 'a5',
}


const B = {
  type: 'note',
  length: 'quarter',
  value: 'b5',
}


const C5 = {
  type: 'note',
  length: 'quarter',
  value: 'c5',
}