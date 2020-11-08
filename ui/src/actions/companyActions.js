export const COMPANY_DETAILS_DIALOG_OPEN = "COMPANY_DETAILS_DIALOG/OPEN";
export const COMPANY_DETAILS_DIALOG_CLOSE = "COMPANY_DETAILS_DIALOG/CLOSE";

export const companyActions = {
  openCompanyDetailsDialog,
  closeCompanyDetailsDialog
}

function openCompanyDetailsDialog(company) {
  return dispatch => dispatch({
    type: COMPANY_DETAILS_DIALOG_OPEN,
    company
  })
}

function closeCompanyDetailsDialog() {
  return dispatch => dispatch({
    type: COMPANY_DETAILS_DIALOG_CLOSE
  })
}
