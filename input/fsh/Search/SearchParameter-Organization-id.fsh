Instance: Organization-id
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Organization-id"
* name = "SearchParameterOrganizationid"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "機構的邏輯性id"
* code = #_id
* base = #Organization
* type = #token
* expression = "Organization.id"