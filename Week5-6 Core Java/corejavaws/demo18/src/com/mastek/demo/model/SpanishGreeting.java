package com.mastek.demo.model;

import com.mastek.demo.Greeting;

public class SpanishGreeting extends Greeting {

	public SpanishGreeting() {
		super();

	}

	public SpanishGreeting(int id, String message) {
		super(id, message);

	}

	public SpanishGreeting(String message) {
		super(message);

	}

	public void greet(){
//		System.out.println("Greetings for "+this.message);//not visible
		System.out.println("Greetings for "+this.getMessage());
	}
}
