import React from "react"
import Score from "components/Score"
import DummyScore from "components/DummyScore"
import Button from "components/Button"
import EditMeasure from "components/EditMeasure"

class Base extends React.Component {
  state = {
    timeSignature: {
      top: 4,
      bottom: 4,
    },
    clef: "treble",
    measures: [
      [
        {
          type: "rest",
          length: "whole",
        },
      ],
    ],
    deleting: false,
    editing: false,
    selectedMeasure: null,
  }

  handleAddMeasure = () => {
    var new_measures = this.state.measures
    new_measures.push([{
      type: "rest",
      length: "whole",
    }])
    this.setState({measures: new_measures})
  }

  handleEditButtonClick = () => {
    const new_state = !this.state.editing
    this.setState({
      editing: new_state,
      selectedMeasure: null,
    })
    console.log("Edit!")
  }

  handleDeleteButtonClick = () => {
    const new_state = !this.state.deleting
    this.setState({
      deleting: new_state,
      selectedMeasure: null,
    })
    console.log("Delete!")
  }

  handleDeleteMeasure = () => {
    var new_measures = this.state.measures
    new_measures.splice(this.state.selectedMeasure, 1)
    this.setState({
      measures: new_measures,
      selectedMeasure: null,
    })
  }

  handleMeasureClick = (index) => {
    if (this.state.editing ||this.state.deleting) {
      this.setState({
        selectedMeasure: {
          id: index,
          measure: this.state.measures[index],
        }
      })
    }
  }

  renderDeleteConfirmation = () => {
    const { deleting, selectedMeasure, measures } = this.state
    if(deleting && selectedMeasure && measures.length > 1) {
      return(
      <div className="d-flex flex-column align-items-center py-2 border border-dark rounded mb-5">
        <p>Delete measure {selectedMeasure.id + 1}?</p>
        <Button onClick={this.handleDeleteMeasure} type='danger'>
          Confirm
        </Button>
      </div>
      )
    }
    return null
  }

  renderEditMeasure = (selectedMeasure) => {
    const { editing } = this.state
    if(editing && selectedMeasure) {
      return(
        <EditMeasure
          id={selectedMeasure.id}
          measure={selectedMeasure.measure}
          onSave={this.handleMeasureEdit}
        />
      )
    }
    return null
  }

  handleMeasureEdit = (measure) => {
    var newScore = this.state.measures.map((m) => m) // weird bug
    newScore[this.state.selectedMeasure.id] = measure
    this.setState({measures: newScore})
  }

  render () {
    const { timeSignature, clef, measures, deleting, editing, selectedMeasure } = this.state
    const selectedMeasureId = selectedMeasure ? selectedMeasure.id : null
    return (
      <div className='p-5'>
        <h2 className="text-center">Chord Generator</h2>
        <div className="pt-5 pb-3">
          <DummyScore />
        </div>
        <div className="pt-5 pb-3">
          <Score
            clef={clef}
            timeSignature={timeSignature}
            measures={measures}
            onMeasureClick={this.handleMeasureClick}
            highlightOnHover={editing || deleting}
            selectedMeasure={selectedMeasureId}
          />
        </div>
        {this.renderDeleteConfirmation()}
        {this.renderEditMeasure(selectedMeasure)}
        <div className="d-flex justify-content-center py-2">
          <Button onClick={this.handleAddMeasure} type='dark' disabled={deleting || editing}>
            Add Measure
          </Button>
          <Button onClick={this.handleEditButtonClick} type='dark' disabled={deleting}>
            { editing ? "Stop Editing" : "Edit Measure" }
          </Button>
          <Button onClick={this.handleDeleteButtonClick} type='danger' disabled={editing}>
            { deleting ? "Stop Deleting" : "Delete Measure" }
          </Button>
        </div>
        <div className="d-flex justify-content-center py-2">
          <Button type='success' disabled={deleting || editing}>Generate Chords!</Button>
        </div>
      </div>
    );
  }
}

export default Base
