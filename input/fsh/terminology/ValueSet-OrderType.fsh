Alias: $OrderType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/OrderType-cs

ValueSet: OrderTypeValueSet
Id: OrderType-vs
Title: "醫令類別值集"
Description: "醫令類別值集"
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2024-02-22"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* include codes from system $OrderType-cs