$(function(){
    $("#getGender").on("click",function(){
    //     // const gender=$("radio[name='gender']").val();
    //     // console.log(gender)   
    //     const gender=$("radio");
    //     console.log(typeof(gender));
            const gender=    $("input:radio[name='gender']:checked").val();
            console.log(gender);
            const city=     $("input:checkbox[name='cities']:checked").val();
            console.log(city);
            const cities=[];
            $("input:checkbox[name='cities']:checked").each(function(){
                    cities.push($(this).val()); 
            });
            console.log(cities);
            const data={"gender":gender,"cities":cities};
            $.post('/info',data,(data,status)=>{        
                    if(data!=undefined){
                        alert(data);
                    }
            });

    });
    
});