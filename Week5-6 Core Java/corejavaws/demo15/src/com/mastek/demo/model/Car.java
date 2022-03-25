package com.mastek.demo.model;

public class Car {
	private int carId;
	private String carName;
	private String brand;
	public Car(int carId, String carName, String brand) {
		super();
		this.carId = carId;
		this.carName = carName;
		this.brand = brand;
	}
	public Car(String carName, String brand) {
		super();
		this.carName = carName;
		this.brand = brand;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	@Override
	public String toString() {
		return "Car [carId=" + carId + ", carName=" + carName + ", brand=" + brand + "]";
	}
	

}
//com.mastek.demo.model.Car [carId,carName,brand]