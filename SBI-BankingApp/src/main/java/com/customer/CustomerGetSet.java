package com.customer;

import java.io.File;
import java.sql.Blob;

public class CustomerGetSet {

	private  long acc_no;
	private  String confirmacc_no;
	private  String fname;
	private  String lname;
	private  String email;
	private  String dob;
	private  String number;
	private  String address;
	private  String city;
	private  String state;
	private  String zipcode;
	private  String username;
	private  String password;
	private  String conpassword;
	private  String otp;
	private  String conotp;
	private  double amount;
	private  int pin;
	private  int cpin;
	private  String profilephoto;
	private  String reacc_no;
	private  long sender_acc_no;
	private  long receiver_acc_no;
	private  String sender_username;
	private  String receiver_username;
	private  String date_time;
	private  String transaction;
	private  int sr_no;
	
	


	public int getSr_no() {
		return sr_no;
	}

	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
	}

	public long getSender_acc_no() {
		return sender_acc_no;
	}

	public void setSender_acc_no(long sender_acc_no) {
		this.sender_acc_no = sender_acc_no;
	}

	public long getReceiver_acc_no() {
		return receiver_acc_no;
	}

	public void setReceiver_acc_no(long receiver_acc_no) {
		this.receiver_acc_no = receiver_acc_no;
	}

	public String getSender_username() {
		return sender_username;
	}

	public void setSender_username(String sender_username) {
		this.sender_username = sender_username;
	}

	public String getReceiver_username() {
		return receiver_username;
	}

	public void setReceiver_username(String receiver_username) {
		this.receiver_username = receiver_username;
	}

	public String getDate_time() {
		return date_time;
	}

	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}

	public String getTransaction() {
		return transaction;
	}

	public void setTransaction(String transaction) {
		this.transaction = transaction;
	}

	public String getReacc_no() {
		return reacc_no;
	}

	public void setReacc_no(String reacc_no) {
		this.reacc_no = reacc_no;
	}

	public String getProfilephoto() {
		return profilephoto;
	}

	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	public int getCpin() {
		return cpin;
	}

	public void setCpin(int cpin) {
		this.cpin = cpin;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public String getConotp() {
		return conotp;
	}

	public void setConotp(String conotp) {
		this.conotp = conotp;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getConpassword() {
		return conpassword;
	}
	
	public void setConpassword(String conpassword) {
		this.conpassword = conpassword;
	}
	
	
	public long getAcc_no() {
		return acc_no;
	}
	
	public void setAcc_no(long acc_no) {
		this.acc_no = acc_no;
	}
	
	public String getConfirmacc_no() {
		return confirmacc_no;
	}
	
	public void setConfirmacc_no(String confirmacc_no) {
		this.confirmacc_no = confirmacc_no;
	}
	
	
	public String getFname() {
		return fname;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
	public String getLname() {
		return lname;
	}
	
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getDob() {
		return dob;
	}
	
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	
	public String getNumber() {
		return number;
	}
	
	public void setNumber(String number) {
		this.number = number;
	}
	
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
}
