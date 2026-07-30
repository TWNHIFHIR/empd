Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $v2-0203-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/v2-0203

Profile: OrganizationEMPD
Parent: TWCoreOrganization
Id: Organization-EMPD
Title: "電子處方箋-醫事機構基本資料"
Description: """此Profiles繼承於臺灣核心-機構(TW Core Organization) ，並進一步用於描述電子處方箋之醫事機構基本資料
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* ^date = "2023-10-30"
* identifier.value ^short = "唯一值。[應填入醫療機構代碼 Hospital ID]"
* name ^short = "機構的名稱。[應填入醫療機構名稱 Hospital Name]"
* telecom 1..
  * ^short = "此機構的詳細聯絡方式。[應填入醫療機構電話]\r\norg-3：一個機構的通訊永遠不可能是「家用」，意即不可能使用「home」。"
  * value 1..
* address 1.. MS
  * text 1..
    * ^short = "地址的文字表述。[應填入醫療機構地址]"
* contact MS

Instance: org-01-ep
InstanceOf: OrganizationEMPD
Title: "電子處方箋-醫事機構基本資料"
Description: "電子處方箋-醫事機構基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD"
* identifier.type = $v2-0203#PRN
* identifier.system = "https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw"
* identifier.value = "3531020884"
* name = "洪文武診所"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work
* address.use = #work
* address.text = "新北市三重區集美街162號1樓"

Instance: org-02-ep
InstanceOf: OrganizationEMPD
Title: "電子處方箋-政府機構基本資料"
Description: "電子處方箋-政府機構基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD"
* identifier.type = $v2-0203-tw#GOI
* identifier.system = "https://oid.nat.gov.tw/"
* identifier.value = "A21000000I"
* type = http://terminology.hl7.org/CodeSystem/organization-type#govt
* name = "衛生福利部"
* telecom.system = #url
* telecom.value = "https://www.mohw.gov.tw/mp-1.html"
* address.use = #work
* address.text = "臺北市大安區龍圖里信義路三段140號"