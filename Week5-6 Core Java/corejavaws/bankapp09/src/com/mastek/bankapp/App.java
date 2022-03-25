package com.mastek.bankapp;

import com.mastek.bankapp.model.BankAccount;
import com.mastek.bankapp.model.SavingAccount;

public class App {

	public static void main(String[] args) {
		System.out.println("Package/Default Access Specifier");
		BankAccount account=new SavingAccount("Amit",10000.00);
		System.out.println(account);
		noException(account);
		withException(account);

	}

	private static void withException(BankAccount account) {
		try {
			System.out.println("Withdraw 9001");
			System.out.println(account.withdraw(9001.00));
		} catch (Exception e) {
//				e.printStackTrace();
			System.out.println("Error "+e.getMessage());
		}finally{
			System.out.println("Finally block called");
		}
	}

	private static void noException(BankAccount account) {
		try {
			System.out.println("Withdraw 9000");
			System.out.println(account.withdraw(9000.00));
		} catch (Exception e) {
				e.printStackTrace();
		}finally{
			System.out.println("Finally block called");
		}
	}

}
