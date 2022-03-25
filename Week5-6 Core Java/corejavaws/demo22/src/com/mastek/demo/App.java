package com.mastek.demo;

public class App {

	public static void main(String[] args) {
		ListExample example1=new ListExample();
		System.out.println("@@@@@@@@@@@@@@@@@ ArrayList");
		example1.arrayList();
		System.out.println("@@@@@@@@@@@@@@@@@ LinkedList");
		example1.linkedList();
		SetExample example2=new SetExample();
		System.out.println("@@@@@@@@@@@@@@@@@ HashSet");
		example2.hashSet();
		System.out.println("@@@@@@@@@@@@@@@@@ TreeSet");
		example2.treeSet();
	}

}
