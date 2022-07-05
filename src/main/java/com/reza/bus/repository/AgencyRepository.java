package com.reza.bus.repository;

import java.util.Optional;

import com.reza.bus.model.bus.Agency;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.reza.bus.model.user.User;

@Repository
public interface AgencyRepository extends JpaRepository<Agency, Long> {

	Agency findByOwner(User owner);

	@Query(value = "SELECT DISTINCT * FROM tb_agency WHERE owner_user_id = :owner", nativeQuery = true)
	Agency findByOwnerUser(Long owner);

	Optional<Agency> findById(int agencyId);
}