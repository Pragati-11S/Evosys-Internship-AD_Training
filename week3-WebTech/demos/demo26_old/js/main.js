// make post call using $.post()
        // $.get(URL,callback);
        // $.post(URL,data,callback);
        
$(function(){
    $("#addProduct").on("click",()=>{
        const newProduct={
            "pid":$("#pid").val(),
            "pname":$("#pname").val(),
            "unit_price":$("#unit_price").val(),
        }
        // $.post('/products',req_data,(resp_data,status)=>{ });
        $.post('/app/products',newProduct,function (resp_data,status){ 
            alert("post metod calledd");
            if(resp_data!=undefined){
                alert(JSON.stringify(resp_data));
            }
        });
        
    });
    // get all products : /app/products
    $("#showProducts").on("click",()=>{
        $("#products").empty();    
        $.get('/app/products',(data,status)=>{
                if(data!=undefined){
                    let products=JSON.stringify(data);
                    products=JSON.parse(products);
                    products.forEach(product=>{
                        const checkbox=$("<input type='checkbox' id='"+product.pid+"'/>");
                        checkbox.val(product.pid);
                        const label=$("<lable for='"+product.pid+"'></label").text(JSON.stringify(product));                                                                        
                        $("#products").append(checkbox,label);    
                    })
                }
        })
    });
    //pid => unitprice
    // $.ajax({url: "demo_test.txt", success: function(result){
    //     $("#div1").html(result);
    //   }});
    $("#updateProduct").on("click",function(event){
        event.preventDefault();
        const pid=$("#pid").val();
        const unit_price=$("#unit_price").val();     
        $.ajax({
            type:'PUT',
            url:'/app/products/update/'+pid,
            data:{"unit_price":unit_price},
            success:function(result){
                   alert(JSON.stringify(result)); 
            }    
        });
    })

     $("#deleteProduct").on("click",function(event){
            event.preventDefault();
            const pid=$("#pid").val();
            $.ajax({
                type:'DELETE',
                url:'/app/products/delete/'+pid,
                success:function(result){
                    alert(JSON.stringify(result)); 
                }
            });
     });
});