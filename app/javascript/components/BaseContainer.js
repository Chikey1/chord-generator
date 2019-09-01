import React from "react"
import PropTypes from "prop-types"
class BaseContainer extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

BaseContainer.propTypes = {
  greeting: PropTypes.string
};
export default BaseContainer
