import React from "react"
import PropTypes from "prop-types"

function Button({type, outline, active, disabled, onClick, children}) {
  const buttonClass = "btn-" + (outline ? "outline-" : "") + type
  const activeClass = active ? "active" : ""

  if(disabled) {
    return (
      <button type="button" disabled className={`m-2 btn ${buttonClass} disabled`}>
        {children}
      </button>
    )
  }

  return (
    <button type="button" onClick={onClick} className={`m-2 btn ${buttonClass} ${activeClass}`}>
      {children}
    </button>
  );
}

Button.propTypes = {
  type: PropTypes.oneOf([
    'primary',
    'secondary',
    'success',
    'danger',
    'warning',
    'info',
    'light',
    'dark',
    'link'
  ]).isRequired,
  outline: PropTypes.bool.isRequired,
  active: PropTypes.bool.isRequired,
  disabled: PropTypes.bool.isRequired,
  onClick: PropTypes.func.isRequired,
};

Button.defaultProps = {
  type: 'primary',
  outline: false,
  active: false,
  disabled: false,
  onClick: () => {},
};

export default Button
