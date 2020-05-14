$(document).ready(function(){
    $('select').formSelect();
    $('.collapsible').collapsible();
});

function dept_change(){
    var dept_idx = document.getElementById("dept_select").value;
    var table_container = document.getElementById("disease_select_container");
    var insert_html = '<select id="disease_select" onchange="disease_change()">';
    insert_html += '<option value="" disabled selected>Select disease</option>';
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/treatment_analytics/disease_table",
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
            $('select').formSelect();
        }  
    });
}

function disease_change(){
    var collapsible_container = document.getElementById("collapsible_container");
    var insert_html = ""
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/treatment_analytics/treatment_detail",
        data: {"selected_disease": $("#disease_select option:selected").text()},
        dataType: "json",
        success: function(result){
            insert_html+='<ul class="collapsible">'
            for(i=0;i < result["treatment"].length;i++){
                insert_html+='<li><div class="collapsible-header"><i class="material-icons">colorize</i>'
                insert_html+=result["treatment"][i]
                insert_html+='</div><div class="collapsible-body"><p>'
                insert_html+=result[result["treatment"][i]]
                insert_html+='</p></div></li>'
            }
            insert_html+='</ul>'
            collapsible_container.innerHTML = insert_html
            $('.collapsible').collapsible();

        }
    });
}
