$(document).ready(function(){
    $('select').formSelect();
});

function dept_change(){
    var dept_idx = document.getElementById("dept_select").value;
    var cui_lst_container = document.getElementById("middle-list-container");
    var insert_html = "";
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/dept_CUI",
        dataType: "json",
        success: function(result){
            selected_dept = result.dept[dept_idx];
            for(i=0;i < result[selected_dept].length;i++){
                html = 
                    '<div class="item-list-container">'+
                    "<label>"+
                    '<input type="checkbox" class="filled-in item-list" />'+
                    "<span>"+
                    result[selected_dept][i]+
                    "</span>"+
                    "</label>"+
                    "</div>";
                insert_html += html   
            }

            cui_lst_container.innerHTML = insert_html;
        }
    });
}

function table_change(){
    var table_idx = document.getElementById("table_select").value;
    var cui_lst_container = document.getElementById("middle-list-container");
    var insert_html = "";
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/table_CUI",
        dataType: "json",
        success: function(result){
            selected_table = result.table[table_idx];
            for(i=0;i < result[selected_table].length;i++){
                html = 
                    '<div class="item-list-container">'+
                    "<label>"+
                    '<input type="checkbox" class="filled-in item-list" />'+
                    "<span>"+
                    result[selected_table][i]+
                    "</span>"+
                    "</label>"+
                    "</div>";
                insert_html += html   
            }

            cui_lst_container.innerHTML = insert_html;
        }
    });
}