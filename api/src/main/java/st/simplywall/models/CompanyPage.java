package st.simplywall.models;

import lombok.Data;

import java.util.List;

@Data
public class CompanyPage {
    private List<Company> companies;
    private Long totalElements;
    private Integer totalPages;
    private Boolean hasNext;
    private Boolean hasPrevious;
    private Boolean isEmpty;
}
