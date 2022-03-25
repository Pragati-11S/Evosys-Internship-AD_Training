package com.mastek.demo.english.model;

import com.mastek.demo.model.Greeting;

public class EnglishGreeting extends Greeting {

	public EnglishGreeting() {
		super();

	}

	public EnglishGreeting(int id, String message) {
		super(id, message);

	}

	public EnglishGreeting(String message) {
		super(message);

	}

	@Override
	public void greet() {
		System.out.println("English Greeting "+this.message);
	}

	
}
