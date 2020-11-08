package st.simplywall.entities;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "sws_company_score")
public class CompanyScore {
    @Id
    private Integer Id;
    private Instant dateGenerated;
    private Integer dividend;
    private Integer future;
    private Integer health;
    private Integer management;
    private Integer past;
    private Integer value;
    private Integer misc;
    private Integer total;
    private String sentence;
    private String companyId;
}
