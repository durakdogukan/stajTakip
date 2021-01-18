package com.stajTakip.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "stajbilgisi")

public class Stajbilgisi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="baslamatarihi", nullable = false)
    private java.sql.Date baslamatarihi;

    @Column(name="bitistraihi", nullable = true)
    private java.sql.Date bitistraihi;

    @Column(name="stajpuani", nullable = true)
    private float stajpuani;

    @Column(name="yorum", nullable = true, length = 500)
    private String yorum;

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;

    @ManyToOne
    @JoinColumn(name="stajbirim_id")
    private Stajbirim stajbirim;



    public float getStajpuani() {
        return stajpuani;
    }

    public void setStajpuani(float stajpuani) {
        this.stajpuani = stajpuani;
    }

    public String getYorum() {
        return yorum;
    }

    public void setYorum(String yorum) {
        this.yorum = yorum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getBaslamatarihi() {
        return baslamatarihi;
    }

    public void setBaslamatarihi(Date baslamatarihi) {
        this.baslamatarihi = baslamatarihi;
    }

    public Date getBitistraihi() {
        return bitistraihi;
    }

    public void setBitistraihi(Date bitistraihi) {
        this.bitistraihi = bitistraihi;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Stajbirim getStajbirim() {
        return stajbirim;
    }

    public void setStajbirim(Stajbirim stajbirim) {
        this.stajbirim = stajbirim;
    }
}
