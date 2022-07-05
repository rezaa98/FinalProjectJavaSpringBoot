package com.reza.bus.service.tripschedule;

import java.text.ParseException;

import com.reza.bus.model.bus.TripSchedule;
import com.reza.bus.payload.request.TripScheduleRequest;

public interface TripScheduleService {
	TripSchedule addNewTrip(TripScheduleRequest tripScheduleRequest) throws ParseException;

	TripSchedule updatingTrip(Long id, TripScheduleRequest tripScheduleRequest) throws ParseException;
}
