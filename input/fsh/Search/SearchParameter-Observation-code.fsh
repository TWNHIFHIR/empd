Instance: Observation-code
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Observation-code"
* version = "0.1.0"
* name = "SearchParameterObservationcode"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "檢驗檢查的項目(code)"
* code = #code
* base = #Observation
* type = #token
* expression = "Observation.code"