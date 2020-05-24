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
$("#visualize").on("click", function() {
    var patient_id = $("#selected>td").attr("id")
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
    var patient_id = $("#selected>td").attr("id")
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


$("#select-pats-table>tbody").on("click", "tr", function () {
    $("#select-pats-table>tbody>tr").removeAttr('id')
    $(this).attr('id', 'selected')

    var selected_patient_id = $("#selected>td").attr('id')

    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/select_patient/memo",
        data: {"selected_patient_id": selected_patient_id},
        success: function (result2) {
            
        }
    });
});

$(
    function () {
        var textWrapper = document.querySelector('.ml1 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
        anime.timeline({ loop: false })
        .add({
            targets: '.ml1 .letter',
            scale: [0.3, 1],
            opacity: [0, 1],
            translateZ: 0,
            easing: "easeOutExpo",
            duration: 600,
            delay: (el, i) => 70 * (i + 1)
        }).add({
            targets: '.ml1 .line',
            scaleX: [0, 1],
            opacity: [0.5, 1],
            easing: "easeOutExpo",
            duration: 700,
            offset: '-=875',
            delay: (el, i, l) => 80 * (l - i)
        })
        var textWrapper = document.querySelector('.ml2 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
        anime.timeline({ loop: false })
            .add({
                targets: '.ml2 .letter',
                scale: [0.3, 1],
                opacity: [0, 1],
                translateZ: 0,
                easing: "easeOutExpo",
                duration: 600,
                delay: (el, i) => 70 * (i + 1)
            }).add({
                targets: '.ml2 .line',
                scaleX: [0, 1],
                opacity: [0.5, 1],
                easing: "easeOutExpo",
                duration: 700,
                offset: '-=875',
                delay: (el, i, l) => 80 * (l - i)
            })
    }
);



// Wrap every letter in a span

  
    
