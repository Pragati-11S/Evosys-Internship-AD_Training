package com.mastek.demo.model;

public class GreekGreeting {

	public void greekGreeting(){
		Greeting greeting=new Greeting("Witin package not child access field");
		System.out.println(greeting.message);
	}
}
