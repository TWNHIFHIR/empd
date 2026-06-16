Instance: Composition-subject
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Composition-subject"
* version = "0.1.0"
* name = "SearchParameterCompositionsubject"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "與此報告文件相關的人及(或)事物(subject)"
* code = #subject
* base = #Composition
* type = #reference
* expression = "Composition.subject"