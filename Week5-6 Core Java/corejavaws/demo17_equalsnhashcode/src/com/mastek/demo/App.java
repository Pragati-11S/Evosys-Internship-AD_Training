package com.mastek.demo;

import com.mastek.demo.model.Person;

public class App {

	public static void main(String[] args) {
		Person person1=new Person("Amit","Joshi");
		Person person2=new Person("Amit","Joshi");
		System.out.println("Checking if person1==person2");
		if(person1==person2){
			System.out.println("person1==person2");
		}else{
			System.out.println("person1!=person2");
		}
		System.out.println("Without overriding equals and hashcode method comment equals method to check output");
//		System.out.println("With overriding equals method ");
		System.out.println("checking if person1.equals(person2)");
		if(person1.equals(person2)){
			System.out.println("person1 is equal person2");
		}else{
			System.out.println("person1 is not equal person2");
		}
		
	}

}
