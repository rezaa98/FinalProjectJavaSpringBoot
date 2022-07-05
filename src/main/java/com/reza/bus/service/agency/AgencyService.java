package com.reza.bus.service.agency;

import com.reza.bus.model.bus.Agency;
import com.reza.bus.payload.request.AgencyRequest;

public interface AgencyService {

	Agency updatingAgency(Long id, AgencyRequest agencyDetail);

	Agency addNewAgency(AgencyRequest agencyRequest);

}
