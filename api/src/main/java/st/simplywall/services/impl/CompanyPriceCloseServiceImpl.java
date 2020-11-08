package st.simplywall.services.impl;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import st.simplywall.mappers.CompanyPriceCloseMapper;
import st.simplywall.models.CompanyPriceClose;
import st.simplywall.models.CompanyPriceClosePage;
import st.simplywall.repositories.CompanyPriceCloseRepository;
import st.simplywall.services.CompanyPriceCloseService;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
@Transactional
public class CompanyPriceCloseServiceImpl implements CompanyPriceCloseService {

    private final CompanyPriceCloseMapper mapper;
    private final CompanyPriceCloseRepository repo;

    public CompanyPriceCloseServiceImpl(CompanyPriceCloseMapper mapper,
                                        CompanyPriceCloseRepository repo) {
        this.mapper = mapper;
        this.repo = repo;
    }

    @Override
    public CompanyPriceClosePage findAll(Integer page, Integer size, String companyId) {
        var pageable = PageRequest.of(page, size <= 50 ? size : 50);
        var entities = repo.findAllByCompany_IdOrderByDateCreatedDesc(pageable, companyId);
        return mapper.toModels(entities);
    }

    @Override
    public Optional<CompanyPriceClose> lastKnownSharePrice(String companyId) {
        return repo.findTop1ByCompany_IdOrderByDateCreatedDesc(companyId).map(mapper::toModel);
    }
}
