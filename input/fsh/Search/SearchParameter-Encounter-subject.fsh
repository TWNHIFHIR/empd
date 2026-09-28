Instance: Encounter-subject
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Encounter-subject"
* name = "SearchParameterEncountersubject"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "就醫的病人(subject)"
* code = #subject
* base = #Encounter
* type = #reference
* expression = "Encounter.subject"