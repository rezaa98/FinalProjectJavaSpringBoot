package com.reza.bus.service.ticket;

import java.text.ParseException;

import com.reza.bus.model.bus.Ticket;
import com.reza.bus.payload.request.TicketRequest;

public interface TicketService {
	Ticket bookingTicket(TicketRequest ticketRequest) throws ParseException;

	Ticket updatingTicket(Long id, TicketRequest ticketRequest) throws ParseException;
}
