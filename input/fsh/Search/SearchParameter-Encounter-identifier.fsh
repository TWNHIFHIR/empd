Instance: Encounter-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Encounter-identifier"
* version = "0.1.0"
* name = "SearchParameterEncounteridentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "就醫事件的識別碼(identifier)"
* code = #identifier
* base = #Encounter
* type = #token
* expression = "Encounter.identifier"