Instance: Encounter-status
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Encounter-status"
* name = "SearchParameterEncounterstatus"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "就醫事件的狀態(status)"
* code = #status
* base = #Encounter
* type = #token
* expression = "Encounter.status"