package com.mastek.demo.model;

public class EnglishGreeting extends Greeting {

	@Override
	public String greet(String message) {
		
		return message.toLowerCase();
	}

}
