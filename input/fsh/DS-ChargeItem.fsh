Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $twcore = https://twcore.mohw.gov.tw

Profile: ChargeItemDS
Parent: ChargeItem
Id: ChargeItem-DS
Title: "調劑單張-藥物服務代碼"
Description: "此Profile用於描述調劑單張之藥物服務代碼"
* ^version = "0.2.1"
* ^status = #active
* ^date = "2024-01-02"
* code MS
  * ^short = "A code that identifies the charge, like a billing code。[應填入藥事服務代碼]"
  * coding MS
    * system MS
    * code MS
    * display MS
  * text MS
* subject only Reference(Group or $Patient-DS)
* subject MS

Instance: cha-ds
InstanceOf: ChargeItemDS
Description: "調劑單張-藥物服務代碼範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/ChargeItem-DS"
* status = #billed
* code = http://terminology.hl7.org/CodeSystem/chargeitem-billingcodes#1100	 "Unvorhergesehene Inanspruchnahme"
* subject = Reference(pat-ds)