Instance: Patient-gender
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Patient-gender"
* version = "0.1.0"
* name = "SearchParameterPatientgender"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病人的性別(gender)"
* code = #gender
* base = #Patient
* type = #token
* expression = "Patient.gender"