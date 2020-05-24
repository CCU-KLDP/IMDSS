$(document).ready(function(){
    $('select').formSelect();
});

function dept_change(){
    var dept_idx = document.getElementById("dept_select").value;
    var table_container = document.getElementById("table-select-container");
    var insert_html = '<select id="table_select" onchange="table_change()">';
    insert_html += '<option value="" disabled selected>Select table</option>';
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/dept_table",
        dataType: "json",
        success: function(result){
            selected_dept = result.dept[dept_idx];
            for(i=0;i < result[selected_dept].length;i++){
                html = 
                '<option value='+
                i+
                ">"+
                result[selected_dept][i]+
                "</option>";
                insert_html += html;
            }
            insert_html += "</select>";
            table_container.innerHTML = insert_html;
            $(document).ready(function(){
                $('select').formSelect();
            });
        }  
    });
}

function table_change(){
    var cui_lst = document.getElementById("middle_list");
    var insert_html = "";
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/table_item",
        data: {
            "selected_table": $("#table_select option:selected").text(),
            "selected_dept": $('#dept_select :selected').text()
        },
        dataType: "json",
        success: function(result){
            for(i=0;i < result.length;i++){
                html = 
                    '<div id="item-list-container">'+
                    "<label>"+
                    // 等CUI傳過來，id = CUI
                    // onclick="update_mark()"
                    '<input type="checkbox" class="filled-in item-list" name="item" onclick="item_change()" />'+
                    "<span>"+
                    result[i]+
                    "</span>"+
                    "</label>"+
                    "</div>";
                insert_html += html   
            }

            cui_lst.innerHTML = insert_html;
        }
    });
}


function item_change(){
    var items = ""

    $("#item-list-container>label>input[name=item]").each(function(index){
        if($(this)[0].checked){
            items += $(this).next('span').text();
            items+= "***seperator***"
        }
    });

    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/get_mark",
        data: {
            "selected_table": $("#table_select option:selected").text(),
            "selected_dept": $('#dept_select :selected').text(),
            "items": items
        },
        dataType: "json",
        success: function(result){
            alert(123)
        }
    });
    

}