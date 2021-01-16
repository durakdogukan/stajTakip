package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Danisman;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stajTakip.model.Stajbilgisi;
import com.stajTakip.repository.StajbilgisiRepository;

public interface StajbilgisiService {

    public List<Stajbilgisi> getAllStajbilgisi();

    public Stajbilgisi getStajbilgisiId(int id);

    public void addStajbilgisi(Stajbilgisi stajbilgisi);

    public void deleteStajbilgisi(int id);
}
