Instance: MedicationRequest-intent
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/MedicationRequest-intent"
* version = "0.1.0"
* name = "SearchParameterMedicationRequestintent"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品處方的意圖(intent)"
* code = #intent
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.intent"