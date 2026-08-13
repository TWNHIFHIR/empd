Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $Practitioner-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $icd-10-cm-2023-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/icd-10-cm-2023-tw

Profile: ConditionDS
Parent: TWCoreCondition
Id: Condition-DS
Title: "調劑單張-診斷"
Description: """此Profiles繼承於臺灣核心-病情、問題或診斷(TW Core Condition) ，並進一步用於描述調劑單張之診斷
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^url = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-DS"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* code 1..1
  * ^short = "病情、問題或診斷的識別。[應填入國際疾病分類代碼ICD Code(International Classification of Diseases)]"
  * ^definition = "病情、問題或診斷的識別\r\n[國際疾病分類代碼ICD Code(International Classification of Diseases)]應含主診斷或次診斷之ICD代碼"
* subject only Reference(Group or $Patient-DS)
* encounter only Reference($Encounter-DS)
* recorder only Reference(TWCorePractitionerRole or TWCoreRelatedPerson or $Practitioner-DS or $Patient-DS)
* asserter only Reference(TWCorePractitionerRole or TWCoreRelatedPerson or $Practitioner-DS or $Patient-DS)
* note 1..
  * ^short = "關於此Condition的附加資訊。[應填入部分負擔代碼/醫療評估內容註記 Note]。至少需填入部分負擔代碼。"

Instance: con-ds
InstanceOf: ConditionDS
Description: "調劑單張-診斷範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-DS"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#problem-list-item "Problem List Item"
* code = $icd-10-cm-2023-tw#A00.9 "霍亂"
* subject = Reference(Patient/pat-ds)
* note.text = "001"