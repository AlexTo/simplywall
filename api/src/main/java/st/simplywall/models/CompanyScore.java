package st.simplywall.models;

import lombok.Data;

import java.time.Instant;

@Data
public class CompanyScore {
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
}
