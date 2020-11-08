import gql from "graphql-tag";

export const companyScoreQueries = {
  companyScore: gql`
    query companyScore ($companyId: String!){
      companyScore (companyId: $companyId) {
        id
        sentence
        dividend
        future
        past
        health
        management
        misc
        value
      }
    }
  `
}
