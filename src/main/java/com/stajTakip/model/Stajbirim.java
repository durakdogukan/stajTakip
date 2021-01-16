package com.stajTakip.model;

import org.hibernate.mapping.List;
import javax.persistence.*;
import java.util.ArrayList;
import java.io.Serializable;
import java.util.Set;


@Entity
@Table(name = "stajbirim")

public class Stajbirim {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="ad", nullable = false, length = 45)
    private String ad;

    @Column(name="kontaktad", nullable = false, length = 15)
    private String kontaktad;

    @Column(name="kontaktsoyad", nullable = false, length = 20)
    private String kontaktsoyad;

    @Column(name="kontaktunvan", nullable = false, length = 25)
    private String kontaktunvan;

    @Column(name="kontakttel", nullable = false, length = 11)
    private String kontakttel;

    @Column(name="kontaktemail", nullable = false, length = 45)
    private String kontaktemail;

    @ManyToOne
    @JoinColumn(name="sirketbilgisi_id")
    private Sirketbilgisi sirketbilgisi;

    @OneToMany(mappedBy="stajbirim")
    private Set<Stajbilgisi> stajbilgisi;




//    @OneToOne(mappedBy = "stajbirim", cascade = CascadeType.ALL)
//    @PrimaryKeyJoinColumn
//    private Stajbilgisi stajbilgisi;


    public Set<Stajbilgisi> getStajbilgisi() {
        return stajbilgisi;
    }

    public void setStajbilgisi(Set<Stajbilgisi> stajbilgisi) {
        this.stajbilgisi = stajbilgisi;
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

    public String getKontaktad() {
        return kontaktad;
    }

    public void setKontaktad(String kontaktad) {
        this.kontaktad = kontaktad;
    }

    public String getKontaktsoyad() {
        return kontaktsoyad;
    }

    public void setKontaktsoyad(String kontaktsoyad) {
        this.kontaktsoyad = kontaktsoyad;
    }

    public String getKontaktunvan() {
        return kontaktunvan;
    }

    public void setKontaktunvan(String kontaktunvan) {
        this.kontaktunvan = kontaktunvan;
    }

    public String getKontakttel() {
        return kontakttel;
    }

    public void setKontakttel(String kontakttel) {
        this.kontakttel = kontakttel;
    }

    public String getKontaktemail() {
        return kontaktemail;
    }

    public void setKontaktemail(String kontaktemail) {
        this.kontaktemail = kontaktemail;
    }

    public Sirketbilgisi getSirketbilgisi() {
        return sirketbilgisi;
    }

    public void setSirketbilgisi(Sirketbilgisi sirketbilgisi) {
        this.sirketbilgisi = sirketbilgisi;
    }
}
