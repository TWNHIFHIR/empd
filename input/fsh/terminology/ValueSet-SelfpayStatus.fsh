Alias: $SelfpayStatus-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/SelfpayStatus-cs

ValueSet: SelfpayStatusValueSet
Id: SelfpayStatus-vs
Title: "自費註記值集"
Description: "自費註記值集"
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2024-02-22"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* include codes from system $SelfpayStatus-cs