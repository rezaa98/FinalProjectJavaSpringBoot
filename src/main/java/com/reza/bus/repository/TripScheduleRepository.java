package com.reza.bus.repository;

import java.util.List;

import com.reza.bus.model.bus.TripSchedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface TripScheduleRepository extends JpaRepository<TripSchedule, Long> {
	List<TripSchedule> findAllByTripDate(String tripDate);

	List<TripSchedule> findByTripDate(String tripDate);

	@Query(value = "SELECT DISTINCT * FROM tb_trip_schedule WHERE trip_date = :tripDate", nativeQuery = true)
	List<TripSchedule> findTripScheduleByDate(String tripDate);
}