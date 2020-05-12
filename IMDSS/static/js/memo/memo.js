$(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();
});




function autogrow(textarea){
    var adjustedHeight=textarea.clientHeight;
    adjustedHeight=Math.max(textarea.scrollHeight,adjustedHeight);
    if (adjustedHeight>textarea.clientHeight){
        textarea.style.height=adjustedHeight+'px';
    } 
}


$(document).mousedown(
    function tap(ev) {
        if (ev.target.id == 'memo_btn' || ev.target.id == 'memo_text' || ev.target.id == 'memo_container') {
            $("#memo_container").removeClass("hide");
        } 
        else if(ev.target.id == 'memo_clean_btn'){
            $("#memo_container").removeClass("hide");
            $("#memo_text").val("")
        }
        else {
            if(ev.target.id == 'memo_save_btn'){
                var now = new Date()
                var url = location.href
                var patient_id = url.split("/").pop()
                var content = $("#memo_text").val()
                $.ajax({
                    type: "GET",
                    url: url + "save_memo",
                    data: {content: content, time: now.toLocaleString()},
                    dataType: "json",
                    success: function(result){
                        $("#memo_text").val("")
                        M.toast({html: 'memo saved!'})
                    }
                });
            }
            $("#memo_container").addClass("hide");
        }
    }
);



