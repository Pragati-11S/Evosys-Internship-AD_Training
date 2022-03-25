package com.mastek.demo.model;

public class EnglishGreeting extends Greeting {

	
	public EnglishGreeting() {
		super();
	
	}

	public EnglishGreeting(String message) {
		super(message);
	
	}

	@Override
	public String greet(String message) {
	
		return this.getMessage()+" "+message;
	}

}
