import React from "react"
import PropTypes from "prop-types"

function Note({ stemDirection, length, lineNote, accidental }) {
  return(
    <div className={`note ${length} stem-${stemDirection}`}>
      { accidental && <div className={`accidental ${accidental}`}></div> }
      { lineNote && <div className="line-note"></div> }
      <div className="head"></div>
      <div className="flag"></div>
    </div>
  )
}

Note.propTypes = {
  stemDirection: PropTypes.oneOf(['up', 'down']).isRequired,
  length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
  lineNote: PropTypes.bool.isRequired,
  accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
};

Note.defaultProps = {
  stemDirection: "up",
  length: 'quarter',
  lineNote: false,
  accidental: null,
};

export default Note
