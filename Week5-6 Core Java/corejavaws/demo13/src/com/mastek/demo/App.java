package com.mastek.demo;

import com.mastek.demo.model.EnglishGreeting;
import com.mastek.demo.model.IGreet;

public class App {

	public static void main(String[] args) {
//		class implementing interface 
		IGreet greeting=new EnglishGreeting();
		System.out.println(greeting.greet("Gutan Morgan"));

		//		without implmenting interface 
		greeting=new IGreet(){
			@Override
			public String greet(String message) {
			
				return message.toUpperCase();
			}
		};
		System.out.println(greeting.greet("Gutan Morgan"));
		
	}

}
