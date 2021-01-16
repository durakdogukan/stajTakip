package com.stajTakip.model;

import org.hibernate.mapping.List;

import javax.persistence.*;
import java.util.ArrayList;
import java.io.Serializable;
import java.util.Set;


@Entity
@Table(name = "sirketbilgisi")

public class Sirketbilgisi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="ad", nullable = false, length = 20)
    private String ad;

    @Column(name="sehir", nullable = false, length = 20)
    private String sehir;

    @Column(name="website", nullable = false, length = 20)
    private String website;

    @Column(name="adres", nullable = false, length = 100)
    private String adres;

//    @OneToOne(mappedBy = "sirketbilgisi", cascade = CascadeType.ALL)
//    @PrimaryKeyJoinColumn
//    private Stajbirim stajbirim;

    @OneToMany(mappedBy="sirketbilgisi")
    private Set<Stajbirim> stajbirim;


    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public Set<Stajbirim> getStajbirim() {
        return stajbirim;
    }

    public void setStajbirim(Set<Stajbirim> stajbirim) {
        this.stajbirim = stajbirim;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSehir() {
        return sehir;
    }

    public void setSehir(String sehir) {
        this.sehir = sehir;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}
