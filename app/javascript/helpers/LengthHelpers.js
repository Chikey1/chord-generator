export const getBeats = (length) => {
  switch(length) {
    case "quarter":
      return 1
    case "eighth":
      return 0.5
    case "whole":
      return 4
    case "half":
      return 2
  }
}

export const beatsInMeasure = (measure) => {
  var beats = 0
  measure.map((element) => {
    beats += getBeats(element.length)
  })
  return beats
}

export const greatestAvailableLength = (beats) => {
  switch(true) {
    case (beats >= 4):
      return "whole"
    case (beats >= 2):
      return "half"
    case (beats >= 1):
      return "quarter"
    case (beats >= 0.5):
      return "eighth"
  }
}