Instance: Observation-performer
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Observation-performer"
* version = "0.1.0"
* name = "SearchParameterObservationperformer"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "執行檢驗檢查的人員(performer)"
* code = #performer
* base = #Observation
* type = #reference
* expression = "Observation.performer"