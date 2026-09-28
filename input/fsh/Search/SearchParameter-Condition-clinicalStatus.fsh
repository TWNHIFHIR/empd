Instance: Condition-clinicalStatus
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Condition-clinicalStatus"
* name = "SearchParameterConditionclinicalStatus"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病情、問題或診斷的臨床狀態(clinicalStatus)"
* code = #clinicalStatus
* base = #Condition
* type = #token
* expression = "Condition.clinicalStatus"