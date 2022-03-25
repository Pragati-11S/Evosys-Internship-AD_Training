package com.mastek.demo;

public class App {
	public static void main(String[] args) {
		System.out.println("Main Thread first line");
		System.out.println("Current Thread :");
		System.out.println(Thread.currentThread().getId());
		System.out.println(Thread.currentThread().getName());
		System.out.println(Thread.currentThread().getPriority());
		System.out.println(Thread.currentThread().getThreadGroup());
		System.out.println(Thread.currentThread().isAlive());
		System.out.println(Thread.currentThread().isDaemon());
		Thread thread=new Thread(){
			@Override
			public void run() {
				System.out.println("Custom anonymous Thread");
			}
		};
//		thread.run();
		thread.start();
		Runnable runnable=new Runnable(){
			@Override
			public void run() {
			System.out.println("Runnable Anonymous demo");
				
			}
		};
//		runnable.run();
		thread=new Thread(runnable);
		thread.start();
		
		thread=new MyThread();
		thread.start();
		
		runnable=new MyRunnable();
		thread=new Thread(runnable);
		thread.start();
		
		System.out.println("Main Thread last line");
		
	}
}
