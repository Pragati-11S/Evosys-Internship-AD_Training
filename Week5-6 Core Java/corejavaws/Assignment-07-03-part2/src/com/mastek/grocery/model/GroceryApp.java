package com.mastek.grocery.model;
public class GroceryApp {
	private int[] quantity = {10,10,10,10};
	private String[] items= {"Chocolate Syrup","Cooking oil","Sugar","Soya Chunks"};
	private double[] price= {380,220,50,70};
	private int[] purchasedItem=new int[100];
	private int[] quantitypurchaseItem=new int[100];
	private int counter;
	private double total;

	public void displayPurchasedItem() {
		System.out.println("Bill");
		for (int i=0;i<counter;i++) {
			System.out.println(this.items[this.purchasedItem[i]]+" [Quantity Purchased: "+quantitypurchaseItem[i]+",  Price per unit: "+this.price[this.purchasedItem[i]]+" ]");
		}
	}
	public double getPayableTotal() {
		return this.total;
	}

	public void generateBill(int i,int qty) {
		i-=1;
		if(this.quantity[i]>=qty) {	
			this.total+=price[i]*qty;
			this.quantity[i]-=qty;
			this.purchasedItem[counter]=i;
			this.quantitypurchaseItem[counter++]=qty;
		}
		else {
			System.out.println("\""+this.items[i]+"\" is currently out of stock!!");
		}
	}
}