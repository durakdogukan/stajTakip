package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.User;

public interface UserService {

    public List<User> getAllUsers();

    public User getUserById(int id);

    public void addUser(User user);

    public void deleteUser(int id);
}
