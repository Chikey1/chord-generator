import React from "react"
import PropTypes from "prop-types"

function StaffElement({ children, highlightOnHover, selected, onClick }) {
  const styles = "staff-element " +
    (highlightOnHover ? "highlightOnHover " : "") +
    (selected ? "selected" : "")
  return (
    <div onClick={onClick} className={styles}>{children}</div>
  );
}

StaffElement.propTypes = {
  highlightOnHover: PropTypes.bool,
  selected: PropTypes.bool,
  onClick: PropTypes.func,
};

StaffElement.defaultProps = {
  highlightOnHover: false,
  selected: false,
  onClick: () => {},
};

export default StaffElement
