import React from "react"
import Note from "components/staff/Note"
import { isLineNote } from "helpers/MelodyNoteHelpers"
import StaffElement from "components/staff/StaffElement"
import { AVAILABLE_RANGE } from "constants/Notes"

function GhostNotes({value, onClick}) {
  return (
    <StaffElement>
      <div className="ghost-notes">
        {AVAILABLE_RANGE.map((note) => {
          return (
            <div
              key={note}
              className={`ghost-note ${note} ${note == value ? "selected" : null}`}
              onClick={() => {onClick(note)}}
            >
              { isLineNote(note) && <div className="line-note"></div> }
              <div className="head"></div>
            </div>
          )
        })}
      </div>
    </StaffElement>
  );
}

GhostNotes.propTypes = {

};

GhostNotes.defaultProps = {

};

export default GhostNotes
