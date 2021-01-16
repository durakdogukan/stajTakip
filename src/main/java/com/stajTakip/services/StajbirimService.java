package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Stajbirim;

public interface StajbirimService {

    public List<Stajbirim> getAllStajbirim();

    public Stajbirim getStajbirimId(int id);

    public void addStajbirim(Stajbirim stajbirim);

    public void deleteStajbirim(int id);
}
