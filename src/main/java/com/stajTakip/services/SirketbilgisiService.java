package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Sirketbilgisi;

public interface SirketbilgisiService {

    public List<Sirketbilgisi> getAllSirketbilgisi();

    public Sirketbilgisi getSirketbilgisiId(int id);

    public void addSirketbilgisi(Sirketbilgisi sirketbilgisi);

    public void deleteSirketbilgisi(int id);
}
