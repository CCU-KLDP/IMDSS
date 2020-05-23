from django.shortcuts   import render
from django.http        import JsonResponse
from db_models.models   import Department, Doctor, Xsl_data
from emr.models         import EmrData, HospitalizedData
from lxml               import etree

import pandas           as pd
import lxml

# Create your views here.


def display_emr_view(request, patient_id, date):
    content = {

    }
    return render(request, "display_emr/emr_page.html", content)


def ajax_get_xml(request, patient_id, date):


    selected_emr_id = 'WA1_1081004143855'
    selected_emr_type = 'admission_note'

    # print(selected_emr_type)
    # use hospitalized_data to compare time and then display emr
    
    xml_df = pd.DataFrame(list(EmrData.objects.filter(emrid=selected_emr_id).values()))
    xsl_df = pd.DataFrame(list(Xsl_data.objects.filter(XslId=selected_emr_type).values()))

    print(xsl_df)
    xml = lxml.etree.fromstring(xml_df['emrcontent'].str.cat(sep=''))
    # transform = lxml.etree.XSLT(etree.parse("/Users/kylehuang/DOING-PROJECTS/IMDSS-Project/IMDSS/xml_resource/Progress_note.xsl"))
    transform = lxml.etree.XSLT(etree.fromstring(xsl_df['XslContent'].str.cat(sep='')))

    
    html = transform(xml)
    
    content = {u"insert_html": str(html)}

    return JsonResponse(content)