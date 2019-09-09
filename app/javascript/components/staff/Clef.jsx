import React from "react"
import PropTypes from "prop-types"

function Clef({type, highlightOnHover, selected}) {
  var styles = `clef ${type}`
  highlightOnHover ? styles = styles + " highlight" : null
  selected ? styles = styles + " selected" : null

  return (
    <div className={styles}></div>
  );
}

Clef.propTypes = {
  type: PropTypes.oneOf(['treble']).isRequired,
  highlightOnHover: PropTypes.bool.isRequired,
  selected: PropTypes.bool.isRequired,
};

Clef.defaultProps = {
  type: 'treble',
  selected: false,
  highlightOnHover: false,
};

export default Clef