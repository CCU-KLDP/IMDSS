from django.shortcuts   import render
from django.http        import JsonResponse
from django.http        import HttpResponse
from db_models.models   import Department, Doctor, Xsl_data
from emr.models         import EmrData, HospitalizedData
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
    fixed_patient_id = '80000154'

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

    emr_df = pd.DataFrame(list(HospitalizedData.objects.filter(patient_id_id=patient_id).values()))
    print(emr_df.columns)

    # keys = list(emr_groups.groups.keys())
    emr_lst = []
    print(emr_df)

    for index, row in emr_df.iterrows():
        # print(row['time'])
        doctor = Doctor.objects.get(doctor_id=row['doctor_id_id'])
        emr_dict = {
            "date": row['time'],
            "type": row['type'],
            "dept": Department.objects.get(dep_id=row['dep_id_id']),
            "doctor": doctor.first_name + " " + doctor.last_name,
            "id": row['emrid_id'],
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

    dept = Department.objects.get(dep_name=dep_name)
    evaluation_list = list(dept.dep_evaluation.all().values())

    dept_df = pd.DataFrame(evaluation_list)

    if dept_df.empty:
        table_item_list = ['None', ]

    else:
        table_groups = dept_df.groupby('name')

        table_item_list = table_groups.get_group(selected_table).iloc[:]['medical_condition'].tolist()

    print(table_item_list)


    return table_item_list


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


    table_item_list = get_table_item(selected_dept, selected_table)

    
    return JsonResponse(table_item_list, safe=False)


# also working
def ajax_get_emr(request, patient_id):
    """
    @pony
    獲取select-emr-table所選擇的病歷id
    """
    selected_emr_id = request.GET['selected_emr_id']
    selected_emr_type = request.GET["selected_emr_type"].replace(' ', '_').lower()

    # print(selected_emr_type)
    xml_df = pd.DataFrame(list(EmrData.objects.filter(emrid=selected_emr_id).values()))
    xsl_df = pd.DataFrame(list(Xsl_data.objects.filter(XslId=selected_emr_type).values()))
    # print(xml_df)
    # print(xml_df['emrcontent'].str.cat(sep=''))
    # xml = lxml.etree.parse("/Users/kylehuang/DOING-PROJECTS/IMDSS-Project/IMDSS/xml_resource/WA2_1081004143938.xml")
    xml = lxml.etree.fromstring(xml_df['emrcontent'].str.cat(sep=''))
    # transform = lxml.etree.XSLT(etree.parse("/Users/kylehuang/DOING-PROJECTS/IMDSS-Project/IMDSS/xml_resource/Progress_note.xsl"))
    transform = lxml.etree.XSLT(etree.fromstring(xsl_df['XslContent'].str.cat(sep='')))
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
