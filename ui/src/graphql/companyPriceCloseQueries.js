import gql from "graphql-tag";

export const companyPriceCloseQueries = {
  companyPriceCloses: gql`
    query companyPriceCloses ($page: Int!, $size: Int!, $companyId: String!) {
      companyPriceCloses (page: $page, size: $size, companyId: $companyId) {
        companyPriceCloses {
          id
          price
          date
          dateCreated
        }
        totalElements
        totalPages
        hasNext
        hasPrevious
        isEmpty
      }
    }
  `
}

