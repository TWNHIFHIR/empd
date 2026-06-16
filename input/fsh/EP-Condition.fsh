Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $icd-10-cm-2023-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/icd-10-cm-2023-tw

Profile: ConditionEMPD
Parent: TWCoreCondition
Id: Condition-EMPD
Title: "電子處方箋-診斷"
Description: """此Profiles繼承於臺灣核心-病情、問題或診斷(TW Core Condition) ，並進一步用於描述電子處方箋之診斷
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.1.0"
* ^date = "2023-10-30"
* code 1..1
  * ^short = "病情、問題或診斷的識別。[應填入國際疾病分類代碼ICD Code(International Classification of Diseases)]"
* note 0..
  * ^short = "關於此Condition的附加資訊。[應填入部分負擔代碼/醫療評估內容註記]。"

Instance: con-ep
InstanceOf: ConditionEMPD
Description: "電子處方箋-診斷範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#problem-list-item "Problem List Item"
* code = $icd-10-cm-2023-tw#A00.9 "霍亂"
* subject = Reference(Patient/pat-ep)
* note.text = "部分負擔代碼:001"