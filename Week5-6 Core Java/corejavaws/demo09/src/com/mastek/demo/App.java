package com.mastek.demo;

import com.mastek.demo.model.Person;

public class App {

	public static void main(String[] args) {
		
		Person p1=new Person("Ajit","Tripathi");
		System.out.println(p1.getFirstName()+" "+p1.getLastName());

	}

}
