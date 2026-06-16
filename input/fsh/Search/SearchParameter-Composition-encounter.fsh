Instance: Composition-encounter
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Composition-encounter"
* version = "0.1.0"
* name = "SearchParameterCompositionencounter"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "與此報告文件相關之就醫事件(encounter)"
* code = #encounter
* base = #Composition
* type = #reference
* expression = "Composition.encounter"