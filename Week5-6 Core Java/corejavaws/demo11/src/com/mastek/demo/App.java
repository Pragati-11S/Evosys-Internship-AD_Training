package com.mastek.demo;

import com.mastek.demo.model.Person;
import com.mastek.demo.model.Person.Contact;

public class App {

	public static void main(String[] args) {
//		Created inner class object in default constructor
		Person p1=new Person("Amit", "Jha");		
		Contact contact=p1.getContact();
		contact.setLandmark("Times SQuare");
		contact.setCity("mumbai");
		contact.setCountry("India");
		System.out.println(p1.getContact().getCity());
		System.out.println(p1.getContact().getCountry());
		System.out.println(p1.getContact().getLandmark());
//		Create the inner class object using outer class object
		p1=new Person("Amit", "Joshi");
		Person.Contact c1=p1.new Contact("9876543210","Maharashtra","India");
		p1.setContact(c1);
		System.out.println(p1.getContact().getPhoneNo());
		System.out.println(p1.getContact().getState());
		System.out.println(p1.getContact().getCountry());
	}

}
