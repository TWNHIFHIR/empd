Alias: $PartCode-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/PartCode-cs

ValueSet: PartCodeValueSet
Id: PartCode-vs
Title: "部分負擔代碼值集"
Description: "部分負擔代碼值集"
* ^version = "0.1.0"
* ^status = #active
* ^experimental = false
* ^date = "2024-02-22"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* include codes from system $PartCode-cs