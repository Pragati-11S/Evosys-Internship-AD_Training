package com.mastek.demo;

public class MyRunnable implements Runnable {

	@Override
	public void run() {
		System.out.println("MyRunnable .run called");
		for(int i=0;i<20;i++){
			System.out.println(i);
		}


	}

}
