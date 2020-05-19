from django.shortcuts       import render
from random                 import shuffle
from pyecharts.charts       import Line, Bar, Grid
from pyecharts              import options as opts
from django.http            import HttpResponse
from .models                import TprData, MedData

import pandas               as     pd
import numpy                as     np
import json
import math
import datetime


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
def tpr_data_frame(patient_id):

    tpr_df = pd.DataFrame(list(TprData.objects.filter(patient_id_id=patient_id).values()))
    
    tpr_df['create_date'] = tpr_df['create_date'].astype(int).add(19110000).astype(str)
    tpr_df['item'] = tpr_df['item'].str.strip()
    tpr_df['time'] = tpr_df[['create_date', 'create_time']].agg("\n".join, axis=1)
    

    tpr_df['time'] = tpr_df['time'].apply(lambda x: datetime.datetime.strptime(x, "%Y%m%d %H%M%S"))

    # tpr_new_df = pd.pivot_table(tpr_df, index=['create_date', 'create_time'], columns='item', values='value', aggfunc=np.sum)
    tpr_new_df = pd.pivot_table(tpr_df, index='time', columns='item', values='value' , aggfunc=np.sum)
    tpr_new_df.update(tpr_new_df[['BT(TA)', 'BW', 'DBP1', 'HR', 'RR', 'SBP1']].fillna(method='bfill'))
    # print(tpr_new_df)

    return tpr_new_df

def init_multiple_charts(patient_id) -> Grid:
    """
    @pony
    @return grid(json like object)
    @param list 所有type的資料都用list給(日期、生理資料、藥物使用)，每一個index要對好，缺的index用null塞
    """
    # ###### in real world should delete
    patient_id = 80000154
    # ######

    tpr_df = tpr_data_frame(patient_id)
    tpr_df = tpr_df.sort_values(by='time',ascending=True)

    # print(tpr_df.index.tolist())

    
    # x_data = [x for x in tpr_df.index.tolist()[:40]]
    # y_HR = tpr_df.iloc[:40]['HR'].tolist()
    # y_BT = tpr_df.iloc[:40]['BT(TA)'].tolist()
    # y_RR = tpr_df.iloc[:40]['RR'].tolist()
    # y_SBP = tpr_df.iloc[:40]['SBP1'].tolist()
    # y_DBP = tpr_df.iloc[:40]['DBP1'].tolist()

    x_data = tpr_df.index.tolist()
    y_HR = tpr_df['HR'].tolist()
    y_BT = tpr_df['BT(TA)'].tolist()
    y_RR = tpr_df['RR'].tolist()
    y_SBP = tpr_df['SBP1'].tolist()
    y_DBP = tpr_df['DBP1'].tolist()

    # print(tpr_df.index.apply(lambda x: datetime.datetime.strptime(x, "%Y%M%D %H%M%S")))
    # x_list = [datetime.datetime.fromtimestamp(x, "%Y%M%D %H%M%S") for x in tpr_df.index.tolist()]
    # print(type(x_data[0]))
    # print(x_list)

    # 生理圖表-line-1
    line = (
        Line()
        .add_xaxis(x_data)
        .add_yaxis(
            "HR",
            y_HR,
            is_connect_nones=True,
            label_opts=opts.LabelOpts(is_show=False),
            linestyle_opts=opts.LineStyleOpts(width=3),
            color="#675bba",
            xaxis_index=0,
            yaxis_index=0,
        )
        .add_yaxis(
            "BT",
            y_BT,
            is_connect_nones=True,
            label_opts=opts.LabelOpts(is_show=False),
            linestyle_opts=opts.LineStyleOpts(width=3),
            color="#d14a61",
            xaxis_index=0,
            yaxis_index=1,
        )

        .add_yaxis(
            "RR",
            y_RR,
            is_connect_nones=True,
            label_opts=opts.LabelOpts(is_show=False),
            linestyle_opts=opts.LineStyleOpts(width=3),
            # yaxis_index=1,
            color="#5793f3",
            xaxis_index=0,
            yaxis_index=2,
        )
        # y axis chart
        .extend_axis(
            yaxis=opts.AxisOpts(
                name="Body Temperature",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                type_="value",
                min_=0,
                max_=50,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#d14a61")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} ℃"), 
            )
        )
        # also y acxis
        .extend_axis(
            yaxis=opts.AxisOpts(
                name="Respiration Rate",
                name_location="middle",
                name_rotate=-90,
                name_gap="55",
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                offset=100,
                type_="value",
                min_=0,
                max_=40,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} bpm"), # breath per minute
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            )
        )
        # also y axis
        .set_global_opts(
            yaxis_opts=opts.AxisOpts(
                name="Heart Rate",
                name_location="middle",
                name_rotate=90,
                name_gap="55",
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                type_="value",
                min_=0,
                max_=150,
                position="left",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#5793f3")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} bpm"), # beats per minute
            ),
            toolbox_opts=opts.ToolboxOpts(
                is_show=True,
                orient="horizontal",
                pos_top="top",
            ),
            datazoom_opts=[
                opts.DataZoomOpts(
                    is_show=True,
                    is_realtime=True,
                    type_="inside",
                    xaxis_index=list(range(7)),
                ),
                opts.DataZoomOpts(
                    is_show=True,
                    is_realtime=True,
                    xaxis_index=list(range(7)),
                    pos_top="17.5%",
                ),
            ],
            tooltip_opts=opts.TooltipOpts(
                trigger="axis",
                axis_pointer_type="cross",
                background_color="white",
                border_width=1,
                textstyle_opts=opts.TextStyleOpts(
                    color="black"
                    ),
            ),
            title_opts=opts.TitleOpts(
                pos_top="0%",
                pos_left="10%",
                title=u"病患生理圖表",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),

                subtitle=u"    病人編號 : " + str(patient_id),
                subtitle_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Microsoft YaHei",
                )
            ),
        )
    )

    # 生理圖表bar-1
    bar_1 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "DBP",
            y_DBP,
            stack="stack1",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=1,
            yaxis_index=3,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 255, 255, 0.0)"],
            )
        )
        .add_yaxis(
            "SBP",
            y_SBP,
            stack="stack1",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=1,
            yaxis_index=3,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(41, 182, 246, 0.6)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=1),
            yaxis_opts=opts.AxisOpts(
                grid_index=1,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=400,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} mmHg"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Blood Pressure",
                pos_top="20.5%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="20.5%"),
        )
    )

    # 取得藥物使用資料
    return [line, bar_1]


def med_data_frame(patient_id):

    patient_id = 80000154

    med_df = pd.DataFrame(list(MedData.objects.filter(patient_id_id=patient_id).values()))
    
    med_df['medprs'] = med_df['medprs'].str.strip()

    # pivot table
    meds = med_df['medprs'].value_counts().index.tolist()

    med_df['exedt'] = med_df['exedt'].apply(lambda x: datetime.datetime.strptime(x, "%Y%m%d%H%M%S"))

    med_new_df = pd.pivot_table(med_df, index='exedt', columns='medprs', values='dose', aggfunc=np.sum)

    med_new_df.update(med_new_df[meds].fillna(0))

    # create a max value map
    max_dict = med_new_df.max().to_dict()

    for index in max_dict.keys():
        max_dict[index] = int(math.ceil(max_dict[index] / 10.0)) * 10  

    print(max_dict['NS5'])

    return med_new_df, max_dict


def get_drug_charts(patient_id, keys):


    med_df, max_dict = med_data_frame(patient_id)

    med_df.sort_values(by='exedt',ascending=True)


    x_data = med_df.index.tolist()

    drug_1 = med_df[keys[0][0]].tolist()
    drug_2 = med_df[keys[1][0]].tolist()
    drug_3 = med_df[keys[2][0]].tolist()
    drug_4 = med_df[keys[3][0]].tolist()
    drug_5 = med_df[keys[4][0]].tolist()

    # print("drug-2", drug_2)
    # print(y_HR)

    bar_drag_1 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            keys[0][0], # should change name
            drug_1,
            stack="stack2",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=2,
            yaxis_index=4,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=2),
            yaxis_opts=opts.AxisOpts(
                grid_index=2,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=max_dict[keys[0][0]],
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} " + keys[0][1]),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title=keys[0][0],
                pos_top="44%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="44%"),
        )
    )

    bar_drag_2 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            keys[1][0],
            drug_2,
            stack="stack3",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=3,
            yaxis_index=5,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=3),
            yaxis_opts=opts.AxisOpts(
                grid_index=3,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=max_dict[keys[1][0]],
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} " + keys[1][1]),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title=keys[1][0],
                pos_top="55.5%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="55.5%"),
        )
    )

    bar_drag_3 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            keys[2][0],
            drug_3,
            stack="stack4",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=4,
            yaxis_index=6,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=4),
            yaxis_opts=opts.AxisOpts(
                grid_index=4,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=max_dict[keys[2][0]],
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} " + keys[2][1]),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title=keys[2][0],
                pos_top="67%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="67%"),
        )
    )

    bar_drag_4 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            keys[3][0],
            drug_4,
            stack="stack5",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=5,
            yaxis_index=7,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=5),
            yaxis_opts=opts.AxisOpts(
                grid_index=5,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=max_dict[keys[3][0]],
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} " + keys[3][1]),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title=keys[3][0],
                pos_top="78.5%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="78.5%"),
        )
    )

    bar_drag_5 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            keys[4][0],
            drug_5,
            stack="stack6",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=6,
            yaxis_index=8,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=6),
            yaxis_opts=opts.AxisOpts(
                grid_index=6,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=max_dict[keys[4][0]],
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} " + keys[4][1]),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title=keys[4][0],
                pos_top="90%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="90%"),
        )
    )

    return [bar_drag_1, bar_drag_2, bar_drag_3, bar_drag_4, bar_drag_5]


def grid_multiple_charts(physical_charts_lst, drug_charts_lst):
    drug_top_pos = 45.5
    grid = Grid()
    grid.add(
        physical_charts_lst[0],
        grid_opts=opts.GridOpts(
            # pos_left="10.5%", # 5
            height="12%",
        ),
        is_control_axis_index=True,
    )
    grid.add(
        physical_charts_lst[1],
        grid_opts=opts.GridOpts(
            pos_top="22.5%",
            height="9%",
        ),
        is_control_axis_index=True,
    )
    for i in range(len(drug_charts_lst)):
        grid.add(
            drug_charts_lst[i],
            grid_opts=opts.GridOpts(
                pos_top=str(drug_top_pos + 11.5 * i) + "%",
                height="7.5%",
            ),
            is_control_axis_index=True,
        )
    grid_str = grid.dump_options_with_quotes()

    return grid_str


def chart_view(request):
    """
    @pony
    render the charts to json
    """

    patient_id = request.GET['patient_id']
    patient_id = 80000154

    keys, _ = get_all_drug(patient_id)


    return JsonResponse(json.loads(grid_multiple_charts(
        init_multiple_charts(patient_id),
        get_drug_charts(patient_id, keys),
    )))

    # grid_multiple_charts


def get_all_drug(patient_id):
    med_df = pd.DataFrame(list(MedData.objects.filter(patient_id_id=patient_id).values()))

    med_df['medprs'] = med_df['medprs'].str.strip()

    med_groups = med_df.groupby(['medprs', 'doseunit'])

    keys = list(med_groups.groups.keys())

    return keys, med_df['medprs'].value_counts().index.tolist()



# also working
def display_patient_detail_view(request, patient_id):
    """
    @pony
    render the patient detail page
    """
    patient_id = 80000154
    
    _, drugs = get_all_drug(patient_id)

    content = {
        "patient_id" : patient_id,
        "test": drugs # drug name
    }
    return render(request, "display_patient_detail/detail_page.html", content)


def ajax_get_patient_emr(request):
    """
    @pony
    get frontend click event data by ajax
    """
    flag = 0
    for i in request.POST.keys():
        if "[]" in i:
            flag = 1
    if flag == 1:
        y_data = request.POST['y_data[]']
    else:
        y_data = request.POST['y_data']

    x_data = request.POST['x_data']
    print("server get x : {}".format(x_data))
    print("server get y : {}".format(y_data))

    patient_id = request.POST["patient_id"]

    base_url = "http://127.0.0.1:8000/"
    re_url = base_url + "emr/" + patient_id + "/" + x_data + "/"
    
    return response_as_json(re_url)


def ajax_update_charts(request):
    patient_id = request.GET['patient_id']
    patient_id = 80000154
    # new_drugs = request.GET['new_drugs']
    new_drugs = ['NS5', 'POTPH', 'RADIK', 'VANCO', 'KEPPI']

    keys, _ = get_all_drug(patient_id)
    new_keys = []
    for key in keys:
        if key[0] in new_drugs:
            new_keys.append(key)
            print(key)

    physical_charts_lst = init_multiple_charts(patient_id)
    drug_charts_lst = get_drug_charts(patient_id, new_keys)

    return JsonResponse(json.loads(grid_multiple_charts(
        physical_charts_lst,
        drug_charts_lst,
    )))


# def get_update_drug_charts(patient_id):
    x_data = ["month {}".format(i) for i in range(1, 40)]
    data = list(range(10, 151))
    shuffle(data)
    y_HR = data[:40]
    y_BT = data[40:80]
    y_RR = data[80:120]
    bar_data = list(range(10, 101))
    shuffle(bar_data)
    y_SBP = bar_data[:40]
    y_DBP = bar_data[40:80]

    bar_drag_1 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "Drag-1",  # drug name
            y_SBP,     # data
            stack="stack2",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=2,
            yaxis_index=4,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=2),
            yaxis_opts=opts.AxisOpts(
                grid_index=2,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Drug-1",
                pos_top="44%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="44%"),
        )
    )

    bar_drag_2 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "Drag-2",
            y_SBP,
            stack="stack3",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=3,
            yaxis_index=5,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(0, 0, 0, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=3),
            yaxis_opts=opts.AxisOpts(
                grid_index=3,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Drug-2",
                pos_top="55.5%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="55.5%"),
        )
    )

    bar_drag_3 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "Drag-3",
            y_SBP,
            stack="stack4",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=4,
            yaxis_index=6,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(74, 211, 135, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=4),
            yaxis_opts=opts.AxisOpts(
                grid_index=4,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Drug-3",
                pos_top="67%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="67%"),
        )
    )

    bar_drag_4 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "Drag-4",
            y_SBP,
            stack="stack5",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=5,
            yaxis_index=7,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(211, 74, 81, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=5),
            yaxis_opts=opts.AxisOpts(
                grid_index=5,
                type_="value",
                name="",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Drug-4",
                pos_top="78.5%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="78.5%"),
        )
    )

    bar_drag_5 = (
        Bar()
        .add_xaxis(x_data)
        .add_yaxis(
            "Drag-5",
            y_SBP,
            stack="stack6",
            label_opts=opts.LabelOpts(is_show=False),
            xaxis_index=6,
            yaxis_index=8,
            itemstyle_opts=opts.ItemStyleOpts(
                color=["rgba(141, 230, 137, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=6),
            yaxis_opts=opts.AxisOpts(
                grid_index=6,
                type_="value",
                name="｀",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            ),
            title_opts=opts.TitleOpts(
                title="Drug-5",
                pos_top="90%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="90%"),
        )
    )

    return [bar_drag_1, bar_drag_2, bar_drag_3, bar_drag_4, bar_drag_5]
# def get_update_drug_charts(patient_id, new_keys):

    return get_drug_charts(patient_id, new_keys)
def ajax_save_memo(request, patient_id):
    content = request.GET['content']
    time = request.GET['time']

    print("{} : {},time : {}".format(patient_id, content, time))

    ret = {"flag": 1}

    return response_as_json(ret)