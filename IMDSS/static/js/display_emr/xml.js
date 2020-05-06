function load_xml() {
    $.ajax({
        type: "GET",
        url: "http://127.0.0.1:8000/emr//get_xml",
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