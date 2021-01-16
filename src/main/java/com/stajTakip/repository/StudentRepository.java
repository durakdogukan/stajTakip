package com.stajTakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.stajTakip.model.Student;

public interface StudentRepository extends CrudRepository<Student, Integer> {

}