package st.simplywall.graphql;

import com.coxautodev.graphql.tools.SchemaParser;
import graphql.schema.GraphQLSchema;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class GraphQLProvider {
    private final QueryResolver queryResolver;
    private final CompanyResolver companyResolver;
    private final CompanyScoreResolver companyScoreResolver;
    private final CompanyPriceCloseResolver companyPriceCloseResolver;

    public GraphQLProvider(QueryResolver queryResolver,
                           CompanyResolver companyResolver,
                           CompanyScoreResolver companyScoreResolver,
                           CompanyPriceCloseResolver companyPriceCloseResolver) {
        this.queryResolver = queryResolver;
        this.companyResolver = companyResolver;
        this.companyScoreResolver = companyScoreResolver;
        this.companyPriceCloseResolver = companyPriceCloseResolver;
    }

    @Bean
    public GraphQLSchema graphQLSchema() {
        return SchemaParser.newParser()
                .file("graphql/schema.graphqls")
                .resolvers(queryResolver, companyResolver, companyScoreResolver, companyPriceCloseResolver)
                .build()
                .makeExecutableSchema();
    }
}
