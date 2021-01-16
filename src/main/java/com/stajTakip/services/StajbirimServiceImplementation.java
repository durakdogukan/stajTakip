package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Danisman;
import com.stajTakip.repository.DanismanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stajTakip.model.Stajbirim;
import com.stajTakip.repository.StajbirimRepository;


@Service
@Transactional

public class StajbirimServiceImplementation implements StajbirimService {

    @Autowired
    StajbirimRepository stajbirimRepository;

    @Override
    public List<Stajbirim> getAllStajbirim() {
        return (List<Stajbirim>) stajbirimRepository.findAll();
    }

    @Override
    public Stajbirim getStajbirimId(int id) {
        return stajbirimRepository.findById(id).get();
    }

    @Override
    public void addStajbirim(Stajbirim stajbirim) {
        stajbirimRepository.save(stajbirim);
    }

    @Override
    public void deleteStajbirim(int id) {
        stajbirimRepository.deleteById(id);
    }

}
