Instance: Medication-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Medication-id"
* version = "0.1.0"
* name = "SearchParameterMedicationid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品的邏輯性id"
* code = #_id
* base = #Medication
* type = #token
* expression = "Medication.id"