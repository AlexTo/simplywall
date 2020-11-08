package st.simplywall.entities;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "sws_company")
public class Company {

    @Id
    private String id;

    private String name;

    private String tickerSymbol;
    private String exchangeSymbol;
    private String uniqueSymbol;
    private Instant dateGenerated;
    private String securityName;
    private String exchangeCountryISO;
    private String listingCurrencyISO;
    private String canonicalURL;
    private String uniqueSymbolSlug;

    @OneToOne
    @JoinColumn(name = "score_id", referencedColumnName = "id")
    private CompanyScore companyScore;

}
