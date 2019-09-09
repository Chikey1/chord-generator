import React from "react"
import Staff from "components/staff/Staff"
import KeySignature from "components/staff/KeySignature"
import { keyInformation } from "constants/KeySignatures"
import Button from "components/Button"
import Clef from "components/staff/Clef"
import Select from 'react-select';

class EditKeySignature extends React.Component {
  state = {
    current: this.props.current,
  };

  componentDidUpdate(prevProps, _prevState) {
    if(prevProps.current != this.props.current) {
      this.setState({
        current: this.props.current,
      })
    }
  }

  handleChange = (change) => {
    this.setState({current: change.value})
  }

  render () {
    const { current } = this.state
    const { onSave } = this.props
    const selectValue = {
      value: current,
      label: current,
    }
    return (
      <div className='pt-5 d-flex flex-column align-items-center'>
        <div className="text-center">Edit tonality: </div>
        <div className="edit-key-signature p-2 m-3">
          <Staff>
            <Clef type="treble" />
            <KeySignature name={current} />
          </Staff>
        </div>
        <div className="p-3 mt-4" style={{width: "300px"}}>
          <Select
            value={selectValue}
            onChange={this.handleChange}
            options={ Object.keys(keyInformation).map((tonality) => {
              return  {value: tonality, label: tonality}
            })}
          />
        </div>
        <Button type='dark' onClick={() => {onSave(current)}}>Update!</Button>
      </div>
    );
  }
}

EditKeySignature.propTypes = {

};

export default EditKeySignature
