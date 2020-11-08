package st.simplywall.services;

import org.springframework.data.domain.Pageable;
import st.simplywall.models.CompanyPriceClose;
import st.simplywall.models.CompanyPriceClosePage;

import java.util.Optional;

public interface CompanyPriceCloseService {
    CompanyPriceClosePage findAll(Integer page, Integer size, String companyId);

    Optional<CompanyPriceClose> lastKnownSharePrice(String companyId);
}
