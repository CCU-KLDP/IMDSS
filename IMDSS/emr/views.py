from django.shortcuts import render
from django.http import JsonResponse
from db_models.models import Department
from emr.models import TestEmr
import random
import pandas as pd
# Create your views here.


def emr_view(request, patient_id):
    """
    @pony
    disaply emr_page

    @Kyle
    how to know which patient_id, 
    2 ways: 1. passing data, 2. create global variable
    """
    patient_id = '80001'

    content = {
        "emr_table": get_emr_table(patient_id),
        "dept_lst": get_dept_lst(),
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
            "content": emr.iloc[:]['content'].str.strip()
        }
        emr_lst.append(emr_dict)

    return emr_lst


def get_dept_lst():
    """
    @pony
    @return list
    從資料庫獲得所有部門(科別)
    @kyle
    """
    return list(Department.objects.all())


def get_dept_table(dept):
    """
    @pony
    @return dict
    建立所有dept底下的所有table(之後請改從資料庫撈)
    以dept為key(dept_1 ...)
    獲得dept底下的所有table, [table_1, table_2, ...]
    """
    table_lst = get_table_lst()
    counter_lst = range(1, 11)
    dept_lst = get_dept_lst()
    dept_table_dict = {}
    for i in dept_lst:
        dept_table_dict[i] = list(random.sample(table_lst, k=random.choice(counter_lst)))
    return dept_table_dict[dept]


def get_table_lst():
    """
    @pony
    @return list
    建立評估表(table)
    """
    table_lst = ["table_" + str(x) for x in range(10)]
    return table_lst

def ajax_get_dept_table(request):
    """
    @pony
    @return Json object
    選擇dept的Select元素時，會在旁邊的table Select內列出該dept下的所有table
    """
    dept_table_lst = {
        "dept": get_dept_lst(),
    }

    for i in get_dept_lst():
        dept_table_lst[i] = get_dept_table(i)

    return JsonResponse(dept_table_lst)



def ajax_get_table_item(request):
    """
    @pony
    @return list
    建立items，並隨機丟給table
    從前端接的table select接收使用者選擇的table，並回傳對應table的items
    """
    table_lst = get_table_lst()
    item_lst = ["item_" + str(x) for x in range(30)]
    counter_lst = range(1, 11)
    table_item_dict = {}

    for i in table_lst:
        table_item_dict[i] = list(random.sample(item_lst, k=random.choice(counter_lst)))

    selected_table = request.GET['selected_table']
    
    return JsonResponse(table_item_dict[selected_table], safe=False)


def ajax_get_emr(request):
    """
    @pony
    獲取select-emr-table所選擇的病歷id
    """
    id = request.GET['selected_emr_id']
    string = "Server get id : "+id
    print(string)
    
<<<<<<< HEAD
    return JsonResponse(string, safe=False)

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
=======
    return JsonResponse(string, safe=False)
>>>>>>> assemble
