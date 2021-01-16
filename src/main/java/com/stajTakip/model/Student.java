package com.stajTakip.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


@Entity
@Table(name = "student")

public class Student {

	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name="id")
	 private int id;

	 @Column(name="firstname", nullable = false, length = 20)
	 private String firstname;

	 @Column(name="lastname", nullable = false, length = 30)
	 private String lastname;

	 @Column(name="number", nullable = false, length = 15)
	 private String number;

	 @Column(name="email", nullable = false, length = 45)
	 private String email;

	 @Column(name="phone", nullable = false, length = 11)
	 private String phone;

	 @Column(name="gender", nullable = false, length = 1)
	 private String gender;

	 /*
	@Column(name="birthday", nullable = false )
	@Temporal(TemporalType.DATE)
	private Date birthday;

	  */

	@Column(name="birthday", nullable = false )
	//@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private java.sql.Date birthday;


	@Column(name="department", nullable = false, length = 45)
	private String department;

	/*
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "danisman_id", referencedColumnName = "id" , nullable = false)
	private Danisman danisman;
	*/

	@ManyToOne
	@JoinColumn(name="danisman_id", nullable=false)
	private Danisman danisman;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy="student")
	private Set<Stajbilgisi> stajbilgisi;


	public Set<Stajbilgisi> getStajbilgisi() {
		return stajbilgisi;
	}

	public void setStajbilgisi(Set<Stajbilgisi> stajbilgisi) {
		this.stajbilgisi = stajbilgisi;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Danisman getDanisman() {
		return danisman;
	}

	public void setDanisman(Danisman danisman) {
		this.danisman = danisman;
	}

	private String fullname;

	public String getFullname() {
		return getFirstname() + " " + getLastname();
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(java.sql.Date  birthday) {
		this.birthday = birthday;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}


}
