Instance: Encounter-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Encounter-id"
* name = "SearchParameterEncounterid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "就醫事件的邏輯性id"
* code = #_id
* base = #Encounter
* type = #token
* expression = "Encounter.id"