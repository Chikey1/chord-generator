import React from "react"
import StaffElement from "components/staff/StaffElement"
import Bar from "components/staff/Bar"

function Staff({ children }) {
  return (
    <div className="staff">
      {children}
    </div>
  );
}

export default Staff
