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