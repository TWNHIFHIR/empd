Alias: $NonNHIMaterial-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs

ValueSet: NonNHIMaterialValueSet
Id: NonNHIMaterial-vs
Title: "無健保代碼之特材值集"
Description: "用於無健保代碼之特材值集，僅包含本IG定義之無健保代碼特材代碼"
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2026-05-26"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* ^copyright = "衛生福利部"
* include codes from system $NonNHIMaterial-cs