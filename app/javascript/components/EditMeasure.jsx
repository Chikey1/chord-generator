import React from "react"
import PropTypes from "prop-types"
import Staff from "components/staff/Staff"
import StaffElement from "components/staff/StaffElement"
import Bar from "components/staff/Bar"
import MelodyNote from "components/staff/MelodyNote"
import Rest from "components/staff/Rest"
import EditElement from "components/EditElement"
import Button from "components/Button"
import Clef from "components/staff/Clef"
import { getBeats, beatsInMeasure, greatestAvailableLength } from "components/helpers/LengthHelpers"

class EditMeasure extends React.Component {
  state = {
    measure: this.props.measure,
    selectedElementId: 0,
  };

  componentDidUpdate(prevProps, _prevState) {
    if(prevProps.measure != this.props.measure) {
      this.setState({
        measure: this.props.measure,
        selectedElementId: 0,
      })
    }
  }


  handleElementClick = (index) => {
    this.setState({selectedElementId: index})
  }

  handleElementChange = (element) => {
    const { measure, selectedElementId } = this.state

    if (measure[selectedElementId].length != element.length) {
      var newMeasure = this.getNewMeasure(element)
    } else {
      var newMeasure = measure.map((m) => m) // weird bug
      newMeasure[selectedElementId] = element
    }
    this.setState({measure: newMeasure})
  }

  getNewMeasure = (element) => {
    var newMeasure = this.state.measure.map((m) => m) // weird bug
    const { selectedElementId } = this.state
    if(getBeats(newMeasure[selectedElementId].length) > getBeats(element.length)) {
      newMeasure[selectedElementId] = element
    } else {
      newMeasure.splice(selectedElementId, 1)
      while(4 - beatsInMeasure(newMeasure) < getBeats(element.length)) {// four/four time
        newMeasure.pop(1)
      }

      if(selectedElementId >= newMeasure.length) {
        this.setState({selectedElementId: newMeasure.length})
        newMeasure.push(element)
      } else {
        newMeasure.splice(selectedElementId, 0, element)
      }
    }

    // add white space
    while(4 - beatsInMeasure(newMeasure) > 0) {// four/four time
      const rest = {
        type: "rest",
        length: greatestAvailableLength(4 - beatsInMeasure(newMeasure))
      }
      newMeasure.push(rest)
    }
    return newMeasure
  }



  render () {
    const { measure, selectedElementId } = this.state
    const { id, onSave } = this.props
    return (
      <div className='p-5 d-flex flex-column align-items-center'>
        <div className="text-center">Edit measure {id + 1}: </div>
        <div className="edit-measure d-flex justify-content-center p-2 m-3">
          <div className="edit-element-staff">
            <Staff>
              <Clef type="treble" />
              <StaffElement>
                {measure.map((entity, index) => {
                  return(
                    <StaffElement
                      key={index}
                      highlightOnHover={true}
                      selected={selectedElementId == index}
                      onClick={() => this.handleElementClick(index)}
                    >
                      {entity.type == "rest" && <Rest length={entity.length} key={index}/>}
                      {entity.type == "note" &&
                        <MelodyNote
                          length={entity.length}
                          accidental={entity.accidental}
                          key={index}
                          value={entity.value}
                        />
                        }
                    </StaffElement>
                  )
                })}
              </StaffElement>
              <Bar type="end" />
            </Staff>
          </div>
        </div>
        <EditElement
          element={measure[selectedElementId]}
          onChange={this.handleElementChange}
        />
        <Button type='dark' onClick={() => {onSave(measure)}}>Update!</Button>
      </div>
    );
  }
}

EditMeasure.propTypes = {
  measure: PropTypes.arrayOf(
    PropTypes.shape({
      type: PropTypes.oneOf(['rest', 'note']).isRequired,
      length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
      accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
    }).isRequired
  ).isRequired,
};

export default EditMeasure
