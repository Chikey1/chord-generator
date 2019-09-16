import React from "react"
import PropTypes from "prop-types"
import Staff from "components/staff/Staff"
import Note from "components/staff/Note"
import Rest from "components/staff/Rest"
import GhostNotes from "components/staff/GhostNotes"

function EditElement({element, onChange, keySignature}) {
  const handleTypeSelect = (type, length) => {
    if(isSelected(type, length)) {
      return null;
    }

    let newElement = {...element}
    newElement.length = length

    if(type != element.type) {
      newElement.type = type;
      if(type == "note") {
        newElement.value = "c5"
      }
      if(type == "rest") {
        newElement.value = null;
        newElement.accidental = null;
      }
    }
    onChange(newElement)
  }

  const handleValueSelect = (value) => {
    if(element.value != value) {
      let newElement = {...element}
      newElement.value = value
      onChange(newElement)
    }
  }


  const handleAccidentalSelect = (accidental) => {
    let newElement = {...element}
    if(element.accidental != accidental) {
      newElement.accidental = accidental
    } else {
      newElement.accidental = null
    }
    onChange(newElement)
  }

  const isSelected = (type, length) => {
    if (element.type === type && element.length === length) {
      return true
    }
    return false
  }

  const optionClass = (type, length) => {
    if(isSelected(type, length)) {
      return "p-2 border type-option selected"
    }
    return "p-2 border type-option"
  }

  const accidentalOptionClass = (accidental) => {
    if(accidental === element.accidental) {
      return "p-2 border type-option selected"
    }
    return "p-2 border type-option"
  }


  return(
    <div className="edit-element d-flex flex-column align-items-center">
      <div className="d-flex flex-wrap border m-2">
        {["whole", "half", "quarter", "eighth"].map((length) => {
          return(
            <div
              key={length}
              className={optionClass("note", length)}
              onClick={() => {handleTypeSelect("note", length)}}
            >
              <Note length={length} />
            </div>
          )
        })}
        {["whole", "half", "quarter", "eighth"].map((length) => {
          return(
            <div
              key={length}
              className={optionClass("rest", length)}
              onClick={() => {handleTypeSelect("rest", length)}}
            >
              <Rest length={length}/>
            </div>
          )
        })}
      </div>
      {element.type === "note" &&
        <div className="d-flex flex-wrap">
          <div className="value-select m-2" style={{width: "100px"}}>
            <Staff>
              <GhostNotes value={element.value} onClick={handleValueSelect}/>
            </Staff>
          </div>
          <div className="d-flex flex-wrap border m-2">
            {["flat", "sharp", "natural"].map((accidental) => {
              return(
                <div
                  key={accidental}
                  className={accidentalOptionClass(accidental)}
                  onClick={() => {handleAccidentalSelect(accidental)}}
                >
                  <div className={`accidental ${accidental}`}></div>
                </div>
              )
            })}
          </div>
        </div>
      }
    </div>
  )
}

EditElement.propTypes = {
  onChange: PropTypes.func,
  lengthOnChange: PropTypes.func,
  element: PropTypes.shape({
    type: PropTypes.oneOf(['rest', 'note']).isRequired,
    length: PropTypes.oneOf(['whole', 'half', 'quarter', 'eighth', 'sixteenth']).isRequired,
    accidental: PropTypes.oneOf(['natural', 'flat', 'sharp']),
  }).isRequired,
};

export default EditElement
