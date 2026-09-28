Instance: Practitioner-name
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Practitioner-name"
* name = "SearchParameterPractitionername"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "醫事人員的姓名(name)"
* code = #name
* base = #Practitioner
* type = #string
* expression = "Practitioner.name"