Alias: $sct = http://snomed.info/sct
Alias: $PaymentCategory-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs
Alias: $PaymentCategory-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/PaymentCategory-vs
Alias: $PartCode-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/PartCode-cs
Alias: $PartCode-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/PartCode-vs


Profile: EncounterEMPD
Parent: TWCoreEncounter
Id: Encounter-EMPD
Title: "電子處方箋-門診基本資料"
Description: "此Profile繼承於臺灣核心-就醫事件(TW Core Encounter) ，並用於描述電子處方箋的門診基本資料[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"

* identifier 1..2
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier ^slicing.ordered = false
* identifier contains
    medical-encounter-identifier 1..1 MS and
    func-sequence-number 0..1 MS
* identifier[medical-encounter-identifier].system 1..1 MS
* identifier[medical-encounter-identifier].system = "https://nhicore.nhi.gov.tw/empd/medical-encounter-identifier"
* identifier[medical-encounter-identifier].value 1..1 MS
* identifier[medical-encounter-identifier] ^short = "表示開立處方時取得之就醫識別碼，用以識別本次就醫紀錄。[應填入就醫識別碼]"
* identifier[func-sequence-number].system 1..1 MS
* identifier[func-sequence-number].system = "https://nhicore.nhi.gov.tw/empd/func-sequence-number"
* identifier[func-sequence-number].value 1..1 MS
* identifier[func-sequence-number] ^short = "表示本次就醫之健保卡就醫序號；當就醫身分別為非自費時，此欄位為必填。[應填入健保卡就醫序號]"
* class from NHICaseType (required)
  * ^short = "病人就醫的分類。[應填入案件分類]。(如為自費案件請使用代碼\"00\")"
  * ^definition = "病人就醫分類的概念，例如：門診病人、住院病人、急診病人、居家照護或其他因地方不同而產生的概念。\r\n健保案件分類，如：01:西醫一般案件 02:西醫急診 03: 西醫門診手術 04:西醫慢性病 05:洗腎 06:結核病 08:慢性病連續處方調劑 09:西醫其他專案 11:牙醫一般案件 12:牙醫急診 13:牙醫門診手術等。"
  * ^binding.description = "案件分類；應填入[NHICaseType](ValueSet-nhi-case-type.html)值集中適合的代碼，確定無適合的代碼才可以使用其他值集的代碼來表示。"
  * system 1..1
  * code 1..1 
* type 0..1 MS
* type from $PartCode-vs (required)
* type ^short = "表示本次就醫依全民健康保險規定所適用之部分負擔類別。[應填入部分負擔代碼]"
  * coding 1..1
    * system 1..1
    * code 1..1
    * code from $PartCode-vs (required)
//* serviceType from TWMedicalDepartmentSCT (preferred)
* serviceType 1..
  * ^short = "服務的特定型別。[應填入科別 Department]"
* subject 1..
* period 1..
  * start 1.. MS
    * ^short = "Starting time with inclusive boundary.[應填入門診日期 OPD Date]。日期格式為西元 YYYYMMDD"


Instance: enc-01-ep
InstanceOf: EncounterEMPD
Title: "電子處方箋-門診基本資料-西醫一般案件"
Description: "電子處方箋-案件分類為西醫一般案件、部分負擔為醫學中心一般門診服務類別為不分科之門診基本資料範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-EMPD"
* identifier[medical-encounter-identifier].system = "https://nhicore.nhi.gov.tw/empd/medical-encounter-identifier"
* identifier[medical-encounter-identifier].value = "1101020012B234567890202608241515"
* identifier[func-sequence-number].system = "https://nhicore.nhi.gov.tw/empd/func-sequence-number"
* identifier[func-sequence-number].value = "001"
* status = #finished
* class = https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-outpatient-case-type#01 "西醫一般案件"
* type = $PartCode-cs#A12 "醫學中心；一般門診"
* serviceType = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medical-treatment-department-nhi-tw#00 "不分科"
* period.start = "2026-07-21"
* subject = Reference(Patient/pat-ep)

Instance: enc-02-ep
InstanceOf: EncounterEMPD
Title: "電子處方箋-門診基本資料-自費案件"
Description: "電子處方箋-案件分類為自費案件服務類別為不分科之門診基本資料範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-EMPD"
* identifier[medical-encounter-identifier].system = "https://nhicore.nhi.gov.tw/empd/medical-encounter-identifier"
* identifier[medical-encounter-identifier].value = "0401180014A123456789202608241450"
* status = #finished
* class.system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-outpatient-case-type"
* class.code = #00 
* class.display = "自費案件"
* serviceType = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medical-treatment-department-nhi-tw#00 "不分科"
* period.start = "2026-07-21"
* subject = Reference(Patient/pat-ep)