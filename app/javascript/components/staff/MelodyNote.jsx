import React from "react"
import PropTypes from "prop-types"
import Note from "components/staff/Note"
import { getStemDirection, isLineNote } from "components/helpers/MelodyNoteHelpers"
import StaffElement from "components/staff/StaffElement"

function MelodyNote({ length, value, accidental}) {
  const stemDirection = getStemDirection(value)
  const lineNote = isLineNote(value)
  return (
    <StaffElement>
      <div className={`melody-note ${value}`}>
        <Note
          stemDirection={stemDirection}
          length={length}
          lineNote={lineNote}
          accidental={accidental}
        />
      </div>
    </StaffElement>
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
