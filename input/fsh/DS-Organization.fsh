Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: OrganizationDS
Parent: TWCoreOrganization
Id: Organization-DS
Title: "調劑單張-醫事機構基本資料"
Description: """此Profiles繼承於臺灣核心-機構(TW Core Organization) ，並進一步用於描述調劑單張之醫事機構基本資料
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* ^date = "2024-01-02"
* identifier.value ^short = "唯一值。[應填入醫療機構代碼 Hospital ID/調劑機構代碼]"
* name ^short = "機構的名稱。[應填入醫療機構名稱 Hospital Name/調劑機構名稱]"
* telecom 1..
  * value 1..
    * ^short = "實際的聯絡方式之細節。[應填入醫療機構電話/調劑機構電話]"
* address.text 1..
  * ^short = "地址的文字表述。[應填入調劑機構地址]"

Instance: org-dis-ds
InstanceOf: OrganizationDS
Description: "調劑單張-藥局範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-DS"
* identifier.type = $v2-0203#PRN
* identifier.system = "http://ns.electronichealth.net.au/id/hi/hpio/1.0"
* identifier.value = "3531020884"
* name = "洪文武藥局"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work
* address.use = #work
* address.text = "新北市三重區集美街162號1樓"

Instance: org-ds
InstanceOf: OrganizationDS
Description: "調劑單張-診所範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-DS"
* identifier.type = $v2-0203#PRN
* identifier.system = "http://ns.electronichealth.net.au/id/hi/hpio/1.0"
* identifier.value = "3531020884"
* name = "洪文武診所"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work