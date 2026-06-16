Instance: Observation-status
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Observation-status"
* version = "0.1.0"
* name = "SearchParameterObservationstatus"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "檢驗檢查的狀態(status)"
* code = #status
* base = #Observation
* type = #token
* expression = "Observation.status"