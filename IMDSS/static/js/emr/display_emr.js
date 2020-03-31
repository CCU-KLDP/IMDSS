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

$("#select-emr-table tbody").on("click", "tr", function() {
    var selected_emr_id=$(this).find("td:eq(1)").text()
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr_search/get_emr",
        data: {"selected_emr_id": selected_emr_id},
        dataType: "json",
        success: function(result){
 
        }
        
    })
});