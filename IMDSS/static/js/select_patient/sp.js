


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

