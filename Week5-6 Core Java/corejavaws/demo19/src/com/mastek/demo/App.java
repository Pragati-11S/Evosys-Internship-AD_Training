package com.mastek.demo;

import com.mastek.demo.english.model.EnglishGreeting;
import com.mastek.demo.model.GreekGreeting;
import com.mastek.demo.model.Greeting;
import com.mastek.demo.model.SpanishGreeting;

public class App {

	public static void main(String[] args) {
		Greeting greeting=new Greeting("Happy Holi");
//		System.out.println(greeting.message);//not visible
		System.out.println(greeting.getMessage());
		
		greeting=new SpanishGreeting("Happy Holi 2022");
//		System.out.println(greeting.message);//not visible
		System.out.println(greeting.getMessage());
		
		greeting=new EnglishGreeting("Happy Holi 2022");
//		System.out.println(greeting.message);//not visible
		System.out.println(greeting.getMessage());
		
		GreekGreeting gg=new GreekGreeting();
		gg.greekGreeting();
	}

}
