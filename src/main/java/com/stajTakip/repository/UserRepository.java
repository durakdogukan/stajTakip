package com.stajTakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.stajTakip.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}