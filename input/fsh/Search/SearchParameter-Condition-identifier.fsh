Instance: Condition-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Condition-identifier"
* version = "0.1.0"
* name = "SearchParameterConditionidentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病情、問題或診斷的唯一識別碼(identifier)"
* code = #identifier
* base = #Condition
* type = #token
* expression = "Condition.identifier"