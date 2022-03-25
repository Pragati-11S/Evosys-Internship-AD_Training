package com.mastek.demo;

import com.mastek.demo.model.EnglishGreeting;
import com.mastek.demo.model.Greeting;

public class App {

	public static void main(String[] args) {
		// 1. extend the abstract class
		Greeting greeting = new EnglishGreeting("Welcome ");
		System.out.println(greeting.greet("to Mastek!"));
		// 2. Create anonymous class
		greeting = new EnglishGreeting("Happy New Year") {

			@Override
			public String greet(String message) {

				return this.getMessage() + " " + message + "!!!!!!!!!!!!";
			}
		};
		System.out.println(greeting.greet("2022"));
		//3. Create object of abstract class using anonymous class
		greeting = new Greeting("Happy Holi") {

			@Override
			public String greet(String message) {

				return this.getMessage() + " " + message + ":) ";
			}
		};
		System.out.println(greeting.greet("2022"));
	}

}
