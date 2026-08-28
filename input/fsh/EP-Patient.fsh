Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: PatientEMPD
Parent: TWCorePatient
Id: Patient-EMPD
Title: "電子處方箋-病人基本資料"
Description: """此Profiles繼承於臺灣核心-病人(TW Core Patient) ，並進一步用於描述電子處方箋之病人基本資料
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"

* extension[age] 1..
  * ^short = "年齡。[應填入就診年齡 Age]"
* identifier 1..*
* identifier ^short = "病人的身份識別碼（identifier），通常為業務目的所使用的識別碼，例如病歷號。[應填入身分證號Personal ID Number與病歷號碼 Chart No.]"
* identifier[medicalRecord] ^short = "適用病歷號。(病歷號於電子處方箋為非必填欄位)"
* name 1..
  * ^short = "病人的姓名。[應填入病患姓名 Name]"
* gender ^short = "male ｜ female ｜ other ｜ unknown。[應填入性別 Gender]"
* birthDate ^short = "病人出生日期。[應填入出生日期 Birth Date]"
* obeys pat-id-1


Invariant: pat-id-1
Description: "病人之國民身分證統一編號、護照號碼或居留證號，至少應填寫其中一種。"
Severity: #error
Expression: "identifier.where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v2-0203' and (code = 'NNxxx' or code = 'PPN' or code = 'PRC')).exists()).exists()"

Instance: pat-ep
InstanceOf: PatientEMPD
Title: "電子處方箋-病人基本資料"
Description: "電子處方箋-病人基本資料範例"
Usage: #example
* identifier[idCardNumber]
  * use = #official
  * system = "http://www.moi.gov.tw"
  * value = "Z199999829"
  * type = $v2-0203#NNxxx
* identifier[medicalRecord]
  * use = #official
  * system = "https://www.tmip.com.tw/"
  * value = "A12345"
  * type = $v2-0203#MR
* name
  * use = #official
  * text = "甄○康"
* gender = #female
* birthDate = "1985-01-02"
* extension
  * url = "https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition/person-age"
  * valueAge = 39 'a'
  
