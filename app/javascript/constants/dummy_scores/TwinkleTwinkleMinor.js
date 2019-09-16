
export const TWINKLE_TWINKLE_MINOR = () => {
  return {
    keySignature: "C minor",
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
        Ab,
        Ab,
        Object.assign(
          {},
          G,
          {length: "half"}
        ),
      ], [
        F,
        F,
        Eb,
        Eb,
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
        Eb,
        Eb,
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
        Eb,
        Eb,
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
        Ab,
        Ab,
        Object.assign(
          {},
          G,
          {length: "half"}
        ),
      ], [
        F,
        F,
        Eb,
        Eb,
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

const Eb = {
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

const Ab = {
  type: 'note',
  length: 'quarter',
  value: 'a5',
}


