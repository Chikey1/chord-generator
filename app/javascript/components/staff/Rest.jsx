import React from "react"
import PropTypes from "prop-types"
import StaffElement from "components/staff/StaffElement"

function Rest({length}) {
  return (
    <div className={`rest ${length}`}></div>
  )
}


Rest.propTypes = {
  length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
};

Rest.defaultProps = {
  length: 'whole',
};

export default Rest
