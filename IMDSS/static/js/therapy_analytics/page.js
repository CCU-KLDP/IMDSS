document.write('<script src="{% static "js/therapy_analytics/charts.js" %}"</script>');


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
    var checkbox_container = document.getElementById("therapy_checkbox_container");
    var card_container = document.getElementById("side_effect_container");

    var insert_collapsible = "";
    var insert_checkbox = "";
    var insert_card = "";
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/therapy_analytics/treatment_detail",
        data: {"selected_dept": $("#dept_select option:selected").text(), "selected_disease": $("#disease_select option:selected").text()},
        dataType: "json",
        async:false,
        success: function(result){
            //$("#collapsible_container").css({"padding-bottom":"25px", "border-bottom":"1px solid black"});
            $("#therapy_checkbox_container").css("border-top", "1px solid black");
            insert_collapsible+='<ul class="collapsible">'
            insert_checkbox += "<h4><b>Therapy display</b></h4><br>"
            insert_card += '<h4><b>Side effect</b></h4><div id="side_effect_card_container">'

            for(i=0;i < result["treatment"].length;i++){
                insert_collapsible+='<li><div class="collapsible-header"><i class="material-icons">colorize</i>'
                insert_collapsible+=result["treatment"][i]
                insert_collapsible+='</div><div class="collapsible-body"><p>'
                insert_collapsible+=result[result["treatment"][i]]
                insert_collapsible+='</p></div></li>'

                insert_checkbox+='<label class="therapy_checkbox_items"><input type="checkbox" class="filled-in" name="therapy" checked="checked"/><span>'
                insert_checkbox+=result["treatment"][i]
                insert_checkbox+='</span></label>'

                insert_card+='<div class="card blue-grey darken-1"><div class="card-content white-text"><span class="card-title"><b>'
                insert_card+=result["treatment"][i]
                insert_card+='</b></span><p>'



                $.ajax({
                    type: "GET",
                    url: "http://127.0.0.1:8000/therapy_analytics/side_effect_detail",
                    data: {"selected_dept": $("#dept_select option:selected").text(), "selected_disease": $("#disease_select option:selected").text()},
                    dataType: "json",
                    async:false,
                    success: function(result2){
                        insert_card+=result2[result["treatment"][i]]
                    }
                });
                insert_card+='</p></div></div>'

            }
            insert_collapsible+='</ul>'

            collapsible_container.innerHTML = insert_collapsible
            checkbox_container.innerHTML = insert_checkbox
            card_container.innerHTML = insert_card

            $('.collapsible').collapsible();

            var selected_therapy=""
            var insert_success_ratio_div=""
            var success_ratio_chart_container=document.getElementById("success_ratio_chart_container");

            $(".therapy_checkbox_items>input:checked[name=therapy]").each(function(index){
                if($(this)[0].checked){
                    selected_therapy+=$(this).next('span').text(); 
                    selected_therapy+=" ";
                    insert_success_ratio_div+='<div class="success_ratio_chart"></div>'
                }
            });
            selected_therapy = selected_therapy.slice(0, -1)
            
            $("#success_ratio_chart_title>b").text("Success ratio")
            success_ratio_chart_container.innerHTML = insert_success_ratio_div


            fetch_success_ratio_chart(selected_therapy)
            // fetch_cost_bar_chart(selected_therapy)
            
  

        }
    
    });
}

