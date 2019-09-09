
export const ODE_TO_JOY = () => {
  return {
    keySignature: "D major",
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      [
        F,
        F,
        G,
        A,
      ], [
        A,
        G,
        F,
        E,
      ], [
        D,
        D,
        E,
        F,
      ], [
        F,
        E, {
          type: 'note',
          length: 'half',
          value: 'e4',
        }
      ], [
        F,
        F,
        G,
        A,
      ], [
        A,
        G,
        F,
        E,
      ], [
        D,
        D,
        E,
        F,
      ], [
        E,
        D, {
          type: 'note',
          length: 'half',
          value: 'd4',
        }
      ]
    ],
  }
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