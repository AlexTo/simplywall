import {COMPANY_DETAILS_DIALOG_CLOSE, COMPANY_DETAILS_DIALOG_OPEN} from "../actions/companyActions";

const initialState = {
  companyDetailsDialogOpen: false,
  company: null
}

export const companyReducer = (state = initialState, action) => {
  switch (action.type) {
    case COMPANY_DETAILS_DIALOG_OPEN:
      return Object.assign({}, state, {
        companyDetailsDialogOpen: true,
        company: action.company
      })
    case COMPANY_DETAILS_DIALOG_CLOSE:
      return Object.assign({}, state, {
        companyDetailsDialogOpen: false,
        company: null
      })
    default:
      return state;
  }
}
