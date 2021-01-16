package com.stajTakip.services;

import java.util.List;

import com.stajTakip.model.Danisman;

public interface DanismanService  {

    public List<Danisman> getAllDanisman();

    public Danisman getDanismanId(int id);

    public void addDanisman(Danisman danisman);

    public void deleteDanisman(int id);

}
