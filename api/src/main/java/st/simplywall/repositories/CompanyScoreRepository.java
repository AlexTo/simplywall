package st.simplywall.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import st.simplywall.entities.CompanyScore;

import java.util.Optional;

public interface CompanyScoreRepository extends JpaRepository<CompanyScore, Integer> {
    Optional<CompanyScore> findByCompanyId(String companyId);
}
