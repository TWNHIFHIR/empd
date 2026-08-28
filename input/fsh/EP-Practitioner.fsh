Alias: $sct = http://snomed.info/sct
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: PractitionerEMPD
Parent: TWCorePractitioner
Id: Practitioner-EMPD
Title: "電子處方箋-醫事人員基本資料"
Description: "此Profile繼承於臺灣核心-健康照護服務提供人員(TW Core Practitioner)，並用於紀錄電子處方箋的醫事人員基本資料  [[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"

* identifier[medicalLicenseNumber] ^short = "醫師證號。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。[應填入醫事人員證書字號]"
* identifier[medicalLicenseNumber].system = "https://dep.mohw.gov.tw/DOMA"
* identifier[medicalLicenseNumber].system ^short  = "醫師證號的命名空間（namespace），請固定填「https://dep.mohw.gov.tw/DOMA」。"
* name ^short = "照護服務提供人員的姓名。[應填入醫師姓名 Physician Name]"
* telecom ^short = "照護服務提供人員的詳細聯絡方式（適用於所有角色）。[應填入醫師聯絡電話]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。"
* qualification 0..1 MS
  * identifier 1..1 MS
    * value 1..1
      * ^short = "唯一值。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。[應填入管制藥品使用執照號碼]"
    * system 1..1
    * system = "https://cdmis.fda.gov.tw"
      * ^short = "管制藥品使用執照的命名空間（namespace），請固定填「https://cdmis.fda.gov.tw」。"

Instance: pra-01-ep
InstanceOf: PractitionerEMPD
Title: "電子處方箋-醫事人員基本資料"
Description: "電子處方箋-醫事人員基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-EMPD"
* name
  * use = #official
  * text = "洪文武"
* telecom
  * system = #phone
  * value = "02-29765731"
  * use = #work


Instance: pra-02-ep
InstanceOf: PractitionerEMPD
Title: "電子處方箋-醫事人員基本資料-醫師及管制藥品執照資訊"
Description: "電子處方箋-包含醫師證號及管制藥品執照識別資訊之醫事人員基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-EMPD"
* identifier[medicalLicenseNumber]
  * type
    * coding = $v2-0203#MD
  * system = "https://dep.mohw.gov.tw/DOMA"
  * value = "DC001"
* name
  * use = #official
  * text = "洪文武"
* telecom
  * system = #phone
  * value = "02-29765731"
  * use = #work
* qualification
  * identifier
    * use = #official
    * system = "https://cdmis.fda.gov.tw"
    * value = "SCM8888888888"
  * code = $sct#158965000