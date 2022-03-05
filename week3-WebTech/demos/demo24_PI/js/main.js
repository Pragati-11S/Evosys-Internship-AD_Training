// jQuery(CSS_Selectors) or $()
//////######################################################### 
// $("div").on("click",function(){
//     alert("div Cliked!")
// });
// $("h1").on("click",function(){
//     alert("h1 Cliked!")
// });
//////##### CSS Tag Selector
// $("button").on("click",function(event){
//     alert(event.target.id+" Cliked!")
// });
//////#########################################################
// $(document).ready(function(){});
//////#########################################################
//////##### CSS ID Selector
// $(function(){
//     $("#button1").on("click",(event)=>{alert(event.target.id+" clicked")})
//     $("#button2").on("click",(event)=>{alert(event.target.id+" clicked")})
//     $("#button3").on("click",(event)=>{alert(event.target.id+" clicked")})
// })
// //////##### CSS class Selector
// $(function(){
//     $(".class1").on("click",(event)=>{alert(event.target.id+" clicked")})
//     $(".class2").on("click",(event)=>{alert(event.target.id+" clicked")})    
// });
//////##### Take input for producuts from user and create a dynamic list
$(function(){
    
    $("#addProduct").on("click",()=>{
        const newProduct={
            "pid":$("#pid").val(),
            "pname":$("#pname").val(),
            "unit_price":$("#unit_price").val()
        };
        const li=$("<li></li>").text(JSON.stringify(newProduct));
        $("#products").append(li);
    });
})