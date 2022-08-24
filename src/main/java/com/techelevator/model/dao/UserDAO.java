package com.techelevator.model.dao;

import com.techelevator.model.dto.User;

import java.time.LocalDate;
import java.util.List;

public interface UserDAO {

	public void saveUser(String name, String userName, String password, String birthdate, String role,
						boolean activeStatus,  String userEmail);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

	public List<User> getAllBrewers();

}
