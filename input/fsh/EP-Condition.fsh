Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $icd-10-cm-2023-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/icd-10-cm-2023-tw
Alias: $loinc = http://loinc.org

Profile: ConditionEMPD
Parent: TWCoreCondition
Id: Condition-EMPD
Title: "電子處方箋-診斷"
Description: """此Profiles繼承於臺灣核心-病情、問題或診斷(TW Core Condition) ，並進一步用於描述電子處方箋之診斷
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* code 1..1
  * ^short = "病情、問題或診斷的識別。[應填入國際疾病分類代碼ICD Code(International Classification of Diseases)]"
  * coding 1..*
  * coding[icd10-cm-2023].system 1..1
  * coding[icd10-cm-2023].code 1..1
* note 0..
  * ^short = "關於此Condition的附加資訊。[應填入醫療評估內容註記]。"

Instance: con-01-ep
InstanceOf: ConditionEMPD
Title: "電子處方箋-診斷-未明示側性之急性結膜炎"
Description: "電子處方箋-未明示側性之急性結膜炎診斷資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $loinc#29548-5 "Diagnosis Narrative"
* code = $icd-10-cm-2023-tw#H10.30 "未明示側性之急性結膜炎"
* subject = Reference(Patient/pat-ep)


Instance: con-02-ep
InstanceOf: ConditionEMPD
Title: "電子處方箋-診斷-本態性(原發性)高血壓"
Description: "電子處方箋-本態性(原發性)高血壓診斷資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $loinc#29548-5 "Diagnosis Narrative"
* code = $icd-10-cm-2023-tw#I10 "本態性(原發性)高血壓"
* subject = Reference(Patient/pat-ep)

Instance: con-03-ep
InstanceOf: ConditionEMPD
Title: "電子處方箋-診斷-源於冠狀動脈鈣化病變之冠狀動脈粥樣硬化症"
Description: "電子處方箋-源於冠狀動脈鈣化病變之冠狀動脈粥樣硬化症診斷資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $loinc#29548-5 "Diagnosis Narrative"
* code = $icd-10-cm-2023-tw#I25.84 "源於冠狀動脈鈣化病變之冠狀動脈粥樣硬化症"
* subject = Reference(Patient/pat-ep)

Instance: con-04-ep
InstanceOf: ConditionEMPD
Title: "電子處方箋-診斷-第二型糖尿病，無併發症"
Description: "電子處方箋-第二型糖尿病，無併發症診斷資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $loinc#29548-5 "Diagnosis Narrative"
* code = $icd-10-cm-2023-tw#E11.9 "第二型糖尿病，無併發症"
* subject = Reference(Patient/pat-ep)

Instance: con-05-ep
InstanceOf: ConditionEMPD
Title: "電子處方箋-診斷-注意力不足過動症"
Description: "電子處方箋-注意力不足過動症診斷資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $loinc#29548-5 "Diagnosis Narrative"
* code = $icd-10-cm-2023-tw#F90.0 "注意力不足過動症"
* subject = Reference(Patient/pat-ep)
