package com.stajTakip.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stajTakip.model.Danisman;
import com.stajTakip.repository.DanismanRepository;


@Service
@Transactional

public class DanismanServiceImplementation implements DanismanService {

    @Autowired
    DanismanRepository danismanRepository;


    @Override
    public List<Danisman> getAllDanisman() {
        return (List<Danisman>) danismanRepository.findAll();
    }

    @Override
    public Danisman getDanismanId(int id) {
        return danismanRepository.findById(id).get();
    }

    @Override
    public void addDanisman(Danisman danisman) {
        danismanRepository.save(danisman);
    }

    @Override
    public void deleteDanisman(int id) {
        danismanRepository.deleteById(id);
    }
}