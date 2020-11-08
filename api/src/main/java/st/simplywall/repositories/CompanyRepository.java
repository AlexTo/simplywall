package st.simplywall.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import st.simplywall.entities.Company;

public interface CompanyRepository extends JpaRepository<Company, String> {
    @Query("select c from Company c " +
            "where (lower(c.name) like %:name% or lower(c.exchangeSymbol) like %:exchangeSymbol%) " +
            "and c.companyScore.total >= :minScore and c.companyScore.total <= :maxScore")
    Page<Company> findCompanies(Pageable pageable,
                                @Param("name") String name,
                                @Param("exchangeSymbol") String exchangeSymbol,
                                @Param("minScore") Integer minScore,
                                @Param("maxScore") Integer maxScore);

    Page<Company> findAllByCompanyScore_TotalGreaterThanEqualAndCompanyScore_TotalLessThanEqual(Pageable pageable, Integer minScore, Integer maxScore);
}
