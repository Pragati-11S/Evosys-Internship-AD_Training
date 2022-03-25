package com.mastek.demo;

import com.mastek.demo.model.Bike;
import com.mastek.demo.model.Book;
import com.mastek.demo.model.Car;


public class App {

	public static void main(String[] args) {
		Bike bike=new Bike("pulsar","bajaj");
		Book book= new Book("gulliver travel","Jonathan Swift");
		Car car=new Car("supra","toyota");
		System.out.println(bike);
		System.out.println(book);
		System.out.println(car);
		
		

	}

}
/*create project=>demo15
com.mastek.demo.model.Bike [bikeId,bikeName,brand]
com.mastek.demo.model.Book [bookId,bookName,authorName]
com.mastek.demo.model.Car [carId,carName,brand]
com.mastek.demo.App*/