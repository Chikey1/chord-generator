
export const TWINKLE_TWINKLE= () => {
  return {
    keySignature: "C major",
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      [
        C,
        C,
        G,
        G,
      ], [
        A,
        A,
        Object.assign(
          {},
          G,
          {length: "half"}
        ),
      ], [
        F,
        F,
        E,
        E,
      ], [
        D,
        D,
        Object.assign(
          {},
          C,
          {length: "half"}
        ),
      ], [
        G,
        G,
        F,
        F,
      ], [
        E,
        E,
        Object.assign(
          {},
          D,
          {length: "half"}
        ),
      ], [
        G,
        G,
        F,
        F,
      ], [
        E,
        E,
        Object.assign(
          {},
          D,
          {length: "half"}
        ),
      ], [
        C,
        C,
        G,
        G,
      ], [
        A,
        A,
        Object.assign(
          {},
          G,
          {length: "half"}
        ),
      ], [
        F,
        F,
        E,
        E,
      ], [
        D,
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
