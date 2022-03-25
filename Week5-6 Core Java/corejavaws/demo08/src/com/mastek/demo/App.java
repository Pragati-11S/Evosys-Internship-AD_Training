package com.mastek.demo;

import com.mastek.demo.model.EnglishGreeting;
import com.mastek.demo.model.Greeting;
import com.mastek.demo.model.SpanishGreeting;

public class App {

	public static void main(String[] args) {

		Greeting greeting=new EnglishGreeting();
		System.out.println(greeting.greet("Have A great Day"));
		
		greeting=new SpanishGreeting();
		System.out.println(greeting.greet("Que tengas un gran día"));
	}

}
