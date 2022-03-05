import express from 'express';
const router=express.Router();
let products=[
    {"pid":"p101","pname":"pepsi","unit_price":30.0},
    {"pid":"p102","pname":"pepsi","unit_price":40.0},
    {"pid":"p103","pname":"pepsi","unit_price":50.0}
]

router.get('/products',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    resp.send(products);
});
router.post('/products',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    
    const newProduct=req.body;
    console.log(newProduct);
    products.push(newProduct);
    resp.send(products);
})
router.put('/products/update/:pid',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    products.forEach(product=>{
        if(product.pid==req.params.pid){
            product.unit_price=req.body.unit_price;
            resp.send({"message":"Updated ","product":product})
        }
        
    })
    resp.send({message:"Failed to updated"});
});

router.delete('/products/delete/:pid',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    const pid=req.params.pid;
    const oldLength=products.length;
    products=products.filter((v,i,arr)=>{
            return arr[i].pid!=pid;
    });
    if(oldLength>products.length){
        resp.send({message:pid+"record deleted"});
    }
    resp.send({message:pid+"not found"});
});

export default router;