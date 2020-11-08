package st.simplywall.models;

import lombok.Data;

import java.time.Instant;

@Data
public class Company {
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
    private CompanyScore companyScore;
}
