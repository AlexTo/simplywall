import gql from "graphql-tag";

export const companyQueries = {
  companies: gql`
    query companies ($page: Int!, $size: Int!, $orderBy: String!, $order: String!, $searchTerm: String, $minScore: Int, $maxScore: Int){
      companies (page: $page, size: $size, orderBy: $orderBy, order: $order, searchTerm: $searchTerm, minScore: $minScore, maxScore: $maxScore) {
        companies {
          id
          name
          uniqueSymbol
          exchangeSymbol
          dateGenerated
          companyScore {
            total
          }
          lastKnownSharePrice {
            date
            price
            dateCreated
          }
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
