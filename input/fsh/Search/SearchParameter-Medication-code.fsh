Instance: Medication-code
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Medication-code"
* version = "0.1.0"
* name = "SearchParameterMedicationcode"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品的代碼(code)"
* code = #code
* base = #Medication
* type = #token
* expression = "Medication.code"