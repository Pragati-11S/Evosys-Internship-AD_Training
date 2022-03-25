package com.mastek.demo;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class SetExample {

	public void hashSet(){
		Set<String> set=new HashSet<>();
		set.add("Dhanashree");
		set.add("Vanashree");
		set.add("Bhagyashree");
		set.add("Dhanashree");
		set.add("Dhanashree");
		System.out.println("Using iterator ");
		Iterator<String> i=set.iterator();
		while(i.hasNext()){
			System.out.println(i.next());
		}
		System.out.println("Using foreach ");
		for(String name:set){
			System.out.println(name);
		}
		
	}
	public void treeSet(){
		Set<String> set=new TreeSet<>();
		set.add("Dhanashree");
		set.add("Vanashree");
		set.add("Bhagyashree");
		set.add("Dhanashree");
		set.add("Dhanashree");
		System.out.println("Using iterator ");
		Iterator<String> i=set.iterator();
		while(i.hasNext()){
			System.out.println(i.next());
		}
		System.out.println("Using foreach ");
		for(String name:set){
			System.out.println(name);
		}
	}
}
