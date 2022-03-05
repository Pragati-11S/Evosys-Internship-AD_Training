Create api to get a product details
pid,pname,unit_price
1. index.html->UI
    Button : Get all PRoducts
    Button : Get Producut by pid
2. server.js->
    http://localhost:3000/
    1.get       http://localhost:3000/products 
    2.get       http://localhost:3000/products/:pid
    3.put       http://localhost:3000/products/update/:pid/:unit_price
    4.delete    http://localhost:3000/products/delete/:pid
    5.post      http://localhost:3000/products/add
3. app-route.js-> 
    1.get       http://localhost:3000/app/products 
    2.get       http://localhost:3000/app/products/:pid
    3.put       http://localhost:3000/app/products/update/:pid/:unit_price
    4.delete    http://localhost:3000/app/products/delete/:pid
    5.post      http://localhost:3000/app/products/add
4. product.js
==============================================================
JQuery for DOM manipulation on 
1. index.html->UI
    Button : Get all PRoducts
    Button : Get Producut by pid










