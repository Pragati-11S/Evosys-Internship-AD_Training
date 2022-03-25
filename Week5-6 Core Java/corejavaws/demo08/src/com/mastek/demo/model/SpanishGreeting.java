package com.mastek.demo.model;

public class SpanishGreeting extends Greeting {

	
	public SpanishGreeting() {
		super();	
	}

	public SpanishGreeting(String message) {
		super(message);
	}

	@Override
	public String greet(String message) {
		
		return message;
	}

}
