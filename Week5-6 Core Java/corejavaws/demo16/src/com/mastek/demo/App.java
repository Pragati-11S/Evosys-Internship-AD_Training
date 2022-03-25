package com.mastek.demo;

public class App {

	public static void main(String[] args) {
		String name1="Dhanashree";
		String name2="Dhanashree";
		System.out.println("name1.hashCode()=>"+name1.hashCode());
		System.out.println("name2.hashCode()=>"+name2.hashCode());
		System.out.println("name1 and name2 have 'Dhanashree' ");
		if(name1==name2){
			System.out.println("name1==name2");
		}else{
			System.out.println("name1!=name2");
		}
		
		name1=new String("Dhanashree");
		System.out.println("name1 has new String('Dhanashree' and name2= 'Dhanashree' ");
		if(name1==name2){
			System.out.println("name1==name2");
		}else{
			System.out.println("name1!=name2");
		}
		
		System.out.println("name1.equals(name2)");
		
		if(name1.equals(name2)){
			System.out.println("name1 is equals to name2");
		}else{
			System.out.println("name1 is not equals to name2");
		}
			
		
		
	}

}
