package st.simplywall.services.impl;

import org.springframework.stereotype.Service;
import st.simplywall.mappers.CompanyScoreMapper;
import st.simplywall.models.CompanyScore;
import st.simplywall.repositories.CompanyScoreRepository;
import st.simplywall.services.CompanyScoreService;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class CompanyScoreServiceImpl implements CompanyScoreService {

    private final CompanyScoreRepository repo;
    private final CompanyScoreMapper mapper;

    public CompanyScoreServiceImpl(CompanyScoreRepository repo, CompanyScoreMapper mapper) {
        this.repo = repo;
        this.mapper = mapper;
    }

    @Override
    public Optional<CompanyScore> findByCompanyId(String companyId) {
        return repo.findByCompanyId(companyId).map(mapper::toModel);
    }
}
