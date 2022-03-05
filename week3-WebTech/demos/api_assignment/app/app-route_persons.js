// Person API
import express from "express";
import Persons from "../js/Persons.js";
const people = express.Router();
let persons = [];

persons.push(new Persons(1, "SAM", "CURRAN", 20, "M"));
persons.push(new Persons(2, "SAMUEL", "JONAS", 30, "M"));
persons.push(new Persons(3, "ANNA", "STALES", 20, "F"));

// get all person
people.get("/persons", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  res.send(persons);
});

// get person by id
people.get("/persons/:pid", (req, res) => {
  res.setHeader("Content-Type", "application/json");
  const person = persons.find((p) => p.pid == req.params.pid);
  if (person) {
    res.send(person);
  } else {
    res.status(404).send("Person not found");
  }
});

//delete person
people.delete("/persons/:pid", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const delete_pid = req.params.pid;
  persons = persons.filter(function (v, i, a) {
    return a[i].pid != delete_pid;
  });
  console.log(persons);
  resp.send(persons);
});

// add person
people.post("/persons/add", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  let pid = req.body.pid;
  let fname = req.body.firstName;
  let lname = req.body.lastName;
  let age = req.body.age;
  let gen = req.body.gender;
  persons.push(new Persons(pid, fname, lname, age, gen));
  resp.send("Person added");
});

// Update person by id
people.put("/persons/:pid/:age", (req, resp) => {
  resp.setHeader("Content-Type", "application/json");
  const per_id = req.params.pid;
  console.log(per_id);
  const person = persons.find((p) => p.pid == per_id);
  if (person) {
    person.age = req.params.age;
    resp.send(JSON.stringify(person) + " updated with new age");
  } else {
    resp.status(404).send(per_id + " No person found");
  }
});
export default people;
