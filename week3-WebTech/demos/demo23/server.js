// we can use default modulew without {}
import  express  from "express";
import  {json}  from "express";
import path from "path";

import Product   from "./app/product.js";

const __dirname = path.resolve(path.dirname(''));
const server=express();
const port=3000;

const server_message=`http://localhost:3000/ started`;
const product_list=[];
product_list.push(new Product("p101","Pepsi 500ml",30.0));
product_list.push(new Product("p102","Thumsup 500ml",30.0));
product_list.push(new Product("p103","Sprite 500ml",30.0));
server.use(express.urlencoded({extended:true}));
server.use(express.json());

server.get('/',(req,resp)=>{
    resp.setHeader('Content-Type','text/html');
    resp.sendFile(path.join(__dirname,'/index.html'));
});
server.get('/style.css',(req,resp)=>{
    resp.setHeader('Content-Type','text/css');
    resp.sendFile(path.join(__dirname,"/css/style.css"));
})
server.get('/main.js',(req,resp)=>{
    resp.setHeader('Content-Type','application/javascript');
    resp.sendFile(path.join(__dirname+"/js/main.js"));
})


server.get('/products',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    resp.send(product_list);
});
server.get('/products/:pid',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const pid=req.params.pid;
    console.log("pid "+pid);
    const product=product_list.find(p=>p.pid===pid);
    console.log("product: "+product);
    if(product)
        resp.status(200).send(product);
    else
        resp.status(404).send(pid+ " Not Found on Server");
});
server.put('/products/:pid/:unit_price',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const pid=req.params.pid;
    const product=product_list.find(p=>p.pid===pid);
    if(product){
            product.unit_price=req.params.unit_price;
            resp.send(JSON.stringify(product)+" updated with new price");
    }
    else{   
            resp.status(404).send(pid+" No product found");
    }
    
    
});
server.delete('/products/:pid',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const pid=req.params.pid;
    product_list.forEach(product => {
            if(product.pid===req.params.pid){
                products.pop();
            }
    });
});
server.post('/products/add',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const newProduct={"pid":req.body.pid,"pname":req.body.pname,"unit_price":req.body.unit_price}
    if(newProduct){
        const n=product_list.push(newProduct);
        if(n>0) resp.send(JSON.stringify(newProduct)+" added in products record");
        else resp.status(500).send(JSON.stringify(newProduct)+" not added in record")
    }
});
server.listen(port,()=>{console.log(server_message);})