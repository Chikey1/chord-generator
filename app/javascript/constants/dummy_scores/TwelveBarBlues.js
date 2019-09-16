
export const TWELVE_BAR_BLUES = () => {
  const I = [
    Bb,
    Bb,
    D,
    F
  ]

  const I7 = [
    Bb,
    D,
    F,
    Object.assign(
      {},
      A,
      {accidental: "flat"}
    ),
  ]

  const IV = [
    Eb,
    Eb,
    G,
    Bb,
  ]

  const IV7 = [
    Eb,
    G,
    Bb,
    Object.assign(
      {},
      D,
      {accidental: "flat"}
    ),
  ]

  const V = [
    F,
    F,
    A,
    C,
  ]

  const V7 = [
    F,
    A,
    C,
    Eb,
  ]

  return {
    keySignature: "Bb major",
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      I, IV, I, I7, 
      IV, IV7, I, I7,
      V, IV, I, V7
    ],
  }
}

const Bb = {
  type: 'note',
  length: 'quarter',
  value: 'b5',
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

const A = {
  type: 'note',
  length: 'quarter',
  value: 'a5',
}
