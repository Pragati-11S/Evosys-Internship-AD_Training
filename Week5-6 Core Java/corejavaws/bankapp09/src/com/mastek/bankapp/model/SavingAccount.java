package com.mastek.bankapp.model;

public class SavingAccount extends BankAccount {

	private static final double MIN_BAL = 1000.00;

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
		this.balance = this.balance + amount;
		return amount + " credited to " + accNo;
	}

	@Override
	public String withdraw(double amount) throws Exception {
		final double diff=this.balance-amount;
		if(diff>=MIN_BAL){
			this.balance=diff;
		}		else{
			throw new Exception("Maintain min balance in account try another amount  ");
		}
		return amount + " debited to " + accNo;
	}

}
