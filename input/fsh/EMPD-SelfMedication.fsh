Alias: $NonNHIMaterial-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMaterial-vs
Alias: $NonNHIMaterial-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs
Alias: $NonNHIMedication-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMedication-vs
Alias: $NonNHIMedication-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs

Profile: MedicationSelfEMPD
Parent: Medication
Id: Medication-Self-EMPD
Title: "電子處方箋與調劑單張-無健保代碼之藥品與特材(Medication)"
Description: """此Profile用於描述電子處方箋與調劑單張中之健保代碼欄位。

本Profile之Medication.code用於承載電子處方箋與調劑單張中之健保代碼。<br/>
一、無健保代碼之藥品：<br/>
&emsp;(一)、為主管機關核准發給之藥品，請參照「[藥品許可證類別資料標準](https://schema.gov.tw/lists/134)」，填入許可證字號(共12~14碼)。<br/>
&emsp;(二)、無上開藥品許可證字號，請以999999+流水號4碼(流水號由院所自訂)編碼(共10碼)。<br/>
二、無健保代碼之特材：<br/>
&emsp;依下列說明編碼 (共12碼):<br/>
&emsp;第 1-2 碼：依現行特材代碼前 2 碼編碼原則 (2碼)，請參照「[全民健保特殊材料品項分類代碼編訂原則](https://www.nhi.gov.tw/ch/cp-2741-d7757-2539-1.html)」。<br/>
&emsp;第 3 碼：半形大寫「 Z 」 (1 碼)。<br/>
&emsp;第 4-9 碼：許可證號 (6 碼)。<br/>
&emsp;第 10-12 碼：流水號 (3 碼) 。

本Profile中健保代碼之藥品與特材編碼僅提供參考。"""

* ^status = #active
* ^experimental = false
* ^date = "2026-05-26"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* ^copyright = "衛生福利部"
* obeys med-self-1 and med-self-2 and med-self-3
* code 1..1 MS
  * ^short = "健保代碼。[無健保代碼之藥品或特材，請依規定暫編碼並填寫對應代碼系統]"
  * text MS
    * ^short = "健保代碼對應之品項名稱。[全民健保已收載及列項之特材，沿用本署全民健康保險藥物給付項目及支付標準特材中英文名稱，非健保已收載醫材，請填列醫療器材許可證中英文名稱]"
* code.coding 1..1 MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    nonNHIMedication 0..1 MS and
    nonNHIMaterial 0..1 MS
* code.coding[nonNHIMedication] from $NonNHIMedication-vs (example)
  * ^short = "無健保代碼之藥品暫編碼"
  * ^definition = "當藥品無正式健保代碼時，使用本IG定義之無健保代碼藥品暫編碼表示健保代碼欄位。"
  * ^binding.description = "值集僅提供參考，請依規定自行編碼。"
* code.coding[nonNHIMedication].system 1..1 MS
* code.coding[nonNHIMedication].system = $NonNHIMedication-cs (exactly)
  * ^short = "無健保代碼之藥品代碼系統。[請固定填寫此代碼系統]"
* code.coding[nonNHIMedication].code 1..1 MS
  * ^short = "無健保代碼之藥品暫編碼。[如為主管機關核准發給之藥品，請參照「藥品許可證類別資料標準」填入許可證字號(共12~14碼)；無上開藥品許可證字號，請以999999+流水號4碼(流水號由院所自訂)編碼 (共10碼)]"
* code.coding[nonNHIMedication].display MS
  * ^short = "無健保代碼之藥品名稱"
* code.coding[nonNHIMaterial] from $NonNHIMaterial-vs (example)
  * ^short = "無健保代碼之特材健保代碼暫編碼"
  * ^definition = "當特材無正式健保代碼時，使用本IG定義之無健保代碼特材暫編碼表示健保代碼欄位。"
  * ^binding.description = "值集僅提供參考，請依規定自行編碼。"
* code.coding[nonNHIMaterial].system 1..1 MS
* code.coding[nonNHIMaterial].system = $NonNHIMaterial-cs (exactly)
  * ^short = "無健保代碼之特材代碼系統。[請固定填寫此代碼系統]"
* code.coding[nonNHIMaterial].code 1..1 MS
  * ^short = "無健保代碼之特材暫編碼。[第 1-2 碼依現行特材代碼前 2 碼編碼原則 (2碼) + 第 3 碼為 半形大寫「 Z 」 (1 碼) + 第 4-9 碼為許可證號 (6 碼) + 第 10-12 碼為流水號 (3 碼)]"
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
* code.coding[nonNHIMaterial].code = #FBZ012345001
* code.coding[nonNHIMaterial].display = "準分子雷射冠狀動脈血管整型術導管"
* code.text = "準分子雷射冠狀動脈血管整型術導管"

Invariant: med-self-1
Description: "Medication-Self-EMPD至少應包含一組無健保代碼之藥品或無健保代碼之特材coding"
Severity: #error
Expression: "code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs').exists() or code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').exists()"

Invariant: med-self-2
Description: "無健保代碼之藥品暫編碼須符合編碼規則：藥品許可證字號長度為12~14碼，或999999+流水號4碼（共10碼）"
Severity: #error
Expression: "code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs').empty() or code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs').all(code.matches('^999999[0-9]{4}$') or (code.length() >= 12 and code.length() <= 14))"

Invariant: med-self-3
Description: "無健保代碼之特材暫編碼須符合編碼規則：共12碼，第1-2碼為特材代碼前2碼、第3碼為半形大寫 Z、第4-9碼為許可證號、第10-12碼為流水號"
Severity: #error
Expression: "code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').empty() or code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').all(code.matches('^[A-Z]{2}[Z].{6}[0-9]{3}$'))"