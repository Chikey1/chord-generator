import React from "react"
import PropTypes from "prop-types"
import StaffElement from "components/staff/StaffElement"

function Bar({type}) {
  if(type == "end") {
    return (
      <div className={`bar ${type}`}></div>
    )
  }
  return (
    <StaffElement><div className={`bar ${type}`}></div></StaffElement>
  );
}

Bar.propTypes = {
  type: PropTypes.oneOf(['', 'double', 'end']).isRequired,
};

Bar.defaultProps = {
  type: '',
};

export default Bar
