$(document).ready(function(){
    // $("#getProductButton").click(function(){
    //     alert("Button 2 is clicked")
    // });
});


function getProductList(){
    alert("Get all products from server")
    const ul=document.getElementById("productList");
    
    const xmlHttpRequest=new XMLHttpRequest();
    xmlHttpRequest.onreadystatechange=function(){
        if(this.readyState==4&&this.status==200){
          let data=JSON.parse(this.responseText);
          alert("data"+data );
           data.forEach(element => {
            const li=document.createElement('li');
            li.innerText=JSON.stringify(element);
            ul.appendChild(li);
        });
        
        }
    };
    xmlHttpRequest.open('GET','/products',true);
    xmlHttpRequest.send();    
}

function getProductByPid(){
    const pid=document.getElementById("pid").value;
    
    const xmlHttpRequest=new XMLHttpRequest();
    xmlHttpRequest.onreadystatechange=function (){
        if(this.readyState==4&&this.status==200){
            document.getElementById("product").innerText=this.responseText;
        }
    }
    const path='/products/'+pid;
    xmlHttpRequest.open('GET',path,true);
    xmlHttpRequest.send();
}

function updateProduct(){
    xmlHttpRequest.open('put',path,true);
    xmlHttpRequest.send();
}
