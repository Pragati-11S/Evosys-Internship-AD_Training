// Variables use keyword var
console.log(message);//undefined
var message="Welcome to JavaScript!"; // declaration and initialzation

// Variables use keyword var
console.log(message);//undefined
var message="Welcome to JavaScript!"; // declaration and initialzation
// Variables use keyword let

function f1(){
    console.log("inseide f1() outer variable before reassigning value : "+num1);
    num1=2222; // intialized with some other  value 
    console.log("inside f1() outer variable after reassigning value: "+num1);
}
var num1=2000;
console.log("Before function call: "+num1);
f1();
console.log("After function call : "+num1);