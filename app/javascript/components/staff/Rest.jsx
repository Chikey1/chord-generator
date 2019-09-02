import React from "react"
import PropTypes from "prop-types"
import StaffElement from "components/staff/StaffElement"

function Rest({length}) {
  return (
    <StaffElement><div className={`rest ${length}`}></div></StaffElement>
  )
}


Rest.propTypes = {
  length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
};

Rest.defaultProps = {
  length: 'whole',
};

export default Rest
