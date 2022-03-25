package com.mastek.bankapp;

import com.mastek.bankapp.model.IDeposit;
import com.mastek.bankapp.model.IWithdraw;
import com.mastek.bankapp.model.SavingAccount;

public class BankApp {

	public static void main(String[] args) {
//		if you want account only to do deposit
		IDeposit daccount=new SavingAccount("Shreya",90000);
		System.out.println(daccount.deposit(100000.00));
		System.out.println(((SavingAccount) daccount).withdraw(1000.00));
		
		IWithdraw waccount=new SavingAccount("Shreya",90000);
		System.out.println(((SavingAccount) waccount).deposit(100000.00));
		System.out.println(waccount.withdraw(1000.00));
		
	}
}
