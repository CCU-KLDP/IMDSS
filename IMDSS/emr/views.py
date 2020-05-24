from django.shortcuts   import render
from django.http        import JsonResponse
from django.http        import HttpResponse
from db_models.models   import Department, Doctor, Xsl_data
from emr.models         import EmrData, HospitalizedData ,OutpatientData, EmrCuiWord
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
    out_df = pd.DataFrame(list(OutpatientData.objects.filter(patient_id_id=patient_id).values()))
    emr_df = pd.DataFrame(list(HospitalizedData.objects.filter(patient_id_id=patient_id).values()))
    # print(emr_df.columns)
    cat_df = pd.concat([out_df, emr_df], axis=0)
    # print(cat_df)
    # keys = list(emr_groups.groups.keys())
    emr_lst = []
    # print(emr_df)

    for index, row in cat_df.iterrows():
        # print(row['time'])
        doctor = Doctor.objects.get(doctor_id=row['doctor_id_id'])
        emr_dict = {
            "date": row['time'],
            "type": row['type'],
            "dept": Department.objects.get(dep_id=row['dep_id_id']),
            "doctor": doctor.first_name + " " + doctor.last_name,
            "id": row['emrid_id'],
        }
        # print(emr_dict)
        emr_lst.append(emr_dict)


    return emr_lst


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

    # print(table_item_list)


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

# also working
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


def xsl_case_return(selected_emr_type):
    return {
        "Emergency": "opd_style",
        "Outpatient": "opd_style",
        "Hospitalized Consultation": "consult_ipd",
        "Emergency Consultation": "consult_er",
        "Leave Note": "discharge_style",
        "Admission Note": "admission_note",
        "Progress Note": "Progress_note",
        "Problem List": "ProblemList",
        "Special note": "Special_Note",
    }.get(selected_emr_type, "You are wrong!") # You are wrong is default if x not found

# also working
def ajax_get_emr(request, patient_id):
    """
    @pony
    獲取select-emr-table所選擇的病歷id
    """
    selected_emr_id = request.GET['selected_emr_id']
    selected_emr_type = xsl_case_return(request.GET["selected_emr_type"])

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
    # print(input_text)s

    return JsonResponse(highlight, safe=False)


def ajax_save_memo(request, patient_id):
    content = request.GET['content']
    time = request.GET['time']

    # print("{} : {},time : {}".format(patient_id, content, time))s

    ret = {"flag": 1}

    return response_as_json(ret)


def ajax_get_mark(request):

    selected_dept = request.GET['selected_dept']
    selected_table = request.GET['selected_table']
    selected_item_lst = request.GET['items'].split("***seperator***")

    dept = Department.objects.get(dep_name=selected_dept)

    selected_cui_lst = []

    for selected_item in selected_item_lst:
        evaluation = dept.dep_evaluation.filter(medical_condition=selected_item)

        if evaluation:
            evaluation_list = evaluation.first().cuis_list.split(", ")
            selected_cui_lst = selected_cui_lst + evaluation_list

    selected_cui_lst = list(set(selected_cui_lst))

    emr_cui_df = pd.DataFrame(list(EmrCuiWord.objects.all().values()))


    # 1: groupby Emr_id
    emr_cui_groups = emr_cui_df.groupby('emrid')

    # 2: get groups key
    keys = list(emr_cui_groups.groups.keys())

    matched_cui_dict = {}

    # 3: for key in keys: get groups for loop compare cui and return match list which store in dict[key]
    for key in keys:
        matched_lst = []
        for index, row in emr_cui_groups.get_group(key).iterrows():
            if row['cui'] in selected_cui_lst:
                matched_lst.append(row['wordlist'].split('(')[0].split('[')[0])
        if matched_lst:
            if key in matched_cui_dict:     
                matched_cui_dict[key] = list(set(matched_cui_dict[key] + matched_lst))
            else:
                matched_cui_dict[key] = list(set(matched_lst))


    




    # return
    print(matched_cui_dict)


    # item_lst = itmes.split("***seperator***")
    # itme_lst.pop()

    return response_as_json(matched_cui_dict)
