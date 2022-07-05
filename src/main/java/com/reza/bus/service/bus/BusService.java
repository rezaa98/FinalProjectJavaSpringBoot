package com.reza.bus.service.bus;

import com.reza.bus.model.bus.Bus;
import com.reza.bus.payload.request.BusRequest;

public interface BusService {

	Bus addNewBus(BusRequest busRequest);

	Bus updatingBus(Long id, BusRequest busRequest);
}
