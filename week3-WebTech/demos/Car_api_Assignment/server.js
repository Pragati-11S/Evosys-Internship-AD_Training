import express from 'express';
import path from 'path';
import app from './car_rout/app.js'
const port='3000';
const message=`http://localhost:3000`;



const mypath=path.resolve(path.dirname(''));
const server=express();

server.use(express.urlencoded({extended:true}));
server.use(express.json());
server.use('/app',app);

server.get('/',(req,res)=>{
    res.setHeader('content-type',('text/html'));
    res.sendFile(mypath+'/index.html')

});

server.get('/style.css',(req,res)=>{
    res.setHeader('content-type','text/css');
    res.sendFile(mypath+'/css/style.css');
});

server.get('/jquery.js',(req,res)=>{
    res.setHeader('content-type','application/javascript');
    res.sendFile(mypath+'/js/jquery.js');
});



server.listen(port,()=>{
    console.log(message);
});

