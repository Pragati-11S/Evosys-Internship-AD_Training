package com.mastek.bankapp.model;

public class SavingAccount extends BankAccount {
	
	public SavingAccount() {
		super();
	}

	public SavingAccount(int accNo, String accName, double balance) {
		super(accNo, accName, balance);
	}

	public SavingAccount(String accName, double balance) {
		super(accName, balance);
	}

	@Override
	public String deposit(double amount) {
		this.balance=this.balance+amount;
		return amount+" credited to "+accNo;
	}

	@Override
	public String withdraw(double amount) {
		this.balance=this.balance-amount;
		return amount+" withdrawn from "+accNo;
	}

}
