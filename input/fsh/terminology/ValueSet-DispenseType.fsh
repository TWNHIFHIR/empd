Alias: $DispenseType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/DispenseType-cs

ValueSet: DispenseTypeValueSet
Id: DispenseType-vs
Title: "醫令調劑方式值集"
Description: "醫令調劑方式值集"
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2022-01-28"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* include codes from system $DispenseType-cs