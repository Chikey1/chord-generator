import React from "react"
import PropTypes from "prop-types"
import Note from "components/staff/Note"
import { getStemDirection, isLineNote, getRelativeTop } from "helpers/MelodyNoteHelpers"
import StaffElement from "components/staff/StaffElement"

function MelodyNote({ length, value, accidental, clef}) {
  const stemDirection = getStemDirection(value)
  const lineNote = isLineNote(value)
  const top = getRelativeTop(value, clef)

  return (
    <div className={"melody-note"} style={{top: top + "px"}}>
      <Note
        stemDirection={stemDirection}
        length={length}
        lineNote={lineNote}
        accidental={accidental}
      />
    </div>
  );
}

MelodyNote.propTypes = {
  length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
  value: PropTypes.string.isRequired,
  accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
};

MelodyNote.defaultProps = {
  length: 'quarter',
  accidental: null,
};

export default MelodyNote
