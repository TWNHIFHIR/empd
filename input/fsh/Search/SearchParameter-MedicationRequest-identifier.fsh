Instance: MedicationRequest-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/MedicationRequest-identifier"
* version = "0.1.0"
* name = "SearchParameterMedicationRequestidentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "藥品處方的識別碼(identifier)"
* code = #identifier
* base = #MedicationRequest
* type = #token
* expression = "MedicationRequest.identifier"