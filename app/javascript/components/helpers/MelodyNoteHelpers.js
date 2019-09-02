export const isLineNote = (value) => {
  // CharCodes
  // A => 65
  // B => 66
  // a => 97
  // b => 98

  // check = charCode + octave
  const octave = parseInt(value[1])
  const check = value.charCodeAt(0) + octave

  // if odd, line note
  return !!(check % 2)
}

export const getStemDirection = (value) => {
  // assume treble clef
  // b5 and below are up

  const octave = parseInt(value[1])
  if(octave < 5) {
    return "up"
  }
  if(octave > 5) {
    return "down"
  }
  if(value[0] === "a" || value[0] === "b") {
    return "up"
  }
  return "down"
}