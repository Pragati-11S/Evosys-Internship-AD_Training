package com.mastek.demo.model;

public class Greeting {

	protected int id;
	protected String message;

	private static int counter;

	static {
		counter = 1001;
	}
	{
		this.id = counter++;
	}

	public Greeting() {
		super();
	}

	public Greeting(int id, String message) {
		super();
		this.id = id;
		this.message = message;
	}

	public Greeting(String message) {
		super();
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Greeting other = (Greeting) obj;
		if (id != other.id)
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Greeting [id=" + id + ", message=" + message + "]";
	}

	public void greet() {
		System.out.println("Greetings for " + this.message);
	}
}
