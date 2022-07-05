package com.reza.bus.service.trip;

import com.reza.bus.model.bus.Trip;
import com.reza.bus.payload.request.TripRequest;
import org.springframework.stereotype.Component;

@Component
public interface TripService {

	Trip addNewTrip(TripRequest tripRequest);
}
