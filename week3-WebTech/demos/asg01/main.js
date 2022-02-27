//creae object to store Product details such as pid,pname,unitprice
//using new keyword
const product = new Object();
product.pid = 1;
product.pname = "Product1";
product.unitPrice = 520;
product.details = function() {
    return this.pid + " " + this.pname + " " + this.unitPrice;
}
console.log(product.details());
//using constructor
function Product(pid, pName, unitPrice) {
    this.pid = pid;
    this.pName = pName;
    this.unitPrice = unitPrice;
    this.details = () => { return this.pid + " " + this.pName + " " + this.unitPrice};
}
const p1 = new Product(2, "Product2", 740);
console.log(p1.details());
//using json
const p2 = {"pid": 3, "pname": "Product3", "unitPrice": 880, "details": function(){ return this.pid + " " + this.pname + " " + this.unitPrice}};
console.log(p2.details());