// take care of post request, by django official
function getCookie(name) {  
    var cookieValue = null;  
    if (document.cookie && document.cookie != '') {  
        var cookies = document.cookie.split(';');  
        for (var i = 0; i < cookies.length; i++) {  
            var cookie = jQuery.trim(cookies[i]);  
            // Does this cookie string begin with the name we want?  
            if (cookie.substring(0, name.length + 1) == (name + '=')) {  
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));  
                break;  
            }  
        }  
    }  
    return cookieValue;  
}  
var csrftoken = getCookie('csrftoken');  
  
function csrfSafeMethod(method) {  
    // these HTTP methods do not require CSRF protection  
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));  
}  
$.ajaxSetup({  
    crossDomain: false, // obviates need for sameOrigin test  
    beforeSend: function(xhr, settings) {  
        if (!csrfSafeMethod(settings.type)) {  
            xhr.setRequestHeader("X-CSRFToken", csrftoken);  
        }  
    }  
});  





// our code
$("#select-pats-table>tbody").on("click", "tr", function() {
  
  var selected_pats_id=$(this).find("td:eq(2)").text();
  $("#select-pats-table>tbody>tr").removeClass("selected")
  $(this).addClass("selected")
  
  $.ajax({
      type: "GET",
      data: {"selected_emr_id": selected_pats_id},
      dataType: "json",
      success: function(result){

      }
      
  });
});


$("#visualize").on("click", function() {
    var patient_id = 1232131
    $.ajax({
        type: "POST",
        url: location.href + "visualize",
        data: {"patient_id": patient_id},
        dataType: "json",
        success: function(result){
            window.location.href = result
        }

    });
});

$("#emr_search").on("click", function() {
    var patient_id = 32482922
    $.ajax({
        type: "POST",
        url: location.href + "emr_search",
        data: {"patient_id": patient_id},
        dataType: "json",
        success: function(result){
            window.location.href = result
        }
    });
});


