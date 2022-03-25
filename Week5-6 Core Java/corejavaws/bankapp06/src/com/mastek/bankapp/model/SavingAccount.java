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
	public String withdraw(double amount) {
		final double diff=this.getBalance()-amount;
		this.setBalance(diff);
		return amount+" withdraw from account";
	}

}
