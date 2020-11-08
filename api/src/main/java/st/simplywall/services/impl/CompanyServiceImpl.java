package st.simplywall.services.impl;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import st.simplywall.mappers.CompanyMapper;
import st.simplywall.models.CompanyPage;
import st.simplywall.repositories.CompanyRepository;
import st.simplywall.services.CompanyService;

import javax.transaction.Transactional;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {

    private final CompanyRepository repo;
    private final CompanyMapper mapper;

    public CompanyServiceImpl(CompanyRepository repo,
                              CompanyMapper mapper) {
        this.repo = repo;
        this.mapper = mapper;
    }

    @Override
    public CompanyPage findAll(Integer page, Integer size, String orderBy, String order, String searchTerm, Integer minScore, Integer maxScore) {

        var pageable = PageRequest.of(page, size <= 50 ? size : 50,
                "desc".equals(order) ? Sort.by(orderBy).descending() : Sort.by(orderBy).ascending());
        if (minScore == null || minScore < 0) {
            minScore = 0;
        }

        if (maxScore == null || maxScore > 20) {
            maxScore = 20;
        }

        var entities = (searchTerm == null || searchTerm.trim().length() < 3)
                ? repo.findAllByCompanyScore_TotalGreaterThanEqualAndCompanyScore_TotalLessThanEqual(pageable, minScore, maxScore)
                : repo.findCompanies(pageable, searchTerm.toLowerCase(), searchTerm.toLowerCase(), minScore, maxScore);
        return mapper.toModels(entities);
    }
}
