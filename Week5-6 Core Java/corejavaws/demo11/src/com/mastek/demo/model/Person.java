package com.mastek.demo.model;

public class Person {

	private String firstName;
	private String lastName;
	private Contact contact;

	public Person() {
		super();
		this.contact=new Contact();

	}
	
	public Person(String firstName, String lastName) {
		this();
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public Person(String firstName, String lastName, Contact contact) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.contact = contact;
	}

	
	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public Contact getContact() {
		return contact;
	}


	public void setContact(Contact contact) {
		this.contact = contact;
	}




	public class Contact {
		private String phoneNo;
		private String address_line1;
		private String address_line2;
		private String landmark;
		private String city;
		private String state;
		private String country;
		private String pincode;
		public Contact() {
			super();		
		}
		
		public Contact(String phoneNo, String state, String country) {
			super();
			this.phoneNo = phoneNo;
			this.state = state;
			this.country = country;
		}

		public String getPhoneNo() {
			return phoneNo;
		}
		public void setPhoneNo(String phoneNo) {
			this.phoneNo = phoneNo;
		}
		public String getAddress_line1() {
			return address_line1;
		}
		public void setAddress_line1(String address_line1) {
			this.address_line1 = address_line1;
		}
		public String getAddress_line2() {
			return address_line2;
		}
		public void setAddress_line2(String address_line2) {
			this.address_line2 = address_line2;
		}
		public String getLandmark() {
			return landmark;
		}
		public void setLandmark(String landmark) {
			this.landmark = landmark;
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
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public String getPincode() {
			return pincode;
		}
		public void setPincode(String pincode) {
			this.pincode = pincode;
		}
		
		
	}
}
