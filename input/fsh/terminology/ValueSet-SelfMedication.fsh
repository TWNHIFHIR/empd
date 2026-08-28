Alias: $NonNHIMedication-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs

ValueSet: NonNHIMedicationValueSet
Id: NonNHIMedication-vs
Title: "無健保代碼之藥品值集"
Description: "用於無健保代碼之藥品值集，僅包含本IG定義之無健保代碼藥品代碼"
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2026-03-10"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* include codes from system $NonNHIMedication-cs