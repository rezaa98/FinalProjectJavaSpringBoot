package com.reza.bus.service.user;

import com.reza.bus.model.user.User;
import com.reza.bus.payload.request.SignupRequest;
import com.reza.bus.payload.request.UserRequest;

public interface UserService {

	User registerNewUser(SignupRequest SignupRequest);

	User updatingUser(UserRequest userRequest);
}
