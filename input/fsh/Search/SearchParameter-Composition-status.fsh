Instance: Composition-status
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Composition-status"
* name = "SearchParameterCompositionstatus"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "報告文件的狀態(status)"
* code = #status
* base = #Composition
* type = #token
* expression = "Composition.status"