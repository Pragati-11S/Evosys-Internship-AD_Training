package com.mastek.bankapp;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

//[5:21 PM] Dhanashree Jawle
//create bankapp11-> com.mastek.bankapp.model
//->BankAccount
//->SavingAccount
//->SalaryAccount
//->IBankService
//->IDeposit
//->IWithdraw
//com.mastek.bankapp
//->BankApp
//main()
//5min

import com.mastek.bankapp.model.BankAccount;
import com.mastek.bankapp.model.SavingAccount;

public class BankApp {

	private static void display(Set<BankAccount> accountsSet) {
		for(BankAccount account : accountsSet) {
			System.out.println(account);
		}
	}

	public static void main(String[] args) {
		Set<BankAccount> accountsSet = new TreeSet<>();
		accountsSet.add(new SavingAccount("Jimil",10000));
		accountsSet.add(new SavingAccount("Vishal",12000));
		accountsSet.add(new SavingAccount("Tamseel",15000));
		
		System.out.println("Natural order using Comprable");
		display(accountsSet);
		System.out.println("Natural order using Comprator");
		List<BankAccount> bankList = new ArrayList<>();
		Comparator comparator = new Comparator<BankAccount>() {

			@Override
			public int compare(BankAccount o1, BankAccount o2) {
				return o2.getAccNo() - o1.getAccNo();
			}
		};
		bankList.add(new SavingAccount("Jimil",10000));
		bankList.add(new SavingAccount("Vishal",12000));
		bankList.add(new SavingAccount("Tamseel",15000));

		bankList.sort(comparator);
		for(BankAccount account : bankList) {
			System.out.println(account);
		}
	}
}

//Exception in thread "main" java.lang.ClassCastException: class com.mastek.bankapp.model.SavingAccount cannot
//be cast to class java.lang.Comparable (com.mastek.bankapp.model.SavingAccount is in unnamed module of loader 
//'app'; java.lang.Comparable is in module java.base of loader 'bootstrap')
