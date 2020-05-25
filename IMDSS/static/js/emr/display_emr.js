document.write('<script src="{% static "js/emr/sidenav.js" %}"</script>');

var mark_dic2 = ""
var flag = 0

function search_icon_to_green() {
    var icon = document.getElementById("search-icon")
    var bar = document.getElementById("search-bar")
    icon.src = green_pic
    bar.style.border = "1px solid #009688"
}

function search_icon_to_black() {
    var icon = document.getElementById("search-icon")
    var bar = document.getElementById("search-bar")
    icon.src = black_pic
    bar.style.border = "1px solid black"
}

$("#select-emr-table>tbody").on("click", "tr", function() {
    var selected_emr_type = $(this).find("td:eq(3)").text();
    var url = location.href
    var selected_emr_id = $(this).attr("id")

    $("#select-emr-table>tbody>tr").removeClass("selected")
    $(this).addClass("selected")

    $.ajax({
        type: "GET",
        url: url + "get_emr",
        data: {"selected_emr_id": selected_emr_id, "selected_emr_type": selected_emr_type},
        dataType: "json",
        success: function(result){
            insert_html = result['insert_html']
            $("#emr").empty()
            $("#emr").append(insert_html)
            for(i=0;i < Object.keys(mark_dic).length;i++){
                if (Object.keys(mark_dic)[i] == selected_emr_id) {
                   for(j=0;j < Object.values(mark_dic)[i].length;j++){
                        var highlight_text = Object.values(mark_dic)[i][j].slice(0, -1)
                        var lower_highlight_text = Object.values(mark_dic)[i][j].slice(0, -1).toLowerCase();

                        var original_text = $("#emr>:contains(" + highlight_text + ")").text()
                        var lower_original_text = $("#emr>:contains(" + lower_highlight_text + ")").text()
                        
                        var new_text = original_text
                        var lower_new_text = lower_original_text

                        for(k=0;k < 10;k++){
                            new_text = new_text.replace(highlight_text, '*helight*')
                            lower_new_text = lower_new_text.replace(lower_highlight_text, '*helight*')
                        }

                        for(k=0;k < 10;k++){
                            new_text = new_text.replace('*helight*', '<span style="color: red;">' + highlight_text + '</span>')
                            lower_new_text = lower_new_text.replace("*helight*", '<span style="color: red;">' + lower_highlight_text + '</span>')
                        }
                
                        $("#emr>:contains(" + highlight_text + ")").html(new_text)
                        $("#emr>:contains(" + lower_highlight_text + ")").html(lower_new_text)
                    }
                }
            }
            if(flag == 1){
                for(i=0;i < Object.keys(mark_dic2).length;i++){
                    if (Object.keys(mark_dic2)[i] == selected_emr_id) {
                    for(j=0;j < Object.values(mark_dic2)[i].length;j++){
                            var highlight_text = Object.values(mark_dic2)[i][j].slice(0, -1)
                            var lower_highlight_text = Object.values(mark_dic2)[i][j].slice(0, -1).toLowerCase();
                            
                            var original_text = $("#emr>:contains(" + highlight_text + ")").html()
                            var lower_original_text = $("#emr>:contains(" + lower_highlight_text + ")").html()
                            
                            var new_text = original_text
                            var lower_new_text = lower_original_text

                            for(k=0;k < 10;k++){
                                new_text = new_text.replace(highlight_text, '*helight*')
                                lower_new_text = lower_new_text.replace(lower_highlight_text, '*helight*')
                            }

                            for(k=0;k < 10;k++){
                                new_text = new_text.replace('*helight*', '<span style="color: blue;">' + highlight_text + '</span>')
                                lower_new_text = lower_new_text.replace("*helight*", '<span style="color: blue;">' + lower_highlight_text + '</span>')
                            }
                    
                            $("#emr>:contains(" + highlight_text + ")").html(new_text)
                            $("#emr>:contains(" + lower_highlight_text + ")").html(lower_new_text)
                        }
                    }
                
                }
            }
            

        }
        
    });
});

$("#select-emr-table tbody").on("hover", "tr", function() {
    $(this).style.bgColor=rgb(189, 189, 189)
});

$("#search-icon").on("click", function(){
    var input_text = $("input[name='input'] ").val()
    var insert_html="<i class='material-icons'>search</i>"

    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/text_search_emr",
        data: {"input_text": input_text},
        dataType: "json",
        success: function(result){
            $("#select-emr-table>tbody>tr").each(function(){
                $(this).find("td:eq(1)").empty()
            })
            
            for(i=0;i < Object.keys(result).length;i++){
                $("#"+Object.keys(result)[i]+">td:eq(1)").html(insert_html)
            }
            mark_dic2 = result
            flag = 1
        } 
    });
});

