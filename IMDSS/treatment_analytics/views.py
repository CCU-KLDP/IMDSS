from django.shortcuts import render
from random import randint
from django.http import HttpResponse
import json
from pyecharts.charts import Line, Bar, Pie
from pyecharts import options as opts
from pyecharts.commons.utils import JsCode


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


def ajax_side_effect_detail(request):
    selected_disease = request.GET["selected_disease"]
    treatment_lst = ["treatment_1", "treatment_2", "treatment_3"]
    dic = {}
    dic['treatment'] = treatment_lst
    for i in treatment_lst:
        dic[i] = "side effect description - " + i.split("_")[1]

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
new label setting by pyecharts
"""
fn = """
    function(params) {
        return params.name + ' : \\n' + params.value + '%';
    }
    """


def new_label_opts():
    return opts.LabelOpts(
        formatter=JsCode(fn),
        # position="center",
        font_size=20,
        font_family="Microsoft YaHei",
        font_weight="bold",
    )


"""
@pony
please write your code below here!
"""


def get_success_ratio_charts(request):
    selected_therapy = request.GET["selected_therapy"]

    # success ratio
    data = {
        "treatment_1": 80,
        "treatment_2": 90,
        "treatment_3": 70,
    }

    pie = Pie()

    pie_str = draw_success_chart(pie, selected_therapy, data[selected_therapy])
    
    return HttpResponse(pie_str)
  

def draw_success_chart(chart, x, y):
    chart.add(
        x,
        [list(i) for i in zip(["成功率(%)", "失敗率(%)"], [y, 100-y])],
        radius=[60, 100],
        label_opts=new_label_opts(),
    )

    chart.set_global_opts(
        title_opts=opts.TitleOpts(
            title="",
            pos_top="5%",
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=30,
                font_family="Microsoft YaHei",
            ),

            item_gap=40,
            subtitle=" " * 24 + x,
            subtitle_textstyle_opts=opts.TextStyleOpts(
                font_size=24,
                font_family="Microsoft YaHei",
            )
        ),
        
        legend_opts=opts.LegendOpts(
            is_show=False,
        ),
        tooltip_opts=opts.TooltipOpts(
            background_color="white",
            border_width=1,
            textstyle_opts=opts.TextStyleOpts(
                color="black"
            ),
        )
    )
    
    chart_str = chart.dump_options()

    return chart_str


def get_cost_bar_charts(request):
    selected_therapy = request.GET["selected_therapy"]

    selected_therapy_lst = selected_therapy.split(" ")
    print(selected_therapy_lst)

    # success ratio
    data = {
        "treatment_1": 50000,
        "treatment_2": 73829,
        "treatment_3": 98529,
    }
    cost_lst = []
    for i in selected_therapy_lst:
        cost_lst.append(data.get(i))

    bar = Bar()

    bar.add_xaxis(list(reversed(selected_therapy_lst)))
    bar.add_yaxis(
        "Cost",
        list(reversed(cost_lst)),
        color=['red', 'blue', 'black'],
        category_gap='35%',
    )
    bar.reversal_axis()
    
    bar.set_global_opts(
        title_opts=opts.TitleOpts(
            title="Cost compare",
            pos_top="5%",
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=30,
                font_family="Microsoft YaHei",
            ),
            padding='50px',
        ),
        
        tooltip_opts=opts.TooltipOpts(
            background_color="white",
            border_width=1,
            textstyle_opts=opts.TextStyleOpts(
                color="black"
            ),
        ),

        legend_opts=opts.LegendOpts(
            is_show=False,
        ),

        xaxis_opts=opts.AxisOpts(
            axislabel_opts=opts.LabelOpts(
                font_size=20,
                font_family="Microsoft YaHei",
            )
        ),
        
        yaxis_opts=opts.AxisOpts(
            axislabel_opts=opts.LabelOpts(
                font_size=20,
                font_family="Microsoft YaHei",
            )
        ),
        
    ),

    bar.set_series_opts(
        label_opts=opts.LabelOpts(
            position='right',
        ),
        
    )
    

    
    bar_str = bar.dump_options()
    print(bar_str)

    return HttpResponse(bar_str)
