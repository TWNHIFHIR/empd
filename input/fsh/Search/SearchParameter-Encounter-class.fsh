Instance: Encounter-class
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Encounter-class"
* version = "0.1.0"
* name = "SearchParameterEncounterclass"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "就醫事件的類別(class)"
* code = #class
* base = #Encounter
* type = #token
* expression = "Encounter.class"