import React from "react"
import PropTypes from "prop-types"
import Staff from "components/staff/Staff"
import Bar from "components/staff/Bar"
import Measure from "components/staff/Measure"
import Clef from "components/staff/Clef"
import TimeSignature from "components/staff/TimeSignature"
import StaffElement from "components/staff/StaffElement"

function Score ({ timeSignature, clef, measures, onMeasureClick, selectedMeasure, highlightOnHover }) {
  return (
    <Staff>
      <Clef type={clef} />
      <TimeSignature top={timeSignature.top} bottom={timeSignature.bottom} />
      { measures.map((measure, index) => {
        return (
          <StaffElement key={index}>
            <StaffElement
              key={index}
              highlightOnHover={highlightOnHover}
              selected={selectedMeasure == index}
              onClick={() => onMeasureClick(index)}
            >
              <Measure
                data={measure}
              />
            </StaffElement>
            {index + 1 < measures.length && <StaffElement><Bar /></StaffElement>}
          </StaffElement>
        )
      })}
      <Bar type='end' />
    </Staff>
  );
}

Score.propTypes = {
  highlightOnHover: PropTypes.bool.isRequired,
  selectedMeasure: PropTypes.number,
  timeSignature: PropTypes.shape({
    top: PropTypes.number.isRequired,
    bottom: PropTypes.number.isRequired,
  }).isRequired,
  clef: PropTypes.oneOf(['treble']).isRequired,
  onMeasureClick: PropTypes.func.isRequired,
  measures: PropTypes.arrayOf(
    PropTypes.arrayOf(
      PropTypes.shape({
        type: PropTypes.oneOf(['rest', 'note']).isRequired,
        length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
        accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
      }).isRequired
    ).isRequired
  ).isRequired,
};

export default Score
