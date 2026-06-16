Alias: $sct = http://snomed.info/sct
Alias: $PaymentCategory-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs
Alias: $PaymentCategory-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/PaymentCategory-vs
Alias: $CaseType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/CaseType-cs
Alias: $CaseType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/CaseType-vs


Profile: EncounterEMPD
Parent: TWCoreEncounter
Id: Encounter-EMPD
Title: "電子處方箋-門診基本資料"
Description: "此Profile繼承於臺灣核心-就醫事件(TW Core Encounter) ，並用於描述電子處方箋的門診基本資料[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.1.0"
* ^date = "2023-10-30"
* identifier 1..2
  * ^short = "此就醫事件的識別碼。[應填入就醫識別碼與健保卡就醫序號]。非自費時，就醫識別碼為必填(MedicationRequest.category判別)"
* class from $CaseType-vs (extensible)
  * ^short = "病人就醫的分類。[應填入案件分類]。(如為自費案件請使用代碼\"00\")"
  * ^definition = "病人就醫分類的概念，例如：門診病人、住院病人、急診病人、居家照護或其他因地方不同而產生的概念。\r\n健保案件分類，如：01:西醫一般案件 02:西醫急診 03: 西醫門診手術 04:西醫慢性病 05:洗腎 06:結核病 08:慢性病連續處方調劑 09:西醫其他專案 11:牙醫一般案件 12:牙醫急診 13:牙醫門診手術等。"
  * ^binding.description = "案件分類；應填入[CaseType-vs](ValueSet-CaseType-vs.html)值集中適合的代碼，確定無適合的代碼才可以使用其他值集的代碼來表示。"
* serviceType 1..
  * ^short = "服務的特定型別。[應填入科別 Department]"
* subject 1..
* period 1..
  * start 1.. MS
    * ^short = "Starting time with inclusive boundary.[應填入門診日期 OPD Date]。日期格式為西元 YYYYMMDD"

Instance: enc-ep
InstanceOf: EncounterEMPD
Description: "電子處方箋-門診基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-EMPD"
* identifier.system = "https://www.nhi.gov.tw/ch/mp-1.html"
* identifier.value = "01234567890123456789"
* status = #finished
* serviceType = $sct#394609007
* serviceType.text = "普通外科"
* class = $CaseType-cs#01 "西醫一般案件"
* period.start = "2023-02-23"
* subject = Reference(Patient/pat-ep)