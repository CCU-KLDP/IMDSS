from django.shortcuts import render
from django.http import JsonResponse
import random
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
    emr_is_star = [0, 1, 0, 1, 0, 1]
    emr_id = [1, 2, 3, 4, 5, 6]
    emr_date = [20190101, 20190203, 20316053, 45230265, 12021547, 20326598]
    emr_type = ["type1", "type1", "type2", "type3", "type2", "type3"]
    emr_dept = ["head", "body", "body", "leg", "leg", "wqe"]
    emr_diagnosis = ["www", "wewe", "qweqw", "wqeqw", "iopyt", "weqqw"]
    emr_lst = []

    for i in range(len(emr_is_star)):
        emr_dict = {
            "star": emr_is_star[i],
            "id": emr_id[i],
            "date": emr_date[i],
            "type": emr_type[i],
            "dept": emr_dept[i],
            "diagnosis": emr_diagnosis[i]
        }
        emr_lst.append(emr_dict)

    return emr_lst


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


def get_dept_lst():
    """
    @pony
    @return list
    從資料庫獲得所有部門(科別)
    """
    return ["dept_1", "dept_2", "dept_3", "dept_4", "dept_5"]


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
    id = request.GET['selected_emr_id']
    string = "Server get id : "+id
    print(string)
    
    return JsonResponse(string, safe=False)
