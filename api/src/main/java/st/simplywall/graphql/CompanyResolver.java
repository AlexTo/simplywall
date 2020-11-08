package st.simplywall.graphql;

import com.coxautodev.graphql.tools.GraphQLResolver;
import org.springframework.stereotype.Component;
import st.simplywall.models.Company;
import st.simplywall.models.CompanyPriceClose;
import st.simplywall.services.CompanyPriceCloseService;

import java.util.Optional;

@Component
public class CompanyResolver implements GraphQLResolver<Company> {

    private final CompanyPriceCloseService companyPriceCloseService;

    public CompanyResolver(CompanyPriceCloseService companyPriceCloseService) {
        this.companyPriceCloseService = companyPriceCloseService;
    }

    public Optional<CompanyPriceClose> lastKnownSharePrice(Company company) {
        return companyPriceCloseService.lastKnownSharePrice(company.getId());
    }

    public Integer dateGenerated(Company company) {
        return Long.valueOf(company.getDateGenerated().getEpochSecond()).intValue();
    }


}
