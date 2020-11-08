package st.simplywall.services;

import st.simplywall.models.CompanyPage;

public interface CompanyService {

    CompanyPage findAll(Integer page, Integer size, String orderBy, String order, String searchTerm, Integer minScore, Integer maxScore);
}
