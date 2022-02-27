const express=require('express');
const server=express();
const port=3000;
const message=`http://localhost:${port} started `;
server.use(express.urlencoded());
server.use(express.json());
//http://localhost:3000/style.css
server.get('/style.css',(req,resp)=>{
    resp.sendFile(__dirname+'/css/style.css');
});

//http://localhost:3000/signup.js
server.get('/signup.js',(req,resp)=>{
    resp.sendFile(__dirname+'/js/signup.js');
});
//http://localhost:3000/
server.get('/',(req,resp)=>{
    resp.sendFile(__dirname+'/index.html');
});
//http://localhost:3000/index.html
server.get('/index.html',(req,resp)=>{
    resp.sendFile(__dirname+'/index.html');
});
//http://localhost:3000/aboutus.html
server.get('/aboutus.html',(req,resp)=>{
    resp.sendFile(__dirname+'/aboutus.html');
});
//http://localhost:3000/contactus.html
server.get('/contactus.html',(req,resp)=>{
    resp.sendFile(__dirname+'/contactus.html');
});
//http://localhost:3000/signup.html
server.get('/signup.html',(req,resp)=>{
    resp.sendFile(__dirname+'/signup.html');
});
//http://localhost:3000/signin.html
server.get('/signin.html',(req,resp)=>{
    resp.sendFile(__dirname+'/signin.html');
});

const users=[
    {id:1,firstName:"Pragati1",lastName:"Sharma1",email:"202012047w@daiict.ac.in",password:"745896",cpassword:"745896"},
    {id:2,firstName:"Pragati2",lastName:"Sharma2",email:"202012047q@daiict.ac.in",password:"745896",cpassword:"745896"}
];
//http://localhost:3000/signin.html
server.post('/welcome',(req,resp)=>{
    // resp.sendFile(__dirname+'/welcome.html');
    resp.setHeader('Content-Type','application/json');
    // resp.send({message:'Welcome'});
    const user={"id":users.length,
                "firstName":req.body.firstName,
                "lastName":req.body.lastName,
                "email":req.body.email,
                "password":req.body.password,
                "cpassword":req.body.cpassword};
    users.push(user);
    resp.send(user);
});

server.get('/users',(req,resp)=>{
    resp.setHeader('Content-Type','application/json');
    resp.send(users);
});

server.put('/users/update/:id/:lastname',(req,resp)=>{
    const id=parseInt(req.params.id);
    const password=req.params.password;
    console.log("id- "+id+" password- "+password);
    resp.setHeader('Content-Type','application/json');
    users.forEach(element=> {
        if(element["id"]===id){
            console.log("element="+JSON.stringify(element));
            element["password"]=password;
            element["cpassword"]=password;
        }
    });
    resp.send(users);
});


server.listen(port,()=>{
    console.log(message);
});