package com.mastek.demo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

public class ListExample {
	public void arrayList() {
		ArrayList<String> names=new ArrayList<>();
		System.out.println("Add String data to the ArrayList");
		names.add("Dhanashree");
		names.add("Bhagyashree");
		names.add("Vanashree");
		System.out.println("iterate using iterator");
		Iterator i=names.iterator();
		while(i.hasNext()){
			System.out.println(i.next());
		}
		System.out.println("Using For Each");
		for(String name:names){
			System.out.println(name);
		}
		
		
		
	}
	public void linkedList(){
		LinkedList<String> names=new LinkedList<>();
		System.out.println("Add String data to the LinkedList");
		names.add("Dhanashree");
		names.add("Bhagyashree");
		names.add("Vanashree");
		System.out.println("iterate using iterator");
		Iterator i=names.iterator();
		while(i.hasNext()){
			System.out.println(i.next());
		}
		System.out.println("Using For Each");
		for(String name:names){
			System.out.println(name);
		}
		
	}

}
