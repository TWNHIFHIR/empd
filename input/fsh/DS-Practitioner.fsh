Alias: $sct = http://snomed.info/sct
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: PractitionerDS
Parent: TWCorePractitioner
Id: Practitioner-DS
Title: "調劑單張-醫事人員基本資料"
Description: "此Profile繼承於臺灣核心-健康照護服務提供人員(TW Core Practitioner)，並用於紀錄調劑單張的醫事人員基本資料  [[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* identifier[medicalLicenseNumber].value ^short = "唯一值。[應填入管制藥品使用執照號碼]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。調劑人員免填此欄位。"
* name ^short = "照護服務提供人員的姓名。[應填入醫師姓名 Physician Name/藥事人員姓名]。"
* telecom.value ^short = "實際的聯絡方式之細節。[應填入醫師聯絡電話]，註：開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。"
* qualification ..1 MS
  * identifier MS
    * value MS
      * ^short = "The value that is unique。[應填入調劑人員專業證書字號]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填。此欄位等同藥師證書字號。如為醫師則此欄位免填。"

Instance: pra-dis-ds
InstanceOf: PractitionerDS
Description: "調劑單張-調劑醫事人員基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS"
* name.use = #official
* name.text = "洪藥師"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work
* qualification.identifier.use = #official
* qualification.identifier.system = "https://www.mohw.gov.tw/"
* qualification.identifier.value = "A1*****8028"
* qualification.code = $sct#46255001 "Pharmacist"
* qualification.code.text = "Pharmacist"

Instance: pra-ds
InstanceOf: PractitionerDS
Description: "調劑單張-醫事人員基本資料範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS"
* identifier.use = #official
* identifier.type = $v2-0203#MD
* identifier.system = "http://www.moi.gov.tw"
* identifier.value = "A01"
* name.use = #official
* name.text = "洪文武"
* telecom.system = #phone
* telecom.value = "02-29765731"
* telecom.use = #work