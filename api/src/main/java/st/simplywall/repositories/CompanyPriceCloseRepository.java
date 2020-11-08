package st.simplywall.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import st.simplywall.entities.CompanyPriceClose;

import java.util.Optional;

public interface CompanyPriceCloseRepository extends JpaRepository<CompanyPriceClose, Integer> {
    Page<CompanyPriceClose> findAllByCompany_IdOrderByDateCreatedDesc(Pageable pageable, String companyId);

    Optional<CompanyPriceClose> findTop1ByCompany_IdOrderByDateCreatedDesc(String companyId);
}
