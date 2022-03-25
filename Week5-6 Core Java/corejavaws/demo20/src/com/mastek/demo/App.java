package com.mastek.demo;

public class App {
	public static void main(String[] args) {
		int [] numbers=new int [5];
		for(int i=0; i<numbers.length;i++) {
			numbers[i]=i*i;
		}
		System.out.println(numbers[5]);
	}
}
