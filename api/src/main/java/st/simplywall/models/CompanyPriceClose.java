package st.simplywall.models;

import lombok.Data;

import java.time.Instant;


@Data
public class CompanyPriceClose {
    private Long id;
    private Instant date;
    private Company company;
    private Double price;
    private Instant dateCreated;
}
