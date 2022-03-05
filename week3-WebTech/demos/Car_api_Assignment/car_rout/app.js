import express from 'express';
import path from 'path';
import car from '../js/car.js';

const app=express.Router();

let carList={};


app.post('/add',(req,res)=>{
    res.header('content-type','application/json');
    const rownumber=req.body.rownumber
    carList[rownumber]={'carno':req.body.carno,'carname':req.body.carname,'price':req.body.carprice};
    res.send({message:'success'});

    console.log(carList);

});

app.put('/update/:carno',(req,res)=>{
    res.setHeader('content-type','application/json');
    const rownumber=req.body.rownumber;
    const carno=req.params.carno;
    const carname=req.body.carname;
    const price=req.body.price;
    
     if(carList[rownumber]['carno']===carno){
        carList[rownumber]['carname']=carname;
        carList[rownumber]['price']=price;
        console.log(carList);
        res.send({message:'success'});
        
    } 
    else
    res.send({message:'fail'});
});


app.delete('/delete/:rownumber',function(req,res){
    
        res.setHeader('content-type','application/json');
        const rownumber=req.params.rownumber;
        delete carList[rownumber];
        console.log(carList);

        if(Object.keys(carList).length===0)
            res.send({message:'empty'});
        else
        res.send({message:'deleted'});
    });
    
    

export default app;
