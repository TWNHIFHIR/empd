Instance: Composition-author
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Composition-author"
* version = "0.1.0"
* name = "SearchParameterCompositionauthor"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "負責此報告文件的醫事人員及(或)組織(author)"
* code = #author
* base = #Composition
* type = #reference
* expression = "Composition.author"