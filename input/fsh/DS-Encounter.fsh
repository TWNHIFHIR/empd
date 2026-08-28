Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $sct = http://snomed.info/sct
Alias: $sct = http://snomed.info/sct
Alias: $CaseType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-outpatient-case-type
Alias: $CaseType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/nhi-case-type

Profile: EncounterDS
Parent: TWCoreEncounter
Id: Encounter-DS
Title: "調劑單張-門診基本資料"
Description: "此Profile繼承於臺灣核心-就醫事件(TW Core Encounter) ，並用於描述調劑單張的門診基本資料[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* identifier
  * ^short = "唯一值。[應填入原就醫識別碼/就醫識別碼/健保卡就醫序號]。非自費時，就醫識別碼為必填(MedicationRequest.category判別)"
  * ^definition = "識別碼中通常與使用者有關的部分，在系統情境內是唯一的。\r\n[原就醫識別碼]為醫療院所開立處方時之就醫識別碼\r\n[就醫識別碼]為本次調劑處方所產製之就醫識別碼"
* class ^short = "病人就醫的分類。[應填入案件分類]"
* type ^short = "就醫的特定型別。[應填入歸屬]"
  * ^definition = "就醫的特定型別（如電子郵件諮詢、手術日間照護、專業護理、復健）。\r\n[歸屬]之填入內容建議為計畫案之開立處方，如：藥事照護計畫、戒菸門診、COVID-19…等特殊案件代碼"
* serviceType 1..
  * ^short = "服務的特定型別。[應填入科別 Department]"
* subject 1..
* subject only Reference(Group or $Patient-DS)
* period 1..
  * start 1.. MS
    * ^short = "Starting time with inclusive boundary。[應填入門診日期 OPD Date]"
    * ^definition = "The start of the period. The boundary is inclusive.\r\n等同開立處方日期\r\n格式為西元YYYYMMDD"

Instance: enc-ds
InstanceOf: EncounterDS
Description: "調劑單張-門診基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS"
* status = #finished
* serviceType = $sct#419772000 "Family practice"
* serviceType.text = "家醫科"
* class = $CaseType-cs#01 "西醫一般案件"
* period.start = "2023-02-23"
* subject = Reference(Patient/pat-ds)