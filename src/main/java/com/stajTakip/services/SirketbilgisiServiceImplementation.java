package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Danisman;
import com.stajTakip.repository.DanismanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stajTakip.model.Sirketbilgisi;
import com.stajTakip.repository.SirketbilgisiRepository;


@Service
@Transactional
public class SirketbilgisiServiceImplementation implements SirketbilgisiService{

    @Autowired
    SirketbilgisiRepository sirketbilgisiRepository;

    @Override
    public List<Sirketbilgisi> getAllSirketbilgisi() {
        return (List<Sirketbilgisi>) sirketbilgisiRepository.findAll();
    }

    @Override
    public Sirketbilgisi getSirketbilgisiId(int id) {
        return sirketbilgisiRepository.findById(id).get();
    }

    @Override
    public void addSirketbilgisi(Sirketbilgisi sirketbilgisi) {
        sirketbilgisiRepository.save(sirketbilgisi);
    }

    @Override
    public void deleteSirketbilgisi(int id) {
        sirketbilgisiRepository.deleteById(id);
    }
}
