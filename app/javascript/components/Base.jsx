import React from "react"
import Score from "components/Score"
import Button from "components/Button"
import EditMeasure from "components/EditMeasure"
import { ODE_TO_JOY, C_SHARP_MINOR_MELODIC } from "constants/DummyScores"
import EditKeySignature from "components/EditKeySignature"
import { post } from "utility/api"

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
    keySignature: "C major",
    chordInterval: 1,
    editKeySignature: false,
    chords: [],
  }

  handleKeySignatureClick = () => {
    this.setState({
      editKeySignature: true,
      selectedMeasure: null,
    })
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
      editKeySignature: false,
    })
  }

  handleDeleteButtonClick = () => {
    const new_state = !this.state.deleting
    this.setState({
      deleting: new_state,
      selectedMeasure: null,
    })
  }

  handleDeleteMeasure = () => {
    var new_measures = [...this.state.measures]
    new_measures.splice(this.state.selectedMeasure.id, 1)
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
        },
        editKeySignature: false,
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

  populateDemo = () => {
    const demo = C_SHARP_MINOR_MELODIC()
    this.setState({
      measures: demo.measures,
      keySignature: demo.keySignature,
      clef: demo.clef,
      timeSignature: demo.timeSignature,
    })
  }

  handleMeasureEdit = (measure) => {
    var newScore = this.state.measures.map((m) => m) // weird bug
    newScore[this.state.selectedMeasure.id] = measure
    this.setState({measures: newScore})
  }

  handleKeySignatureEdit = (change) => {
    this.setState({
      keySignature: change,
      editKeySignature: false,
    })
  }

  generateChords = () => {
    const data = {
      measures: this.state.measures,
      key_signature: this.state.keySignature,
      time_signature: this.state.timeSignature,
      chord_interval: this.state.chordInterval,
    }

    post('/generate-chords', data).then((response) => {
      if (response.status !== 200) {
        console.log('Looks like there was a problem. Status Code: ' +
          response.status);
        return;
      }

      response.json().then((data) => {
        console.log(data);
      });

    }).catch((err) => {
      console.log('Fetch Error :-S', err);
    })
  }

  renderEdit = () => {
    const { keySignature, selectedMeasure, editing, editKeySignature} = this.state
    if (editing && selectedMeasure) {
      return (
        <EditMeasure
          id={selectedMeasure.id}
          measure={selectedMeasure.measure}
          onSave={this.handleMeasureEdit}
          keySignature={keySignature}
        />
      )
    }
    if (editing && editKeySignature) {
      return (
        <EditKeySignature
          onSave={this.handleKeySignatureEdit}
          current={keySignature}
        />
      )
    }
    return null
  }

  render () {
    const { timeSignature, clef, measures, deleting, editing, selectedMeasure, keySignature, chords } = this.state
    const selectedMeasureId = selectedMeasure ? selectedMeasure.id : null
    return (
      <div className='p-5'>
        <h2 className="text-center">Chord Generator</h2>
        <div className="pt-5 pb-3">
          <Score
            clef={clef}
            editing={editing}
            deleting={deleting}
            timeSignature={timeSignature}
            keySignature={keySignature}
            measures={measures}
            chords={chords}
            onKeySignatureClick={this.handleKeySignatureClick}
            onMeasureClick={this.handleMeasureClick}
            selectedMeasure={selectedMeasureId}
          />
        </div>
        {this.renderDeleteConfirmation()}
        {this.renderEdit()}
        <div className="d-flex justify-content-center py-2 mt-5" style={{zIndex: 1}}>
          <Button onClick={this.handleEditButtonClick} type='dark' disabled={deleting}>
            { editing ? "Stop Editing" : "Edit Score" }
          </Button>
          <Button onClick={this.handleAddMeasure} type='dark' disabled={deleting || editing}>
            Add Measure
          </Button>
          <Button onClick={this.handleDeleteButtonClick} type='danger' disabled={editing}>
            { deleting ? "Stop Deleting" : "Delete Measure" }
          </Button>
        </div>
        <div className="d-flex justify-content-center py-2">
          <Button onClick={this.populateDemo} type='dark' disabled={deleting || editing}>
            Demo Data
          </Button>
          <Button onClick={this.generateChords} type='success' disabled={deleting || editing}>Generate Chords!</Button>
        </div>
      </div>
    );
  }
}

export default Base
