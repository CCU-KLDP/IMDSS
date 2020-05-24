from django.shortcuts   import render
from django.http        import JsonResponse
from db_models.models   import Department, Doctor, Xsl_data
from emr.models         import EmrData, HospitalizedData
from lxml               import etree

import pandas           as pd
import numpy            as np
import datetime
import lxml

# Create your views here.


def display_emr_view(request, patient_id, date):
    content = {

    }
    return render(request, "display_emr/emr_page.html", content)

# def find_closest_datetime(datetime_list, date):
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
    }.get(selected_emr_type, "admission_note") # You are wrong is default if x not found


def ajax_get_xml(request, patient_id, date):


    # selected_emr_id = 'WA1_1081004143855'
    # selected_emr_type = 'admission_note'
    patient_id = 80000154
    # use hospitalized_data to compare time and then display emr

    # out_df = pd.DataFrame(list(OutpatientData.objects.filter(patient_id_id=patient_id).values()))
    emr_df = pd.DataFrame(list(HospitalizedData.objects.filter(patient_id_id=patient_id).values()))

    emr_df['time'] = emr_df['time'].apply(lambda x: datetime.datetime.strptime(x, "%Y%m%d %H:%M"))
    # emr_df['time'] = pd.to_datetime(emr_df['time'])
    date = datetime.datetime.strptime(date, "%Y-%m-%dT%H:%M:%S")

    date_list = np.asarray(emr_df['time'].to_list())
    closest_index = (np.abs(date_list - date)).argmin()

    selected_emr_id = emr_df.iloc[closest_index]['emrid_id']
    selected_emr_type = xsl_case_return(emr_df.iloc[closest_index]['type'])

    xml_df = pd.DataFrame(list(EmrData.objects.filter(emrid=selected_emr_id).values()))
    xsl_df = pd.DataFrame(list(Xsl_data.objects.filter(XslId=selected_emr_type).values()))

    xml = lxml.etree.fromstring(xml_df['emrcontent'].str.cat(sep=''))
    # transform = lxml.etree.XSLT(etree.parse("/Users/kylehuang/DOING-PROJECTS/IMDSS-Project/IMDSS/xml_resource/Progress_note.xsl"))
    transform = lxml.etree.XSLT(etree.fromstring(xsl_df['XslContent'].str.cat(sep='')))

    
    html = transform(xml)
    
    content = {u"insert_html": str(html)}

    return JsonResponse(content)