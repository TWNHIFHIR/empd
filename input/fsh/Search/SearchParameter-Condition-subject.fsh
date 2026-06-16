Instance: Condition-subject
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Condition-subject"
* version = "0.1.0"
* name = "SearchParameterConditionsubject"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "有關此病情、問題或診斷的病人(subject)"
* code = #subject
* base = #Condition
* type = #reference
* expression = "Condition.subject"