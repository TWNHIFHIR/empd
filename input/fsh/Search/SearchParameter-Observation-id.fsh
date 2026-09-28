Instance: Observation-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Observation-id"
* name = "SearchParameterObservationid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "檢驗檢查的邏輯性id"
* code = #_id
* base = #Observation
* type = #token
* expression = "Observation.id"