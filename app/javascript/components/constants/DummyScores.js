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

const F_SHARP = {
  type: 'note',
  length: 'quarter',
  value: 'f4',
  accidental: 'sharp',
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


export const ODE_TO_JOY = [
  [
    F_SHARP,
    F,
    G,
    A,
  ], [
    A,
    G,
    F_SHARP,
    E,
  ], [
    D,
    D,
    E,
    F_SHARP,
  ], [
    F_SHARP,
    E, {
      type: 'note',
      length: 'half',
      value: 'e4',
    }
  ], [
    F_SHARP,
    F,
    G,
    A,
  ], [
    A,
    G,
    F_SHARP,
    E,
  ], [
    D,
    D,
    E,
    F_SHARP,
  ], [
    E,
    D, {
      type: 'note',
      length: 'half',
      value: 'd4',
    }
  ]
]
