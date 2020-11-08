package st.simplywall.mappers;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import st.simplywall.models.Company;
import st.simplywall.models.CompanyPage;
import st.simplywall.models.CompanyScore;

import java.util.stream.Collectors;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        uses = {CompanyScore.class})
public interface CompanyMapper {
    default CompanyPage toModels(Page<st.simplywall.entities.Company> entities) {
        var companyPage = new CompanyPage();
        companyPage.setCompanies(entities.get().map(this::toModel).collect(Collectors.toList()));
        companyPage.setTotalElements(entities.getTotalElements());
        companyPage.setTotalPages(entities.getTotalPages());
        companyPage.setHasNext(entities.hasNext());
        companyPage.setHasPrevious(entities.hasPrevious());
        companyPage.setIsEmpty(entities.isEmpty());
        return companyPage;
    }

    Company toModel(st.simplywall.entities.Company entity);
}
