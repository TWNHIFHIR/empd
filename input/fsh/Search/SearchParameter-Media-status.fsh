Instance: Media-status
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Media-status"
* version = "0.1.0"
* name = "SearchParameterMediastatus"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "圖譜、圖像的狀態(status)"
* code = #status
* base = #Media
* type = #token
* expression = "Media.status"