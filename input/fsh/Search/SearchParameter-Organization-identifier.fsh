Instance: Organization-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Organization-identifier"
* version = "0.1.0"
* name = "SearchParameterOrganizationidentifier"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "機構的唯一識別碼(identifier)"
* code = #identifier
* base = #Organization
* type = #token
* expression = "Organization.identifier"