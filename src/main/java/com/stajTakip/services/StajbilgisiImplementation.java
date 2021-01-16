package com.stajTakip.services;
import java.util.List;

import com.stajTakip.model.Danisman;
import com.stajTakip.repository.DanismanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stajTakip.model.Stajbilgisi;
import com.stajTakip.repository.StajbilgisiRepository;


@Service
@Transactional
public class StajbilgisiImplementation implements StajbilgisiService{

    @Autowired
    StajbilgisiRepository stajbilgisiRepository;

    @Override
    public List<Stajbilgisi> getAllStajbilgisi() {
        return (List<Stajbilgisi>) stajbilgisiRepository.findAll();
    }

    @Override
    public Stajbilgisi getStajbilgisiId(int id) {
        return stajbilgisiRepository.findById(id).get();
    }

    @Override
    public void addStajbilgisi(Stajbilgisi stajbilgisi) {
        stajbilgisiRepository.save(stajbilgisi);
    }

    @Override
    public void deleteStajbilgisi(int id) {
        stajbilgisiRepository.deleteById(id);
    }

}
