Instance: Observation-subject
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Observation-subject"
* version = "0.1.0"
* name = "SearchParameterObservationsubject"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "有關此檢驗檢查的對象及(或)事物(subject)"
* code = #subject
* base = #Observation
* type = #reference
* expression = "Observation.subject"