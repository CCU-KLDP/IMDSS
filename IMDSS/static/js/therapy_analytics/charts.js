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
function fetch_success_ratio_chart(selected_therapy) {
    var success_ratio_chart = echarts.init(document.getElementById('success_ratio_chart'), 'white', {renderer: 'canvas'});
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/therapy_analytics/success_ratio_chart",
        data: {"selected_therapy": selected_therapy},
        success: function (result) {
            var re_obj = (new Function("return " + result))();   //把传来的字串直接转成object
            success_ratio_chart.setOption(re_obj);
            
        }
    });
}



/*
function onCheckBox(checkbox)
{
    var items = document.getElementsByName("item");
	var maxChoices = 5;
	var flag = 0;
	
	for(var i=0; i<items.length; i++)
	{
		if(items[i].checked)
		{
			flag ++;
		}
	}
	if(flag >= maxChoices)
	{
		for(var k=0; k<items.length; k++)
		{
			if(!items[k].checked)
			{
				items[k].disabled = true;
			}
		}
	}
	else
	{
		for(var p=0; p<items.length; p++)
		{
			if(!items[p].checked)
			{
				items[p].disabled = false;
			}
		}
	}
}




$("#search").click(function(){
    var items = document.getElementsByName("item");
	var flag = 0;
	var maxChoices = 5;
	
	for(var j=0; j<items.length; j++)
	{
		if(items[j].checked)
		{
			flag++;
		}
	}
	if(flag < 5)
	{
		M.toast({html: 'please select 5 drugs!'})
    }
    else{
        var id = location.href.split("/")[4]
        $.ajax({
            type: "GET",
            url: "http://127.0.0.1:8000/charts/update_drugs",
            data: {patient_id : id},
            dataType: "json",
            success: function(result){
                chart.setOption(result.data);
            }
            
        });
    }
})

$("#clear").click(function(){
    var items = document.getElementsByName("item");
	
	for(var j=0; j<items.length; j++)
	{
        items[j].checked = false
        items[j].disabled = false
	}
})
*/

