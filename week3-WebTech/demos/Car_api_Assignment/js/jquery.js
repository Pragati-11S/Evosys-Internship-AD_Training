
$(() => {
    const myDivUpdate=$('#myDivUpdate');
    const mytableDiv=$('#mytableDiv');
    let counter=0;  //to generate different id's,values

    //for submit button
    $('#submitAdd').on('click', function (event) {
        event.preventDefault();
        const carno = $('#carnoAdd').val();
        const carname = $('#carnameAdd').val();
        const carprice = $('#priceAdd').val();
        mytableDiv.show();

        //post request for add record in data base
        $.post('/app/add', {'rownumber': counter, 'carno': carno, 'carname': carname, 'carprice': carprice});

        //creating radio ,edit and delete buttons
        //every radio button having differeent id dynamically and same name variable
        const radio = $('<input type="radio" name="radio" />');
        radio.val(counter);
        const createButtonEdit = $('<input type="button" value="EDIT" class="editBtnInTable" />');
        const createButtonDelete = $('<input type="button" value="DELETE" class="deleteBtnInTable"  />');

        //appending data and buttons to td element
        //td elements having data have different id that are generating dynamically
        const tdForRadio = $('<td></td>').append(radio);
        const tdForCarId = $('<td></td>').append(carno).attr('id','carno'+counter);
        const tdForCarName = $('<td></td>').append(carname).attr('id','cname'+counter);
        const tdForPrice = $('<td></td>').append(carprice).attr('id','price'+counter);
        const tdForEdit = $('<td></td>').append(createButtonEdit);
        const tdForDelete = $('<td></td>').append(createButtonDelete);
        

        //appending all above td's to tr
        let tableRow = $("<tr></tr>").append(tdForRadio, tdForCarId, tdForCarName, tdForPrice, tdForEdit, tdForDelete);
        tableRow.attr('id','tableRow'+counter);
        $('#myTbody').append(tableRow); //appending tr to table 
        
        counter++;

        //showing the update form and addind carno automatically
        $('.editBtnInTable').on('click',function(eventForTable){
            eventForTable.preventDefault();
            myDivUpdate.show();
            const checkedRadioForUpdate=$('input:radio[name="radio"]:checked').val(); //fetching value of checked redio button
            const takingCheckedId=$(('#carno'+checkedRadioForUpdate)).text(); //fetching the car number from a row which is checked
            $('#carnoUpdate').val(takingCheckedId); //add that fetched car number to the update form's car number field
        });

     $('.deleteBtnInTable').on('click',function(){
            const tableRow=$('input:radio[name="radio"]:checked').val();
            if(tableRow!=undefined){
            $('#tableRow'+tableRow).remove(); 
                $.ajax({
                    url:'app/delete/'+tableRow,
                    type:'DELETE',
                    success:function(result){
                     //   alert(result.message);
                        if(result.message=='empty')
                        mytableDiv.hide();
                    }
                });

            }
            return false;
        });

        
    return false;
    });
    //For update button
    $('#submitUpate').on('click',function(eventforUpdateTable){
        myDivUpdate.hide();
        
        const carnoUpdate = $('#carnoUpdate').val();
        const carnameUpdate = $('#carnameUpdate').val();
        const carpriceUpdate = $('#priceUpdate').val();
        const checkedRadio=$('input:radio[name="radio"]:checked').val();

        
        //Put request for updating the recrd in data base
        if(checkedRadio!=undefined){
        $.ajax({
            url:'/app/update/'+carnoUpdate,
            type:'PUT',
            data:{'carname':carnameUpdate,'price':carpriceUpdate,'rownumber':checkedRadio},
            success:function(result){
                const res=result.message;
               // alert(result.message);
                if(res=='success')
                 {
                    $(('#cname'+checkedRadio)).text(carnameUpdate);
                    $(('#price'+checkedRadio)).text(carpriceUpdate);
                 }
                
            }
        });
    }
        return false;
    });
  
});