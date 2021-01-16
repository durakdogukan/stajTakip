package com.stajTakip.model;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "danisman")

public class Danisman {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name="ad", nullable = false, length = 20)
    private String ad;

    @Column(name="soyad", nullable = false, length = 30)
    private String soyad;

    /*
    @OneToOne(mappedBy = "danisman")
    private Student student;

*/
    @OneToMany(mappedBy="danisman")
    private Set<Student> student;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    private String fullname;

    public String getFullname() {
        return getAd() + " " + getSoyad();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Student> getStudent() {
        return student;
    }

    public void setStudent(Set<Student> student) {
        this.student = student;
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

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }



}