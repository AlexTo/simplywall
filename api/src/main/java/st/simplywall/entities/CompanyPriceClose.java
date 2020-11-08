package st.simplywall.entities;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "sws_sompany_price_close")
public class CompanyPriceClose {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private Instant date;

    @ManyToOne
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    private Company company;

    private Double price;
    private Instant dateCreated;

}
