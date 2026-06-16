Alias: $sct = http://snomed.info/sct

Profile: PractitionerEMPD
Parent: TWCorePractitioner
Id: Practitioner-EMPD
Title: "電子處方箋-醫事人員基本資料"
Description: "此Profile繼承於臺灣核心-健康照護服務提供人員(TW Core Practitioner)，並用於紀錄電子處方箋的醫事人員基本資料  [[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.1.0"
* ^date = "2023-10-30"
* identifier.value ^short = "唯一值。[應填入管制藥品使用執照號碼]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。"
* name ^short = "照護服務提供人員的姓名。[應填入醫師姓名 Physician Name]"
* telecom ^short = "照護服務提供人員的詳細聯絡方式（適用於所有角色）。[應填入醫師聯絡電話]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。"
* qualification 0..1 MS
  * identifier 0..1 MS
    * value MS
      * ^short = "The value that is unique。[應填入醫事人員證書字號]"

Instance: pra-ep
InstanceOf: PractitionerEMPD
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
* qualification
  * identifier
    * use = #official
    * system = "https://www.mohw.gov.tw/"
    * value = "A1*****8028"
  * code = $sct#223366009