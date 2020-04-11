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
var chart = echarts.init(document.getElementById('top_chart'), 'white', {renderer: 'canvas'});

$(
    function () {
        fetchData(chart);
    }
);

function fetchData() {
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/patient_detail/charts/top_chart",
        dataType: 'json',
        success: function (result) {
            chart.setOption(result.data);
            chart.on('click', function (param) {
                $.ajax({
                    type: "POST",
                    url: "http://127.0.0.1:8000/patient_detail/emr",
                    dataType:'json',
                    data: {"x_data": param.name, "y_data": param.value},
                    success: function (result2) {

                    }
                });
            });
        }
    });
}