package st.simplywall.graphql;

import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import org.springframework.stereotype.Component;
import st.simplywall.models.CompanyPage;
import st.simplywall.models.CompanyPriceClosePage;
import st.simplywall.models.CompanyScore;
import st.simplywall.services.CompanyPriceCloseService;
import st.simplywall.services.CompanyScoreService;
import st.simplywall.services.CompanyService;

import java.util.Optional;

@Component
public class QueryResolver implements GraphQLQueryResolver {
    private final CompanyService companyService;
    private final CompanyPriceCloseService companyPriceCloseService;
    private final CompanyScoreService companyScoreService;

    public QueryResolver(CompanyService companyService,
                         CompanyPriceCloseService companyPriceCloseService,
                         CompanyScoreService companyScoreService) {
        this.companyService = companyService;
        this.companyPriceCloseService = companyPriceCloseService;
        this.companyScoreService = companyScoreService;
    }

    public CompanyPage companies(Integer page, Integer size, String orderBy, String order,
                                 String searchTerm, Integer minScore, Integer maxScore) {
        return companyService.findAll(page, size, orderBy, order, searchTerm, minScore, maxScore);
    }

    public CompanyPriceClosePage companyPriceCloses(Integer page, Integer size, String companyId) {
        return companyPriceCloseService.findAll(page, size, companyId);
    }

    public Optional<CompanyScore> companyScore(String companyId) {
        return companyScoreService.findByCompanyId(companyId);
    }


}
