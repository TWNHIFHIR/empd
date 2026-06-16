Instance: Patient-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Patient-identifier"
* version = "0.1.0"
* name = "SearchParameterPatientidentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病人的身份識別碼(identifier)"
* code = #identifier
* base = #Patient
* type = #token
* expression = "Patient.identifier"