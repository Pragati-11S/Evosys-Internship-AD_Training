package com.mastek.demo;

public class MyThread extends Thread {

	@Override
	public void run() {
		System.out.println("MyThread .run called");
		for(int i=0;i<20;i++){
			System.out.println(i);
		}
	}

	
}
