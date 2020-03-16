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
        }
    });
}