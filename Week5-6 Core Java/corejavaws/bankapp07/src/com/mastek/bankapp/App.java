package com.mastek.bankapp;

import com.mastek.bankapp.model.BankAccount;
import com.mastek.bankapp.model.SavingAccount;

public class App {

	public static void main(String[] args) {
		System.out.println("Package/Default Access Specifier");
		BankAccount account= new SavingAccount("Amit",10000.00);
		System.out.println(account.getAccName());
		System.out.println(account.getBalance());
		System.out.println(account.deposit(1000.00));
		System.out.println(account.withdraw(1000.00));
	}
}
