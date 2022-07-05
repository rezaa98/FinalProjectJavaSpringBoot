package com.reza.bus;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.reza.bus.model.bus.Agency;
import com.reza.bus.model.bus.Bus;
import com.reza.bus.model.bus.Stop;
import com.reza.bus.model.bus.Trip;
import com.reza.bus.model.user.User;
import com.reza.bus.payload.request.TripRequest;

@SpringBootTest
public class TestObjectFactory {

	public static User createUser() {
		final User user = new User();
		user.setUsername("1-8");
		user.setEmail("reza.maulana@bfi.co.id");
		user.setPassword("123456");
		user.setFirstName("Reza");
		user.setLastName("Yusuf Maulana");
		user.setMobileNumber("081122334455");
		return user;
	}

	public static Stop createSourceStop() {
		final Stop stop = new Stop();
		stop.setCode("1-7");
		stop.setName("MLG");
		stop.setDetail("Malang");
		return stop;
	}

	public static Stop createDestStop() {
		final Stop stop = new Stop();
		stop.setCode("1-8");
		stop.setName("SBY");
		stop.setDetail("Surabaya");
		return stop;
	}

	public static Agency createAgency() {
		final Agency agency = new Agency();
		agency.setCode("MRC99");
		agency.setName("Bis Mercy");
		agency.setDetails("PT.Juragan99");
		return agency;
	}

	public static Bus createBus() {
		final Bus bus = new Bus();
		bus.setCode("BMW99");
		bus.setAgency(createAgency());
		bus.setCapacity(40);
		bus.setMake("200");
		return bus;
	}

	public static TripRequest createTripRequest() {
		final TripRequest trip = new TripRequest();
		trip.setId(new Random().nextLong());
		trip.setAgencyId(1L);
		trip.setBusId(2L);
		trip.setFare(20000);
		trip.setDestStopId(2L);
		trip.setJourneyTime(200);
		trip.setSourceStopId(1L);
		return trip;
	}

	public static Trip createTrip() {
		final Trip trip = new Trip();
		trip.setId(new Random().nextLong());
		trip.setAgency(createAgency());
		trip.setBus(createBus());
		trip.setFare(20000);
		trip.setDestStop(createDestStop());
		trip.setJourneyTime(200);
		trip.setSourceStop(createSourceStop());
		return trip;
	}

	public static List<Trip> createTripList(final int size) {
		final List<Trip> result = new ArrayList<>();
		for (int i = 0; i < size; i++) {
			result.add(createTrip());
		}
		return result;
	}

	public static List<User> createUserList(final int size) {
		final List<User> result = new ArrayList<>();
		for (int i = 0; i < size; i++) {
			result.add(createUser());
		}
		return result;
	}

	@Test
	public void testCreateProduct() {
		createTripList(5);
	}
}
