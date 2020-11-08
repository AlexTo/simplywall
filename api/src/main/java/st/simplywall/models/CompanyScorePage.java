package st.simplywall.models;

import lombok.Data;

import java.util.List;

@Data
public class CompanyScorePage {
    private List<CompanyScore> companyScores;
    private Long totalElements;
    private Integer totalPages;
    private Boolean hasNext;
    private Boolean hasPrevious;
    private Boolean isEmpty;
}
