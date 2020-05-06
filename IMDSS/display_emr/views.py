from django.shortcuts import render
from django.http import JsonResponse
from db_models.models import Department
from emr.models import TestEmr
import pandas as pd
import lxml
from lxml import etree
# Create your views here.


def display_emr_view(request, date):
    xml = lxml.etree.parse("D:/VScode workshop/IMDSS-Project/IMDSS/static/xml/WA2_1081004143938.xml")
    transform = lxml.etree.XSLT(etree.parse("D:/VScode workshop/IMDSS-Project/IMDSS/static/xslt/Progress_note.xsl"))
    
    html = transform(xml)
    print(html)
    content = {}
    return render(request, "display_emr/emr_page.html", content)