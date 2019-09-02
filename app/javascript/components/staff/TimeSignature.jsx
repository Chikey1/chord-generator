import React from "react"
import PropTypes from "prop-types"
import StaffElement from "components/staff/StaffElement"

function TimeSignature({top, bottom}) {
  return (
    <StaffElement>
      <div className="time-signature">
        <div className="top">{top}</div>
        <div className="bottom">{bottom}</div>
      </div>
    </StaffElement>
  );
}

TimeSignature.propTypes = {
  top: PropTypes.number.isRequired,
  bottom: PropTypes.number.isRequired,
};

export default TimeSignature
