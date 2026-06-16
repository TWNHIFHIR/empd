Instance: Condition-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Condition-id"
* version = "0.1.0"
* name = "SearchParameterConditionid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病情、問題或診斷之邏輯性id"
* code = #_id
* base = #Condition
* type = #token
* expression = "Condition.id"