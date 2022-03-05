import express from 'express';
import path from 'path';
import router from './app/product_route.js';
const port=4200;
const message="http://localhost:4200/ website is hosted";
const __dirname=path.resolve(path.dirname(''));
const server=express();
server.use(express.urlencoded({extended:true}));
server.use(express.json());
server.use('/app',router);
server.get('/',(req,resp)=>{
    resp.setHeader('Content-Type','text/html');
    resp.sendFile(__dirname+'/index.html');
});
server.get('/style.css',(req,resp)=>{
    resp.setHeader('Content-Type','text/css');
    resp.sendFile(__dirname+'/css/style.css');
});
server.get('/main.js',(req,resp)=>{
    resp.setHeader('Content-Type','application/javascript');
    resp.sendFile(__dirname+'/js/main.js');
});

server.listen(port,()=>{console.log(message);})