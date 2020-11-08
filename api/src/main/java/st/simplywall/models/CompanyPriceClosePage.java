package st.simplywall.models;

import lombok.Data;

import java.util.List;

@Data
public class CompanyPriceClosePage {
    private List<CompanyPriceClose> companyPriceCloses;
    private Long totalElements;
    private Integer totalPages;
    private Boolean hasNext;
    private Boolean hasPrevious;
    private Boolean isEmpty;
}
