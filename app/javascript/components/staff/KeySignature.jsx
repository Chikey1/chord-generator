import React from "react"
import PropTypes from "prop-types"
import { keyInformation, flats, sharps } from "constants/KeySignatures"

function KeySignature({name, highlightOnHover, selected, onClick}) {
  const keySharps = keyInformation[name].sharps
  const keyFlats = keyInformation[name].flats
  var styles = "key-signature"
  highlightOnHover ? styles = styles + " highlight" : null
  selected ? styles = styles + " selected" : null

  if (keySharps > 0) {
    return(
      <div className={styles} onClick={onClick}>
        {sharps.slice(0, keySharps).map((sharp) =>
          <div key={sharp} className={`sharp ${sharp}`}></div>
        )}
      </div>
    )
  }

  if (keyFlats > 0) {
    return (
      <div className={styles} onClick={onClick}>
        {flats.slice(0, keyFlats).map((flat) =>
          <div key={flat} className={`flat ${flat}`}></div>
        )}
      </div>
    )
  }
  return <div className={styles} onClick={onClick}></div>
}

KeySignature.propTypes = {
  type: PropTypes.oneOf(['treble']).isRequired,
  highlightOnHover: PropTypes.bool.isRequired,
  selected: PropTypes.bool.isRequired,
  onClick: PropTypes.func,
};

KeySignature.defaultProps = {
  type: 'treble',
  selected: false,
  highlightOnHover: false,
};

export default KeySignature

