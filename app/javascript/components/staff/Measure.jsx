import React from "react"
import PropTypes from "prop-types"
import MelodyNote from "components/staff/MelodyNote"
import Rest from "components/staff/Rest"
import StaffElement from "components/staff/StaffElement"

function Measure ({data, clef}) {
  return (
    <div className="measure">
      {data.map((entity, index) => {
        return(
          <StaffElement key={index}>
            {entity.type == "rest" && <Rest length={entity.length} key={index}/>}
            {entity.type == "note" &&
              <MelodyNote
                value={entity.value}
                length={entity.length}
                accidental={entity.accidental}
                key={index}
                clef={clef}
              />
            }
          </StaffElement>
        )
      })}
    </div>
  );
}

Measure.propTypes = {
  data: PropTypes.arrayOf(
    PropTypes.shape({
      type: PropTypes.oneOf(['rest', 'note']).isRequired,
      length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
      accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
    }).isRequired
  )
};

export default Measure
