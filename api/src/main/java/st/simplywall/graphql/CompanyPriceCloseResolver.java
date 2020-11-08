package st.simplywall.graphql;

import com.coxautodev.graphql.tools.GraphQLResolver;
import org.springframework.stereotype.Component;
import st.simplywall.models.CompanyPriceClose;

@Component
public class CompanyPriceCloseResolver implements GraphQLResolver<CompanyPriceClose> {

    public Integer dateCreated(CompanyPriceClose companyPriceClose) {
        return Long.valueOf(companyPriceClose.getDateCreated().getEpochSecond()).intValue();
    }

    public Integer date(CompanyPriceClose company) {
        return Long.valueOf(company.getDate().getEpochSecond()).intValue();
    }
}
