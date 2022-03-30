package com.mastek.grocery;
import java.util.Scanner;
import com.mastek.grocery.model.*;
import java.lang.Integer;

public class GroceryApplication {
	
	public static void itemsList() {
		System.out.println("1. Chocolate Syrup 380 gm  Rs.380");
		System.out.println("2. Cooking Oil 1 litre Rs.220");
		System.out.println("3. Sugar 1 kg Rs.50");
		System.out.println("4. Soya Chunks 1 kg Rs.80");
	}
	static Scanner sc=new Scanner(System.in);
	public static void main(String[] args) {
		GroceryApp grocery=new GroceryApp();

		boolean test=true;
		while(test) {
			itemsList();
			String c;
			System.out.print("Enter item number you want to buy:");
			c=sc.nextLine();
			System.out.print("Enter quantity of the item:");
			int quantity=Integer.parseInt(sc.nextLine());
			
			if(quantity<=0) {
				System.out.println("Quantity cannot be "+quantity+". Kindly, enter valid quantity!");
				continue;
			}
			switch(c) {
			
			case "1" : grocery.generateBill(1,quantity);
						break;
			case "2" : grocery.generateBill(2,quantity);
						break;
			case "3" : grocery.generateBill(3,quantity);
						break;
			case "4" : grocery.generateBill(4,quantity);
						break;
			default: System.out.println("Not a valid Choice");
			}
			System.out.println("Press \"n\" to exit OR \"y\" to continue to add more items..");
			c=sc.nextLine();
			if (c.equalsIgnoreCase("n"))
				test=false;
		}
		grocery.displayPurchasedItem();
		System.out.println("Total Payable Amount = Rs."+grocery.getPayableTotal());
	}
}
