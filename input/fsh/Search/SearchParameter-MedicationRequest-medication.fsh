Instance: MedicationRequest-medication
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/MedicationRequest-medication"
* version = "0.1.0"
* name = "SearchParameterMedicationRequestmedication"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品處方的藥品(medication)"
* code = #medication
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.medication"