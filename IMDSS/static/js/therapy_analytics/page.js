$(document).ready(function(){
    $('select').formSelect();
});

function dept_change(){
    var dept_idx = document.getElementById("dept_select").value;
    var table_container = document.getElementById("disease_select_container");
    var insert_html = '<select id="disease_select" onchange="disease_change()">';
    insert_html += '<option value="" disabled selected>Select disease</option>';
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/therapy_analytics/disease_table",
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
    var checkbox_container = document.getElementById("therapy_checkbox_container")
    var insert_collapsible = ""
    var insert_checkbox = ""
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/therapy_analytics/treatment_detail",
        data: {"selected_disease": $("#disease_select option:selected").text()},
        dataType: "json",
        success: function(result){
            //$("#collapsible_container").css({"padding-bottom":"25px", "border-bottom":"1px solid black"});
            $("#therapy_checkbox_container").css("border-top", "1px solid black");
            insert_collapsible+='<ul class="collapsible">'
            insert_checkbox += "<h4>Therapy display</h4><br>"

            for(i=0;i < result["treatment"].length;i++){
                insert_collapsible+='<li><div class="collapsible-header"><i class="material-icons">colorize</i>'
                insert_collapsible+=result["treatment"][i]
                insert_collapsible+='</div><div class="collapsible-body"><p>'
                insert_collapsible+=result[result["treatment"][i]]
                insert_collapsible+='</p></div></li>'

                insert_checkbox+='<label class="therapy_checkbox_items"><input type="checkbox" class="filled-in" checked="checked"/><span>'
                insert_checkbox+=result["treatment"][i]
                insert_checkbox+='</span></label>'
            }
            insert_collapsible+='</ul>'
            collapsible_container.innerHTML = insert_collapsible
            checkbox_container.innerHTML = insert_checkbox
            $('.collapsible').collapsible();

            

            

        }
    });
}
