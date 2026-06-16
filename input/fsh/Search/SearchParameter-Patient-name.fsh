Instance: Patient-name
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Patient-name"
* version = "0.1.0"
* name = "SearchParameterPatientname"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病人的姓名(name)"
* code = #name
* base = #Patient
* type = #string
* expression = "Patient.name"