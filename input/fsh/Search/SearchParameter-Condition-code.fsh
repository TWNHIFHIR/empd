Instance: Condition-code
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Condition-code"
* version = "0.1.0"
* name = "SearchParameterConditioncode"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病情、問題或診斷的分類代碼(code)"
* code = #code
* base = #Condition
* type = #token
* expression = "Condition.code"