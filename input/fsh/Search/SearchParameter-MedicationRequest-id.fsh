Instance: MedicationRequest-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/MedicationRequest-id"
* name = "SearchParameterMedicationRequestid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品處方的邏輯性id"
* code = #_id
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.id"