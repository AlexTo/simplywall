package st.simplywall.graphql;

import com.coxautodev.graphql.tools.GraphQLResolver;
import org.springframework.stereotype.Component;
import st.simplywall.models.CompanyScore;

@Component
public class CompanyScoreResolver implements GraphQLResolver<CompanyScore> {
    public Integer dateGenerated(CompanyScore companyScore) {
        return Long.valueOf(companyScore.getDateGenerated().getEpochSecond()).intValue();
    }
}
