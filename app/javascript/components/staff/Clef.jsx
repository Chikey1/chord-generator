import React from "react"
import PropTypes from "prop-types"
import StaffElement from "components/staff/StaffElement"

function Clef({type}) {
  return (
    <StaffElement>
      <div className={`clef ${type}`}></div>
    </StaffElement>
  );
}

Clef.propTypes = {
  type: PropTypes.oneOf(['treble']).isRequired,
};

Clef.defaultProps = {
  type: 'treble',
};

export default Clef
