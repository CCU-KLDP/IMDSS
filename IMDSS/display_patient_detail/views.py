import json
from django.shortcuts import render
from random import shuffle
from pyecharts.charts import Line, Bar, Grid
from pyecharts import options as opts
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse

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


def init_multiple_charts(patient_id) -> Grid:
    """
    @pony
    @return grid(json like object)
    @param list 所有type的資料都用list給(日期、生理資料、藥物使用)，每一個index要對好，缺的index用null塞
    """

    # fake data
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
        .extend_axis(
            yaxis=opts.AxisOpts(
                name="Temperature",
                name_location="middle",
                name_rotate=-90,
                name_gap=55,
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                type_="value",
                min_=0,
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#d14a61")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} ml"),
            )
        )
        .extend_axis(
            yaxis=opts.AxisOpts(
                name="other",
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
                max_=250,
                position="right",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#675bba")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} °C"),
                splitline_opts=opts.SplitLineOpts(
                    is_show=True, linestyle_opts=opts.LineStyleOpts(opacity=1)
                ),
            )
        )
        .set_global_opts(
            yaxis_opts=opts.AxisOpts(
                name="some pointer",
                name_location="middle",
                name_rotate=90,
                name_gap="55",
                name_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Courier New",
                ),
                type_="value",
                min_=0,
                max_=250,
                position="left",
                axisline_opts=opts.AxisLineOpts(
                    linestyle_opts=opts.LineStyleOpts(color="#5793f3")
                ),
                axislabel_opts=opts.LabelOpts(formatter="{value} ml"),
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
                name="other",
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
                title="血壓",
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


def get_drug_charts(patient_id):
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
            "Drag-1",
            y_SBP,
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
                name="other",
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
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=3),
            yaxis_opts=opts.AxisOpts(
                grid_index=3,
                type_="value",
                name="other",
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
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=4),
            yaxis_opts=opts.AxisOpts(
                grid_index=4,
                type_="value",
                name="other",
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
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=5),
            yaxis_opts=opts.AxisOpts(
                grid_index=5,
                type_="value",
                name="other",
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
                color=["rgba(255, 204, 188, 1)"],
            )
        )
        .set_global_opts(
            xaxis_opts=opts.AxisOpts(grid_index=6),
            yaxis_opts=opts.AxisOpts(
                grid_index=6,
                type_="value",
                name="other",
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

    #print(json.loads(
    #    grid_multiple_charts(init_multiple_charts(patient_id))
    #))
    return JsonResponse(json.loads(grid_multiple_charts(
        init_multiple_charts(patient_id),
        get_drug_charts(patient_id),
    )))

    # grid_multiple_charts


def display_patient_detail_view(request, patient_id):
    """
    @pony
    render the patient detail page
    """
    content = {
        "patient_id" : patient_id,
        "test": list(range(21))
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

    physical_charts_lst = init_multiple_charts(patient_id)
    drug_charts_lst = get_update_drug_charts(patient_id)

    return JsonResponse(json.loads(grid_multiple_charts(
        physical_charts_lst,
        drug_charts_lst,
    )))


def get_update_drug_charts(patient_id):
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
            "Drag-1",
            y_SBP,
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
                name="other",
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
                name="other",
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
                name="other",
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
                name="other",
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
                name="other",
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