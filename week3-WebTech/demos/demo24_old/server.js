import express from 'express';
import path from 'path';
import app from './app/app-route.js';

const server=express();
const port=3000;
server.use(express.urlencoded({extended:true}));
server.use(express.json());
const __dirname=path.resolve(path.dirname(""));


//for http://localhost:3000/ => Welcome to express?
server.get('/',(req,resp)=>{
    resp.setHeader('Content-Type',"application/json");
    resp.send({message:"Welcome to Express Server"});
});
// Create a route such as http://localhost:3000/app
server.use('/app',app);
// // Create a route such as http://localhost:3000/libarary
// server.use('/library',library)
// // Create a route such as http://localhost:3000/vendor
// server.use('/vendor',vendor)


server.listen(port,()=>{console.log("http://localhost:3000");})