Instance: Patient-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Patient-id"
* version = "0.1.0"
* name = "SearchParameterPatientid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病人的邏輯性id"
* code = #_id
* base = #Patient
* type = #token
* expression = "Patient.id"