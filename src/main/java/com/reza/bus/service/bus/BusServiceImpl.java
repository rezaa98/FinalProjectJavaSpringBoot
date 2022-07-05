package com.reza.bus.service.bus;

import java.util.Optional;

import com.reza.bus.model.bus.Agency;
import com.reza.bus.model.bus.Bus;
import com.reza.bus.payload.request.BusRequest;
import com.reza.bus.repository.AgencyRepository;
import com.reza.bus.repository.BusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

@Component
public class BusServiceImpl implements BusService {

	@Autowired
	private AgencyRepository agencyRepository;
	
	@Autowired
	private BusRepository busRepository;

	@Override
	public Bus addNewBus(BusRequest busRequest) {

		Optional<Agency> agency = agencyRepository.findById(busRequest.getAgencyId());

		if (!agency.isPresent()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No agency found");
		}

		try {
			Bus bus = new Bus(
					busRequest.getCode(),
					busRequest.getCapacity(),
					busRequest.getMake(), 
					agency.get());

			Bus savedBus = busRepository.save(bus);
			return savedBus;

		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage(), e.getCause());
		}
	}

	@Override
	public Bus updatingBus(Long id, BusRequest busRequest) {

		Optional<Agency> agency = agencyRepository.findById(busRequest.getAgencyId());
		Optional<Bus> bus = busRepository.findById(id);

		if (!agency.isPresent()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No agency found");
		}

		if (!bus.isPresent()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No bus found");
		}

		try {
			bus.get().setCode(busRequest.getCode());
			bus.get().setCapacity(busRequest.getCapacity());
			bus.get().setMake(busRequest.getMake());
			bus.get().setAgency(agency.get());

			Bus savedBus = busRepository.save(bus.get());
			return savedBus;

		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage(), e.getCause());
		}
	}
}
