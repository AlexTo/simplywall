package st.simplywall.mappers;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.springframework.data.domain.Page;
import st.simplywall.models.CompanyPriceClose;
import st.simplywall.models.CompanyPriceClosePage;

import java.util.stream.Collectors;

@Mapper(componentModel = "spring",
        injectionStrategy = InjectionStrategy.CONSTRUCTOR,
        uses = {CompanyMapper.class})
public interface CompanyPriceCloseMapper {
    default CompanyPriceClosePage toModels(Page<st.simplywall.entities.CompanyPriceClose> entities) {
        var companyPriceClosePage = new CompanyPriceClosePage();
        companyPriceClosePage.setCompanyPriceCloses(entities.get().map(this::toModel).collect(Collectors.toList()));
        companyPriceClosePage.setTotalElements(entities.getTotalElements());
        companyPriceClosePage.setTotalPages(entities.getTotalPages());
        companyPriceClosePage.setHasNext(entities.hasNext());
        companyPriceClosePage.setHasPrevious(entities.hasPrevious());
        companyPriceClosePage.setIsEmpty(entities.isEmpty());
        return companyPriceClosePage;
    }

    CompanyPriceClose toModel(st.simplywall.entities.CompanyPriceClose entity);
}
