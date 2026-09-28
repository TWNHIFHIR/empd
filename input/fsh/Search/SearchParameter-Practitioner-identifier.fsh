Instance: Practitioner-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Practitioner-identifier"
* name = "SearchParameterPractitioneridentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "醫事人員的識別碼(identifier)"
* code = #identifier
* base = #Practitioner
* type = #token
* expression = "Practitioner.identifier"