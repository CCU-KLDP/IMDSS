from django.shortcuts           import render
from random                     import randint
from django.http                import HttpResponse
from pyecharts.charts           import Line, Bar, Pie
from pyecharts.commons.utils    import JsCode
from pyecharts                  import options              as opts
from db_models.models           import Department
from .models                    import Analysis, AnalysisAnnual
from random                     import shuffle

import pandas                   as pd
import numpy                    as np
import json


# Create your views here.
def treatement_analytics_view(request):
    content = {
        "dept_lst": get_dept_lst()
    }
    return render(request, "therapy_analytics/analytics_page.html", content)


def get_dept_lst():
    ana_df = pd.DataFrame(list(Analysis.objects.all().values()))

    depts = ana_df['dept_id'].value_counts().index.tolist()

    return [Department.objects.get(dep_id=dept).dep_name for dept in depts]


def ajax_get_disease(request):
    dept_lst = get_dept_lst()
    # dic = {
    #     "dept": get_dept_lst()
    # }

    ana_df = pd.DataFrame(list(Analysis.objects.all().values()))

    ana_groups = ana_df.groupby('dept_id')

    keys = list(ana_groups.groups.keys())

    disease_dict = {
        "dept": get_dept_lst()
    }

    for key in keys:
        dept = Department.objects.get(dep_id=key)
        disease_dict[dept.dep_name] = list(set(ana_groups.get_group(key)['disease_name'].tolist()))



    # for i in dept_lst:
    #     temp = []
    #     for j in range(3):
    #         temp.append("disease-" + str(randint(1, 11)))
    #     dic[i] = temp

    # print(disease_dict)
    return response_as_json(disease_dict)
    # return response_as_json(dic)


def ajax_get_treatment_detail(request):

    selected_dept = request.GET['selected_dept'] 
    selected_disease = request.GET["selected_disease"]
    # selected_dept = 'Chest Medicine'

    dep_id = Department.objects.get(dep_name=selected_dept).dep_id

    analysis_df = pd.DataFrame(list(Analysis.objects.filter(dept_id=dep_id).filter(disease_name=selected_disease).values()))

    treatment_dict = {
        "treatment": analysis_df['treat_name'].tolist(),
    }

    for index, row in analysis_df.iterrows():
        treatment_dict[row['treat_name']] = row['treat_description']

    # print('treatment_dict: ', treatment_dict)

    return response_as_json(treatment_dict)


def ajax_side_effect_detail(request):
    selected_dept = request.GET["selected_dept"]
    selected_disease = request.GET["selected_disease"]
    

    # selected_dept = 'Chest Medicine'

    dep_id = Department.objects.get(dep_name=selected_dept).dep_id

    analysis_df = pd.DataFrame(list(Analysis.objects.filter(dept_id=dep_id).filter(disease_name=selected_disease).values()))

    treatment_lst = analysis_df['treat_name'].tolist()
    dic = {}
    dic['treatment'] = treatment_lst

    for index, row in analysis_df.iterrows():
        dic[row['treat_name']] = row['treat_side']


    return response_as_json(dic)

# 乾我之前沒有規劃好，不然應該可以不用拆成 ajax_side_effect_detail 跟 update_side_effect_detail -w-
def update_side_effect_detail(request):
    selected_dept = request.GET["selected_dept"]
    selected_disease = request.GET["selected_disease"]
    selected_therapy = request.GET["selected_therapy"]

    dep_id = Department.objects.get(dep_name=selected_dept).dep_id

    analysis_df = pd.DataFrame(list(Analysis.objects.filter(dept_id=dep_id).filter(disease_name=selected_disease).values()))
    
    selected_therapy_lst = selected_therapy.split("**seperator**")

    dic = {}

    dic["selected_therapy"] = selected_therapy_lst

    for index, row in analysis_df.iterrows():
        if row['treat_name'] in selected_therapy_lst:
            dic[row['treat_name']] = row['treat_side']

    # for i in selected_therapy_lst:
    #     dic[i] = "side effect description - " + i.split("_")[1]

    print(dic)

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

pie_fn = """
        function(params) {
            return params.name + ' : \\n' + params.value;
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


def pie_label_opts():
    return opts.LabelOpts(
        # formatter=JsCode(pie_fn),
        position="right",
        font_size=16,
        font_family="Microsoft YaHei",
    )

"""
@pony
please write your code below here!
"""


def get_success_ratio_charts(request):
 
    selected_therapy = request.GET["selected_therapy"]
    selected_disease = request.GET["selected_disease"]
    # selected_disease = 'Lung Cancer'

    # print('selected_therapy: ', selected_therapy)

    anas = Analysis.objects.filter(disease_name=selected_disease).values()
    data = {}
    # success ratio
    for ana in anas:
        # data[ana['treat_name'].split(" ")[0]] = ana['treat_success'] # should change
        data[ana['treat_name']] = ana['treat_success']

    # should change
    # if selected_therapy not in data:
    #     data[selected_therapy] = 0
    

    # print("216: ", data)


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

# should change
def get_cost_bar_charts(request):
    # selected_therapy = request.GET["selected_therapy"]

    # selected_therapy_lst = selected_therapy.split(" ")

    # # success ratio
    # data = {
    #     "treatment_1": 50000,
    #     "treatment_2": 73829,
    #     "treatment_3": 98529,
    # }
    # cost_lst = []
    # for i in selected_therapy_lst:
    #     cost_lst.append(data.get(i))

    selected_therapy = request.GET["selected_therapy"]
    selected_disease = request.GET["selected_disease"]

    selected_therapy_lst = selected_therapy.split("**seperator**")

    anas = Analysis.objects.filter(disease_name=selected_disease).values()
    data = {}

    for ana in anas:
        if ana['treat_name'] in selected_therapy_lst:
            data[ana['treat_name']] = ana['treat_cost']


    cost_lst = [data[name] for name in selected_therapy_lst if name in data]

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
    selected_disease = request.GET["selected_disease"]
    selected_dept = request.GET["selected_dept"]

    # print(request.GET)

    selected_therapy_lst = list(selected_therapy.split("**seperator**"))

    dep_id = Department.objects.get(dep_name=selected_dept).dep_id
    anas = Analysis.objects.filter(dept_id=dep_id).values()

    # ana_groups = ana_df.groupby('disease_name')
    treatment_dict = {}
    for ana in anas:
        if ana['treat_name'] in selected_therapy_lst:
            treatment_dict[ana['treatment_id']] = ana['treat_name']

    keys = treatment_dict.keys()

    # ana_annual_df_lst = []

    # for key in keys:
    #     ana_annual_df = pd.DataFrame(list(AnalysisAnnual.objects.filter(treatment_id=key).values())).sort_values('year', axi=0, ascending=True)
    #     ana_annual_df_lst.append(ana_annual_df)

    ana_annual_df = pd.DataFrame(list(AnalysisAnnual.objects.all().values()))

    ana_annual_new_df = pd.pivot_table(ana_annual_df, index='year', columns='treatment_id', values='ratio' , aggfunc=np.sum)

    data = {}

    for key in keys:
        data[treatment_dict[key]] = ana_annual_new_df[key].tolist()
    
    # print(data)
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

    x_data = ana_annual_new_df.index.tolist()
    line.add_xaxis(x_data)

    print(x_data)
    i = 0
    for key in keys:
        print('series_name=', type(treatment_dict[key]))
        print('y_axis=', list(data[treatment_dict[key]]))
        print('color=', store_color_lst[i])
        line.add_yaxis(
            series_name=treatment_dict[key],
            y_axis=list(data[treatment_dict[key]]),
            color=use_color_lst[i],
            linestyle_opts=opts.LineStyleOpts(
                width=3,             
            ), 
            label_opts=opts.LabelOpts(
                is_show=False,
            )
        )
        i = i + 1

    line.set_global_opts(
        yaxis_opts=opts.AxisOpts(
            type_="value",
            min_=0,
            max_=50,
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
    selected_therapy_lst = list(selected_therapy.split("**seperator**"))

    selected_year = request.GET["selected_year"]
    selected_dept = request.GET["selected_dept"]
    selected_disease = request.GET["selected_disease"]


    dep_id = Department.objects.get(dep_name=selected_dept).dep_id
    anas = Analysis.objects.filter(dept_id=dep_id).values()

    # ana_groups = ana_df.groupby('disease_name')
    treatment_dict = {}
    for ana in anas:
        if ana['treat_name'] in selected_therapy_lst:
            treatment_dict[ana['treatment_id']] = ana['treat_name']

    keys = treatment_dict.keys()



    ana_annual_df = pd.DataFrame(list(AnalysisAnnual.objects.all().values()))

    ana_annual_new_df = pd.pivot_table(ana_annual_df, index='year', columns='treatment_id', values='ratio' , aggfunc=np.sum)

    # print(ana_annual_new_df.index)
    data = {}
    # print(treatment_dict)

    for key in keys:
        data[treatment_dict[key]] = int(ana_annual_new_df.loc[int(selected_year), key])

    all_therapy_lst = list(data.keys())

    pie_data = []

    selected_idx_lst = []

    for key in keys:
        temp = [str(treatment_dict[key]).replace(' ', '\n'), int(data[treatment_dict[key]])]
        pie_data.append(temp)
        # selected_idx_lst.append(all_therapy_lst.index(i))
    print(pie_data)
    store_color_lst = ["#5793f3", "#675bba", "#d14a61"]
    use_color_lst = []

    # for i in selected_idx_lst:
    #     use_color_lst.append(store_color_lst[i])

    pie = Pie()
    pie.add(
        "select ratio yearly",
        pie_data,
        label_opts=pie_label_opts(),
        radius=[0, 90],
    )

    pie.set_colors(store_color_lst)
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
