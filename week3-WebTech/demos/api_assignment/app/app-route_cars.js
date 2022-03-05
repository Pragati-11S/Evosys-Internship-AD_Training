// Cars API
import express from "express";
import Cars from "../js/cars.js";
const carshop = express.Router();
let cars = [];

cars.push(new Cars(1, "SUV", "S1", 1000000));
cars.push(new Cars(2, "Bentley", "B2", 20000000));
cars.push(new Cars(3, "Audi", "A3", 500000));

// get all cars
carshop.get("/cars", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  res.send(cars);
});

//get car by id
carshop.get("/cars/:carid", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  const car = cars.find((c) => c.carid == req.params.carid);
  if (car) {
    res.send(car);
  } else {
    res.status(404).send("Car not found");
  }
});

//delete car by id
carshop.delete("/cars/:carid", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const cid = req.params.carid;
  cars = cars.filter(function (v, i, a) {
    return a[i].carid != cid;
  });
  console.log(cars);
  resp.send(cars);
});

// add car
carshop.post("/cars/add", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  let carid = req.body.carid;
  let carName = req.body.carName;
  let carModel = req.body.carModel;
  let carPrice = req.body.carPrice;
  cars.push(new Cars(carid, carName, carModel, carPrice));
  resp.send("Car added");
});

// Update car by id
carshop.put("/cars/:carid/:carPrice", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const cid = req.params.carid;
  console.log(cid);
  const car = cars.find((c) => c.carid == cid);
  if (car) {
    car.carPrice = req.params.carPrice;
    resp.send(JSON.stringify(car) + " updated with new price");
  } else {
    resp.status(404).send(cid + " No product found");
  }
});

export default carshop;
