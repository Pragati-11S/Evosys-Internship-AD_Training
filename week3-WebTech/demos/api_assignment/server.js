import express from 'express';
import path from 'path';

import library from './app/app-route_books.js';
import people from './app/app-route_persons.js';
import carshop from './app/app-route_cars.js';

const server = express();
const port = 3000;
server.use(express.urlencoded({ extended: true }));
server.use(express.json());
const __dirname = path.resolve(path.dirname(""));

server.get('/', (req, resp) => {
    resp.setHeader('Content-Type', "text/html");
    resp.sendFile(__dirname + "/index.html");
});

// Create a route such as http://localhost:3000/library
server.use('/library',library);
// Create a route such as http://localhost:3000/showroom
server.use('/carshop',carshop);
// Create a route such as http://localhost:3000/society
server.use('/people',people);

server.listen(port, () => { console.log("http://localhost:3000"); })