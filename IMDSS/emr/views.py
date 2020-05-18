from django.shortcuts   import render
from django.http        import JsonResponse
from django.http        import HttpResponse
from db_models.models   import Department
from emr.models         import TestEmr
from lxml               import etree

import random
import pandas as pd
import lxml

import json
# Create your views here.


def response_as_json(data):
    json_str = json.dumps(data)
    response = HttpResponse(
        json_str,
        content_type="application/json",
    )
    response["Access-Control-Allow-Origin"] = "*"
    return response


def emr_view(request, patient_id):
    """
    @pony
    disaply emr_page

    @Kyle
    how to know which patient_id, 
    2 ways: 1. passing data, 2. create global variable
    """
    fixed_patient_id = '80001'

    content = {
        "emr_table": get_emr_table(fixed_patient_id),
        "dept_lst": get_dept_lst(),
        "patient_id":patient_id
    }

    return render(request, "emr/emr_page.html", content)


def get_emr_table(patient_id):
    """
    @pony
    get emr table from database(future)
    @kyle
    return date, type, dept, content(emr)
    """

    emr_df = pd.DataFrame(list(TestEmr.objects.filter(patient_id=patient_id).values()))
    # print(emr_df.columns)
    emr_groups = emr_df.groupby(['chartno', 'notetype', 'datetime'])
    keys = list(emr_groups.groups.keys())
    emr_lst = []

    for key in keys:
        emr = emr_groups.get_group(key)
        emr_dict = {
            "date": emr.iloc[0]['datetime'],
            "type": emr.iloc[0]['notetype'],
            "dept": 'secret',
            "doctor":'pony',
        }
        emr_lst.append(emr_dict)

    return emr_lst

"""
emr content dict

"date": emr.iloc[0]['datetime'],
"type": emr.iloc[0]['notetype'],
"dept": 'secret',
"content": emr.iloc[:]['content'].str.strip()
"""





def get_dept_lst():
    """
    @pony
    @return list
    從資料庫獲得所有部門(科別)
    """
    return list(Department.objects.all())



def get_dept_table(dept_table_dict):
    """
    @pony
    @return dict
    建立所有dept底下的所有table(之後請改從資料庫撈)
    以dept為key(dept_1 ...)
    獲得dept底下的所有table, [table_1, table_2, ...]
    """
    dep_name_list = dept_table_dict['dept']

    for dep_name in dep_name_list: 
        dep = Department.objects.get(dep_name=dep_name)
        evaluation_list = list(dep.dep_evaluation.all().values())
        dep_df = pd.DataFrame(evaluation_list)
        # print(dep_df)
        if dep_df.empty:
            dept_table_dict[dep.dep_name] = ['None', ]
        else:
            dept_table_dict[dep.dep_name] = dep_df['name'].value_counts().index.tolist()
        # print(dept_table_dict)
    # print(dept_table_dict[dept])

    # return dept_table_dict[dept]
    return dept_table_dict

def get_table_item(dep_name, selected_table):

    table_item_list = []

    dep = Department.objects.get(dep_name=dep_name)
    evaluation_list = list(dep.dep_evaluation.all().values())

    dep_df = pd.DataFrame(evaluation_list)

    table_groups = dep_df.groupby('name')

    table_item_list = table_groups.get_group(selected_table).iloc[:]['medical_condition'].tolist()

    print(table_item_list)


    return table_item_list

# def get_table_lst():
#     """
#     @pony
#     @return list
#     建立評估表(table)
#     """
#     table_lst = ["table_" + str(x) for x in range(10)]
#     return table_lst


def ajax_get_dept_table(request):
    """
    @pony
    @return Json object
    選擇dept的Select元素時，會在旁邊的table Select內列出該dept下的所有table
    """
    dep_lst = [dep.dep_name for dep in get_dept_lst()]
    # print(dep_lst)
    dept_table_dict = {
        "dept": dep_lst,
    }

    dept_table_lst = get_dept_table(dept_table_dict)

    return JsonResponse(dept_table_dict)


def ajax_get_table_item(request):
    """
    @pony
    @return list
    建立items，並隨機丟給table
    從前端接的table select接收使用者選擇的table，並回傳對應table的items
    """
    # selected_dep = request.GET['selected_dep']
    selected_table = request.GET['selected_table']
    selected_dept = request.GET['selected_dept']
    print(selected_dept)


    table_item_list = get_table_item(selected_dept, selected_table)

    
    return JsonResponse(table_item_list, safe=False)


def ajax_get_emr(request, patient_id):
    """
    @pony
    獲取select-emr-table所選擇的病歷id
    """
    selected_emr_type = request.GET["selected_emr_type"]
    print(selected_emr_type)


    if int(request.GET['selected_emr_id'].split("-")[2][:2]) < 17 : 
        xml = lxml.etree.parse("D:/VScode workshop/IMDSS-Project/IMDSS/static/xml/WA2_1081004143938.xml")
    else : 
        xml = lxml.etree.parse("D:/VScode workshop/IMDSS-Project/IMDSS/static/xml/WA2_1081004143941.xml")
    
    transform = lxml.etree.XSLT(etree.parse("D:/VScode workshop/IMDSS-Project/IMDSS/static/xslt/Progress_note.xsl"))
    html = transform(xml)

    content = {u"insert_html": str(html)}

    return JsonResponse(content)

def ajax_get_search_emr(request):
    """
    @pony
    搜尋需要標記的emr(by search text)
    @return list，表示要標記的emr是第幾個(從0開始)
    """
    input_text = request.GET['input_text']
    highlight = [1, 3]
    print(input_text)

    return JsonResponse(highlight, safe=False)


def ajax_save_memo(request, patient_id):
    content = request.GET['content']
    time = request.GET['time']

    print("{} : {},time : {}".format(patient_id, content, time))

    ret = {"flag": 1}

    return response_as_json(ret)
