package st.simplywall.services;

import st.simplywall.models.CompanyScore;

import java.util.Optional;

public interface CompanyScoreService {
    Optional<CompanyScore> findByCompanyId(String companyId);
}
