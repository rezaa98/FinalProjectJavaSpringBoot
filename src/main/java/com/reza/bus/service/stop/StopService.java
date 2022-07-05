package com.reza.bus.service.stop;

import com.reza.bus.model.bus.Stop;
import com.reza.bus.payload.request.StopRequest;

public interface StopService {

	Stop addNewStop(StopRequest stopReq);

	Stop updatingStop(Long id, StopRequest stopReq);
}
