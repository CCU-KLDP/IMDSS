import json
from django.shortcuts import render
from random import shuffle
from pyecharts.charts import Line, Bar, Grid
from pyecharts import options as opts
from django.http import HttpResponse

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


def grid_multiple_charts() -> Grid:
    """
    @pony
    @return grid(json like object)
    @param dict，key為日期、生理特徵種類、藥物種類等，value使用list將每個資料存起來
    """
    x_data = ["{}月".format(i) for i in range(1, 40)]
    data = list(range(10, 151))
    shuffle(data)
    y_HR = data[:40]
    y_BT = data[40:80]
    y_RR = data[80:120]
    bar_data = list(range(10, 101))
    shuffle(bar_data)
    y_SBP = bar_data[:40]
    y_DBP = bar_data[40:80]

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
                    xaxis_index=[0, 1, 2],
                ),
                opts.DataZoomOpts(
                    is_show=True,
                    is_realtime=True,
                    xaxis_index=[0, 1, 2],
                    pos_top="20%",
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

                subtitle=u"    病人編號213273490",
                subtitle_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_family="Microsoft YaHei",
                )
            ),
        )
    )
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
                title="SBP-DBP",
                pos_top="24%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="24%"),
        )
    )

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
                title="Drag-1",
                pos_top="41%",
                pos_left="10%",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=25,
                    font_family="Microsoft YaHei",
                ),
            ),
            legend_opts=opts.LegendOpts(pos_top="41%"),
        )
    )

    grid = (
        Grid()
        .add(
            line,
            grid_opts=opts.GridOpts(
                # pos_left="10.5%", # 5
                height="15%",
            ),
            is_control_axis_index=True,
        )
        .add(
            bar_1,
            grid_opts=opts.GridOpts(
                pos_top="26%",
                height="10%",
            ),
            is_control_axis_index=True,
        )
        .add(
            bar_drag_1,
            grid_opts=opts.GridOpts(
                pos_top="43%",
                height="8%",
            ),
            is_control_axis_index=True,
        )
        .dump_options_with_quotes()
    )
    return grid


def chart_view(request):
    """
    @pony
    render the charts to json
    """
    return JsonResponse(json.loads(grid_multiple_charts()))
    # grid_multiple_charts


def display_patient_detail_view(request):
    """
    @pony
    render the patient detail page
    """
    content = {

    }
    return render(request, "display_patient_detail/detail_page.html", content)