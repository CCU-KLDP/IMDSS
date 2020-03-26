from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.


def emr_view(request):
    """
    @pony
    disaply emr_page
    """
    content = {
        "test_label": range(10),
        "emr_table": get_emr_table(),
    }

    return render(request, "emr/emr_page.html", content)


def get_emr_table():
    """
    @pony
    get emr table from database(future)
    """

    # fake data
    emr_is_star = [0, 1, 0, 1, 0]
    emr_date = [20190101, 20190203, 20316053, 45230265, 12021547]
    emr_type = ["type1", "type1", "type2", "type3", "type2"]
    emr_dept = ["head", "body", "body", "leg", "leg"]
    emr_diagnosis = ["www", "wewe", "qweqw", "wqeqw", "iopyt"]
    emr_lst = []

    for i in range(len(emr_is_star)):
        emr_dict = {
            "star": emr_is_star[i],
            "date": emr_date[i],
            "type": emr_type[i],
            "dept": emr_dept[i],
            "diagnosis": emr_diagnosis[i]
        }
        emr_lst.append(emr_dict)

    return emr_lst


def get_dept_CUI(request):
    """
    @pony
    選擇科別的Select元素時，會列出該科別底下的所有CUI
    """
    dept_CUI_lst = {
        "dept": ["dept_1", "dept_2", "dept_3"],
        "dept_1": ["dept-1-CUI" + str(x) for x in range(10)],
        "dept_2": ["dept-2-CUI" + str(x) for x in range(5)],
        "dept_3": ["dept-3-CUI" + str(x) for x in range(2)],
    }
    return JsonResponse(dept_CUI_lst)


def get_table_CUI(request):
    """
    @pony
    選擇評估表的Select元素時，會列出該評估表底下的所有CUI
    """
    table_CUI_lst = {
        "table": ["table_1", "table_2", "table_3"],
        "table_1": ["table-1-CUI" + str(x) for x in range(5)],
        "table_2": ["table-2-CUI" + str(x) for x in range(3)],
        "table_3": ["table-3-CUI" + str(x) for x in range(7)],
    }
    return JsonResponse(table_CUI_lst)
