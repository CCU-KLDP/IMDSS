from django.shortcuts import render
from random import randint
from django.http import HttpResponse
import json
from pyecharts.charts import Line, Bar, Grid
from pyecharts import options as opts


# Create your views here.
def treatement_analytics_view(request):
    content = {
        "dept_lst": get_dept_lst()
    }
    return render(request, "therapy_analytics/analytics_page.html", content)


def get_dept_lst():
    return ["dept1", "dept_2", "dept_3"]


def ajax_get_disease(request):
    dept_lst = get_dept_lst()
    dic = {
        "dept": get_dept_lst()
    }

    for i in dept_lst:
        temp = []
        for j in range(3):
            temp.append("disease-" + str(randint(1, 11)))
        dic[i] = temp
    
    return response_as_json(dic)


def ajax_get_treatment_detail(request):
    selected_disease = request.GET["selected_disease"]
    treatment_lst = ["treatment_1", "treatment_2", "treatment_3"]
    dic = {}
    dic['treatment'] = treatment_lst
    for i in treatment_lst:
        dic[i] = "description" + i.split("_")[1]

    return response_as_json(dic)





"""
@pony
This part is for pyecharts to drawing pictures,
please don't change the statements here
"""
def response_as_json(data):
    json_str = json.dumps(data)
    response = HttpResponse(
        json_str,
        content_type="application/json",
    )
    response["Access-Control-Allow-Origin"] = "*"
    return response


def json_response(data, code=200):
    data = {
        "code": code,
        "msg": "success",
        "data": data,
    }
    return response_as_json(data)


def json_error(error_string="error", code=500, **kwargs):
    data = {
        "code": code,
        "msg": error_string,
        "data": {}
    }
    data.update(kwargs)
    return response_as_json(data)


JsonResponse = json_response
JsonError = json_error



"""
@pony
please write your code below here!
"""


def get_success_ratio_chart(request):
    selected_therapy = request.GET["selected_therapy"]
    x_data = []
    for i in selected_therapy.split(" "):
        x_data.append(i)
    print(x_data)

    # success ratio
    y_data = [80, 90, 70]

    bar = Bar()
    bar.add_xaxis(x_data)
    bar.add_yaxis(
        "成功率(%)",
        y_data[0],
        label_opts=opts.LabelOpts(is_show=False),
        xaxis_index=0,
        yaxis_index=0,
    )

    bar.add_yaxis(
        "成功率(%)",
        y_data[1],
        label_opts=opts.LabelOpts(is_show=False),
        xaxis_index=0,
        yaxis_index=1,
    )


    bar.add_yaxis(
            "成功率(%)",
            y_data[2],
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=0,
            yaxis_index=2,
        )


    bar.set_global_opts(
        title_opts=opts.TitleOpts(
            title="Therapy success ratio(%)",
            pos_top="0%",
            pos_left="10%",
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=25,
                font_family="Microsoft YaHei",
            ),
        ),
        tooltip_opts=opts.TooltipOpts(
            background_color="white",
            border_width=1,
            textstyle_opts=opts.TextStyleOpts(
                color="black"
                ),
        ),
        legend_opts=opts.LegendOpts(pos_top="15%"),
    )
    bar.set_series_opts(
        label_opts=opts.LabelOpts(is_show=False),  
    ),

    bar.reversal_axis()

    bar_str = bar.dump_options_with_quotes()

    print(bar_str)
    return JsonResponse(json.loads(bar_str))






def chart_view(request):
    """
    @pony
    render the charts to json
    """

    patient_id = request.GET['patient_id']

    #print(json.loads(
    #    grid_multiple_charts(init_multiple_charts(patient_id))
    #))
    return JsonResponse(json.loads(grid_multiple_charts(
        init_multiple_charts(patient_id),
        get_drug_charts(patient_id),
    )))