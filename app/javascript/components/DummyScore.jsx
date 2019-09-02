import React from "react"
import Staff from "components/staff/Staff"
import Bar from "components/staff/Bar"
import MelodyNote from "components/staff/MelodyNote"
import Rest from "components/staff/Rest"
import Clef from "components/staff/Clef"
import TimeSignature from "components/staff/TimeSignature"

function DummyScore() {
  return (
    <Staff>
      <Clef type="treble" />
      <TimeSignature top={4} bottom={4} />
      <MelodyNote length="whole" value="c4" />
      <Bar />
      <MelodyNote length="half" value="d4" />
      <MelodyNote length="half" value="e4" />
      <Bar />
      <MelodyNote length="quarter" value="f4" />
      <MelodyNote length="quarter" value="g4" />
      <MelodyNote length="quarter" value="a5" />
      <MelodyNote length="quarter" value="b5" />
      <Bar type='double'/>
      <MelodyNote length="eighth" value="c5" />
      <MelodyNote length="eighth" value="d5" />
      <MelodyNote length="eighth" value="e5" />
      <MelodyNote length="eighth" value="f5" />
      <MelodyNote length="eighth" value="g5" />
      <MelodyNote length="eighth" value="a6" />
      <MelodyNote length="eighth" value="b6" />
      <MelodyNote length="eighth" value="c6" />
      <Bar />
      <MelodyNote length="eighth" value="c4" />
      <MelodyNote length="eighth" value="d4" />
      <MelodyNote length="eighth" value="e4" />
      <MelodyNote length="eighth" value="f4" />
      <MelodyNote length="eighth" value="g4" />
      <MelodyNote length="eighth" value="a5" />
      <MelodyNote length="eighth" value="b5" />
      <MelodyNote length="eighth" value="c5" />
      <Bar type='double' />
      <Rest length='whole' />
      <Bar />
      <Rest length='half' />
      <Rest length='half' />
      <Bar />
      <Rest length='half' />
      <Rest length='half' />
      <Bar />
      <Rest length='half' />
      <Rest length='half' />
      <Bar />
      <Rest length='half' />
      <Rest length='half' />
      <Bar />
      <Rest length='quarter' />
      <Rest length='quarter' />
      <Rest length='quarter' />
      <Rest length='eighth' />
      <Rest length='eighth' />
      <Bar type='double' />
      <MelodyNote length="quarter" accidental="flat" value="f4" />
      <MelodyNote length="quarter" accidental="sharp" value="g4" />
      <MelodyNote length="quarter" accidental="natural" value="a5" />
      <MelodyNote length="quarter" accidental="flat" value="b5" />
      <Bar type='end' />
    </Staff>
  );
}

export default DummyScore
