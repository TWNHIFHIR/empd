Instance: Composition-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Composition-id"
* version = "0.1.0"
* name = "SearchParameterCompositionid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "報告文件的邏輯性id"
* code = #_id
* base = #Composition
* type = #token
* expression = "Composition.id"