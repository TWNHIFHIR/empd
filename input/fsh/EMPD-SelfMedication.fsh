Alias: $NonNHIMaterial-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMaterial-vs
Alias: $NonNHIMaterial-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs
Alias: $NonNHIMedication-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMedication-vs
Alias: $NonNHIMedication-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs

Profile: MedicationSelfEMPD
Parent: Medication
Id: Medication-Self-EMPD
Title: "電子處方箋與調劑單張-無健保代碼之藥品與特材(Medication)"
Description: """此Profile用於描述電子處方箋與調劑單張中之健保代碼欄位。

本Profile之Medication.code用於承載電子處方箋與調劑單張中之健保代碼。若品項具有正式健保代碼，應填入正式健保代碼；若為無健保代碼之藥品，應使用本IG定義之無健保代碼藥品暫編碼，其代碼格式為999999加流水號4碼，流水號由院所自訂；若為無健保代碼之特材，應使用本IG定義之無健保代碼特材暫編碼，其代碼格式為99999999加流水號4碼，流水號由院所自訂。

本Profile中健保代碼之藥品與特材編碼僅提供參考。"""

* ^status = #active
* ^experimental = false
* ^date = "2026-05-26"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* ^copyright = "衛生福利部"
* obeys med-self-1
* code 1..1 MS
  * ^short = "健保代碼。[應填入正式健保代碼；若為無健保代碼之藥品，應填入999999加流水號4碼；若為無健保代碼之特材，應填入99999999加流水號4碼]"
  * text MS
    * ^short = "健保代碼對應之品項名稱。[可填入藥品名稱、特材名稱或院所品項名稱]"
* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    nonNHIMedication 0..1 MS and
    nonNHIMaterial 0..1 MS
* code.coding[nonNHIMedication] from $NonNHIMedication-vs (example)
  * ^short = "無健保代碼之藥品健保代碼暫編碼"
  * ^definition = "當藥品無正式健保代碼時，使用本IG定義之無健保代碼藥品暫編碼表示健保代碼欄位。代碼格式為999999加流水號4碼，流水號由院所自訂。"
  * ^binding.description = "[NonNHIMedication](ValueSet-NonNHIMedication-vs.html)值集僅提供參考。"
* code.coding[nonNHIMedication].system 1..1 MS
* code.coding[nonNHIMedication].system = $NonNHIMedication-cs (exactly)
  * ^short = "無健保代碼之藥品健保代碼暫編碼CodeSystem"
* code.coding[nonNHIMedication].code 1..1 MS
  * ^short = "無健保代碼之藥品健保代碼暫編碼。格式為999999加流水號4碼，例如9999990001。"
* code.coding[nonNHIMedication].display MS
  * ^short = "無健保代碼之藥品名稱"
* code.coding[nonNHIMaterial] from $NonNHIMaterial-vs (example)
  * ^short = "無健保代碼之特材健保代碼暫編碼"
  * ^definition = "當特材無正式健保代碼時，使用本IG定義之無健保代碼特材暫編碼表示健保代碼欄位。代碼格式為99999999加流水號4碼，流水號由院所自訂。"
  * ^binding.description = "[nonNHIMaterial](ValueSet-NonNHIMaterial-vs.html)值集僅提供參考。"
* code.coding[nonNHIMaterial].system 1..1 MS
* code.coding[nonNHIMaterial].system = $NonNHIMaterial-cs (exactly)
  * ^short = "無健保代碼之特材健保代碼暫編碼CodeSystem"
* code.coding[nonNHIMaterial].code 1..1 MS
  * ^short = "無健保代碼之特材健保代碼暫編碼。格式為99999999加流水號4碼，例如999999990001。"
* code.coding[nonNHIMaterial].display MS
  * ^short = "無健保代碼之特材名稱"

Instance: MedicationSelfEMPD-non01
InstanceOf: MedicationSelfEMPD
Title: "電子處方箋-無健保代碼之藥品"
Description: "此範例表示電子處方箋與調劑單張中，無健保代碼之藥品暫編碼。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD"
* code.coding[nonNHIMedication].system = $NonNHIMedication-cs
* code.coding[nonNHIMedication].code = #9999990010
* code.coding[nonNHIMedication].display = "洛沙坦鉀膜衣錠"
* code.text = "Losartan potassium"
* form = $v3-orderableDrugForm#TAB
* form.text = "Tablet"
* ingredient.itemCodeableConcept.coding = $snomed#108582002 "Losartan potassium (substance)"
* ingredient.itemCodeableConcept.text = "洛沙坦鉀"
* ingredient.strength.numerator.value = 50
* ingredient.strength.numerator.unit = "mg"
* ingredient.strength.denominator.value = 1
* ingredient.strength.denominator.unit = "tablet"

Instance: MedicationSelfEMPD-non02
InstanceOf: MedicationSelfEMPD
Title: "電子處方箋-特殊材料"
Description: "此範例表示電子處方箋與調劑單張中，無健保代碼之特材暫編碼。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD"
* code.coding[nonNHIMaterial].system = $NonNHIMaterial-cs
* code.coding[nonNHIMaterial].code = #999999990001
* code.coding[nonNHIMaterial].display = "準分子雷射冠狀動脈血管整型術導管"
* code.text = "準分子雷射冠狀動脈血管整型術導管"

Invariant: med-self-1
Description: "Medication-Self-EMPD至少應包含一組無健保代碼之藥品或無健保代碼之特材coding"
Severity: #error
Expression: "code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs').exists() or code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').exists()"