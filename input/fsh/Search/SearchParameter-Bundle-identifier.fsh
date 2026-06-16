Instance: Bundle-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Bundle-identifier"
* version = "0.1.0"
* name = "SearchParameterBundleidentifier"
* status = #active
* date = "2024-04-01"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "資料交換的基本單位的唯一識別碼(identifier)"
* code = #identifier
* base = #Bundle
* type = #token
* expression = "Bundle.identifier"