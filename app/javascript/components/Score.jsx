import React from "react"
import PropTypes from "prop-types"
import Staff from "components/staff/Staff"
import Bar from "components/staff/Bar"
import DummyScore from "components/DummyScore"
import Measure from "components/staff/Measure"
import Clef from "components/staff/Clef"
import TimeSignature from "components/staff/TimeSignature"
import KeySignature from "components/staff/KeySignature"
import StaffElement from "components/staff/StaffElement"

function Score ({
  timeSignature,
  keySignature,
  clef,
  measures,
  onMeasureClick,
  selectedMeasure,
  editing,
  deleting,
  onKeySignatureClick,
}) {
  return (
    <Staff>
      <Clef
        type={clef}
        highlightOnHover={editing}
        selected={false}
      />
      <KeySignature
        name={keySignature}
        highlightOnHover={editing}
        selected={false}
        onClick={onKeySignatureClick}
      />
      <TimeSignature
        top={timeSignature.top} bottom={timeSignature.bottom}
        highlightOnHover={editing}
        selected={false}
        onClick={()=>{}}
      />
      { measures.map((measure, index) => {
        return (
          <StaffElement key={index}>
            <StaffElement
              key={index}
              highlightOnHover={editing || deleting}
              selected={selectedMeasure == index}
              onClick={() => onMeasureClick(index)}
            >
              <Measure
                data={measure}
                clef={clef}
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
  editing: PropTypes.bool.isRequired,
  deleting: PropTypes.bool.isRequired,
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
