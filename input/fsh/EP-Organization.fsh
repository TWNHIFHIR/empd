Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $twcorOrg-cs = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw
Alias: $twcoreOrg-vs = https://twcore.mohw.gov.tw/ig/twcore/ValueSet/organization-identifier-tw


Profile: OrganizationEMPD
Parent: TWCoreOrganization
Id: Organization-EMPD
Title: "電子處方箋-醫事機構基本資料"
Description: """此Profiles繼承於臺灣核心-機構(TW Core Organization) ，並進一步用於描述電子處方箋之醫事機構基本資料
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* identifier 1..1
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier contains 
    nhi-organization 0..1 MS and
    twcore-organization 0..1 MS
* identifier[nhi-organization].type = $v2-0203#PRN
* identifier[nhi-organization].value ^short = "唯一值。由中央健康保險署核發之健保特約醫事服務機構代號，用以識別與健保署簽訂特約之醫事服務機構。[應填入醫療機構代碼 Hospital ID]"
* identifier[nhi-organization].value 1..1 MS
* identifier[nhi-organization].value from NHIOrganizationValueSet
* identifier[nhi-organization].system 1..1 MS
* identifier[nhi-organization].system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/organization-identifier-tw"
* identifier[twcore-organization].type = $v2-0203#PRN
* identifier[twcore-organization].value ^short = "唯一值。由衛生福利部醫事司編配之醫事機構代碼，用以識別依法設立並登記之醫療機構。[應填入醫療機構代碼 Hospital ID]"
* identifier[twcore-organization].value from $twcoreOrg-vs
* identifier[twcore-organization].value 1..1 MS
* identifier[twcore-organization].system 1..1 MS
* identifier[twcore-organization].system = "https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw"
* name 1..1
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
Title: "電子處方箋-健保特約醫事服務機構基本資料"
Description: "電子處方箋-使用健保特約醫事服務機構代號之醫事機構(Organization)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD"
* identifier[nhi-organization].type = $v2-0203#PRN
* identifier[nhi-organization].system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/organization-identifier-tw"
* identifier[nhi-organization].value = "3531020884"
* name = "洪文武診所"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work
* address.use = #work
* address.text = "新北市三重區集美街162號1樓"

Instance: org-02-ep
InstanceOf: OrganizationEMPD
Title: "電子處方箋-醫事司醫事機構"
Description: "電子處方箋-使用醫事司醫事機構代碼之醫事機構(Organization)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD"
* identifier[twcore-organization].type = $v2-0203#PRN
* identifier[twcore-organization].system = "https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/organization-identifier-tw"
* identifier[twcore-organization].value = "3531020884"
* name = "洪文武診所"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work
* address.use = #work
* address.text = "新北市三重區集美街162號1樓"

Instance: org-nhi-ep
InstanceOf: TWCoreOrganizationGovt
Title: "衛生福利部中央健康保險署"
Description: "依據臺灣核心-政府機構（TW Core Organization Government）Profile呈現衛生福利部中央健康保險署"
Usage: #example
* identifier.use = #official
* identifier.system = "https://oid.nat.gov.tw/"
* identifier.value = "A21030000I"
* identifier.type = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/v2-0203#GOI
* type =  http://terminology.hl7.org/CodeSystem/organization-type#govt
* name = "衛生福利部中央健康保險署"