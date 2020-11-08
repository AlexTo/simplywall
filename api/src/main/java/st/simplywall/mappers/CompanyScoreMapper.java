package st.simplywall.mappers;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import st.simplywall.models.CompanyScore;
import st.simplywall.models.CompanyScorePage;

import java.util.stream.Collectors;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR)
public interface CompanyScoreMapper {
    default CompanyScorePage toModels(Page<st.simplywall.entities.CompanyScore> entities) {
        var companyScorePage = new CompanyScorePage();
        companyScorePage.setCompanyScores(entities.get().map(this::toModel).collect(Collectors.toList()));
        companyScorePage.setTotalElements(entities.getTotalElements());
        companyScorePage.setTotalPages(entities.getTotalPages());
        companyScorePage.setHasNext(entities.hasNext());
        companyScorePage.setHasPrevious(entities.hasPrevious());
        companyScorePage.setIsEmpty(entities.isEmpty());
        return companyScorePage;
    }

    CompanyScore toModel(st.simplywall.entities.CompanyScore entity);
}
