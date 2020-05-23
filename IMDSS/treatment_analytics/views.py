from django.shortcuts import render
from random import randint
from django.http import HttpResponse
import json
from pyecharts.charts import Line, Bar, Pie
from pyecharts import options as opts
from pyecharts.commons.utils import JsCode
from random import shuffle


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

# 乾我之前沒有規劃好，不然應該可以不用拆成 ajax_side_effect_detail 跟 update_side_effect_detail -w-
def update_side_effect_detail(request):
    selected_dept = request.GET["selected_dept"]
    selected_disease = request.GET["selected_disease"]
    selected_therapy = request.GET["selected_therapy"]

    selected_therapy_lst = selected_therapy.split(" ")

    dic = {}

    dic["selected_therapy"] = selected_therapy_lst
    for i in selected_therapy_lst:
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
            is_show=False,
        ),
        
    )

    bar_str = bar.dump_options()


    return HttpResponse(bar_str)


def get_select_thread_chart(request):
    selected_therapy = request.GET["selected_therapy"]
    selected_therapy_lst = list(selected_therapy.split(" "))
    x_data = [str(x) for x in range(1999, 2020)]
    bar_data = list(range(10, 101))
    shuffle(bar_data)

    treatment_1_ratio = bar_data[:21]
    treatment_2_ratio = bar_data[21:42]
    treatment_3_ratio = bar_data[42:63]

    data = {
        "treatment_1": treatment_1_ratio,
        "treatment_2": treatment_2_ratio,
        "treatment_3": treatment_3_ratio,
    }

    # 奇怪的bug==，顏色會反過來
    store_color_lst = ["#5793f3", "#675bba", "#d14a61"]

    use_color_lst = []
    selected_idx_lst = []

    all_therapy_lst = list(data.keys())

    for i in selected_therapy_lst:
        selected_idx_lst.append(all_therapy_lst.index(i))

    for i in selected_idx_lst:
        use_color_lst.append(store_color_lst[i])

    use_color_lst.reverse()

    line = Line()

    line.add_xaxis(x_data)
    for i in range(len(selected_therapy_lst)):
        line.add_yaxis(
            series_name=selected_therapy_lst[i],
            y_axis=list(data[selected_therapy_lst[i]]),
            color=use_color_lst[i],
            linestyle_opts=opts.LineStyleOpts(
                width=3,
                
            ), 
            label_opts=opts.LabelOpts(
                is_show=False,
            )
        )


    line.set_global_opts(
        yaxis_opts=opts.AxisOpts(
            type_="value",
            min_=0,
            max_=100,
            position="left",
            axisline_opts=opts.AxisLineOpts(
                linestyle_opts=opts.LineStyleOpts(color="black")
            ),
            axislabel_opts=opts.LabelOpts(formatter="{value} %"),
        ),



        title_opts=opts.TitleOpts(
            title="Select ratio(%)",
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=30,
                font_family="Microsoft YaHei",
            ),
            padding=[0, 0, 50, 0],
            
        ),
        
        tooltip_opts=opts.TooltipOpts(
            trigger="axis",
            axis_pointer_type="cross",
            background_color="white",
            border_width=1,
            textstyle_opts=opts.TextStyleOpts(
                color="black"
            ),
        ),
    

        legend_opts=opts.LegendOpts(
            is_show=False,
        ),
        datazoom_opts=[
            opts.DataZoomOpts(
                is_show=True,
                is_realtime=True,
                type_="inside",
                range_end=60,
            ),
            opts.DataZoomOpts(
                is_show=True,
                is_realtime=True,
                range_end=60,
            ),
        ],
    )

    line_str = line.dump_options_with_quotes()

    return JsonResponse(json.loads(line_str))


def get_select_pie_chart(request):
    selected_therapy = request.GET["selected_therapy"]
    selected_therapy_lst = list(selected_therapy.split(" "))

    selected_year = request.GET["selected_year"]

    all_therapy_lst = ["treatment_1", "treatment_2", "treatment_3"]

    data = {
        "treatment_1": 40,
        "treatment_2": 30,
        "treatment_3": 30,
    }

    pie_data = []

    selected_idx_lst = []

    for i in selected_therapy_lst:
        temp = [i, data[i]]
        pie_data.append(temp)
        selected_idx_lst.append(all_therapy_lst.index(i))

    store_color_lst = ["#5793f3", "#675bba", "#d14a61"]
    use_color_lst = []

    for i in selected_idx_lst:
        use_color_lst.append(store_color_lst[i])

    pie = Pie()
    pie.add(
        "select ratio yearly",
        pie_data,
        label_opts=opts.LabelOpts(
            font_size=18,
            font_family="Microsoft YaHei",
        ),
        radius=[0, 90],
        
    )
    pie.set_colors(use_color_lst)
    pie.set_global_opts(
        legend_opts=opts.LegendOpts(
            is_show=False,
        ),
        title_opts=opts.TitleOpts(
            title=selected_year,
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=30,
                font_family="Microsoft YaHei",
            )
        ),

        tooltip_opts=opts.TooltipOpts(
            background_color="white",
            border_width=1,
            textstyle_opts=opts.TextStyleOpts(
                color="black"
            ),
        ),
    )




    pie_str = pie.dump_options()

    return HttpResponse(pie_str)