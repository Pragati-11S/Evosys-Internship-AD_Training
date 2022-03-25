package com.mastek.demo.model;
//com.mastek.demo.model.Bike [bikeId,bikeName,brand]
public class Bike {
	private int bikeId;
	private String bikeName;
	private String brand;
	public Bike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bike(int bikeId, String bikeName, String brand) {
		super();
		this.bikeId = bikeId;
		this.bikeName = bikeName;
		this.brand = brand;
	}
	public Bike(String bikeName, String brand) {
		super();
		this.bikeName = bikeName;
		this.brand = brand;
	}
	public int getBikeId() {
		return bikeId;
	}
	public void setBikeId(int bikeId) {
		this.bikeId = bikeId;
	}
	public String getBikeName() {
		return bikeName;
	}
	public void setBikeName(String bikeName) {
		this.bikeName = bikeName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	@Override
	public String toString() {
		return "Bike [bikeId=" + bikeId + ", bikeName=" + bikeName + ", brand=" + brand + "]";
	}
	

}
