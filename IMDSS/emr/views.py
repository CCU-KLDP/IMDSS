from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.


def emr_view(request):
    """
    @pony
    disaply emr_page
    """
    content = {
        "emr_table": get_emr_table(),
        "dept_lst": get_dept_lst(),
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


def get_dept_table(request):
    """
    @pony
    選擇科別的Select元素時，會在旁邊的table Select內列出該dept下的所有table
    """
    dept_CUI_lst = {
        "dept": get_dept_lst(),
    }

    for i in get_dept_lst():
        dept_CUI_lst[i] = get_table_lst(i)

    return JsonResponse(dept_CUI_lst)


def get_dept_lst():
    """
    @pony
    從資料庫獲得所有部門(科別)
    """
    return ["dept_1", "dept_2", "dept_3", "dept_4", "dept_5"]


def get_table_lst(dept):
    table_lst = ["table_" + str(x) for x in range(10)]
    table_dict = {
        "dept_1": [table_lst[0], table_lst[1], table_lst[2]],
        "dept_2": [table_lst[0], table_lst[2], table_lst[4]],
        "dept_3": [table_lst[4], table_lst[6], table_lst[9]],
        "dept_4": [table_lst[6], table_lst[7], table_lst[8]],
        "dept_5": [table_lst[3], table_lst[5], table_lst[9]],
    }
    return table_dict[dept]


def get_table_item(request):
    item_lst = ["CUI_" + str(x) for x in range(30)]

