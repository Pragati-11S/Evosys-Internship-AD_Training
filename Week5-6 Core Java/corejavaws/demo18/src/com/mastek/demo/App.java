package com.mastek.demo;

import com.mastek.demo.model.SpanishGreeting;

public class App {

	public static void main(String[] args) {
		Greeting greeting=new Greeting("Happy Holi");
		System.out.println(greeting.message);

		greeting=new SpanishGreeting("Happy Holi 2022");
		System.out.println(greeting.message);
	}

}
