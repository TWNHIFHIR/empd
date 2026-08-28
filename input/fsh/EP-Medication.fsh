Alias: $medication-nhi-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-nhi-tw
Alias: $v3-orderableDrugForm = http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm
Alias: $snomed = http://snomed.info/sct
Alias: $NonNHIMedication-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMedication-vs
Alias: $NonNHIMedication-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs

Profile: MedicationEMPD
Parent: TWCoreMedication
Id: Medication-EMPD
Title: "電子處方箋-藥物處方內容(Medication)"
Description: """此Profiles繼承於臺灣核心-藥品(TW Core Medication) ，並進一步用於描述電子處方箋之藥物處方內容  
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"

* code 1..1
  * ^short = "指明這種藥品的代碼。[應填入健保代碼與藥品商品名稱 Brand Name]，健保代碼(code)；商品名稱 Brand Name(display)。"
  * text 1..
    * ^short = "概念的文字表示法。[應填入學名 Generic Name]"
* form 1..
  * ^short = "powder ｜ tablets ｜ capsule +此為SNOMED CT代碼，若機構已有購買相關授權，亦可使用。[應填入劑型 Dosage Form]"
  * text 1..
* ingredient.strength 1.. MS
  * ^short = "所含成份的劑量。[應填入藥品單位含量]"
  * numerator 1..1 MS
    * value 1..1 MS
    * unit 1..1
  * denominator 1..1 MS
    * value 1..1 MS
    * unit 1..1
* code.coding 1..*
* code.coding contains
    nhi-medication 0..1 MS and
    nonNHIMedication 0..1 MS
* code.coding[fda-medication-tw].code 1..1
* code.coding[fda-medication-tw].system 1..1
* code.coding[fda-medication-tw] ^short = "[如為主管機關核准發給之藥品，請參照「藥品許可證類別資料標準」填入許可證字號(共12~14碼)"
* code.coding[nhi-medication-tw].code 1..1
* code.coding[nhi-medication-tw].system 1..1
* code.coding[nhi-medication-ch-herb-tw].code 1..1
* code.coding[nhi-medication-ch-herb-tw].system 1..1
* code.coding[rxnorm-medication-us-core].code 1..1
* code.coding[rxnorm-medication-us-core].system 1..1
* code.coding[atc-medication-code].code 1..1
* code.coding[atc-medication-code].system 1..1
* code.coding[nhi-medication].code 1..1
* code.coding[nhi-medication].system 1..1
* code.coding[nhi-medication] from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedication-vs (required)
* code.coding[nhi-medication] ^short = "由專門術語系統（terminology system）定義的代碼"
* code.coding[nonNHIMedication] from $NonNHIMedication-vs (example)
  * ^short = "無健保代碼之藥品暫編碼"
  * ^definition = "當藥品無正式健保代碼時，使用本IG定義之無健保代碼藥品暫編碼表示健保代碼欄位。"
  * ^binding.description = "值集僅提供參考，請依規定自行編碼。"
* code.coding[nonNHIMedication].system 1..1 
* code.coding[nonNHIMedication] ^patternCoding.system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs"
* code.coding[nonNHIMedication].code 1..1 
  * ^short = "無健保代碼之藥品代碼系統。[請固定填寫此代碼系統]"

* obeys empd-med-1

Invariant: empd-med-1
Description: "當自費藥品且無藥品許可證字號時，需以999999加院所自訂流水號4碼，共10碼編碼。"
Severity: #error
Expression: "code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs').all(code.matches('^999999[0-9]{4}$'))"

Instance: med-01-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼藥品-YEN KUANG EYE DROPS"
Description: "電子處方箋-健保代碼A000015421 YEN KUANG EYE DROPS 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[nhi-medication] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#A000015421 "YEN KUANG EYE DROPS"
  * text = "SULFAMETHOXAZOLE SODIUM / 磺胺甲噁唑鈉"
* form = $v3-orderableDrugForm#OPDROP
  * text = "Ophthalmic Drops"
* ingredient
  * itemCodeableConcept.coding = $snomed#363528007 "Sulfamethoxazole (substance)"
  * itemCodeableConcept.text = "Sulfamethoxazole Sodium"
  * strength
    * numerator.value = 20
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "ml"
    * denominator.code = #ml
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-02-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-食藥署藥品許可證-可得安穩 320/12.5 毫克膜衣錠"
Description: "電子處方箋-衛署藥輸字第024969號 可得安穩 320/12.5 毫克膜衣錠 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[fda-medication-tw] = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-fda-tw#衛署藥輸字第024969號 "可得安穩320/12.5毫克膜衣錠"
  * text = "VALSARTAN + HYDROCHLOROTHIAZIDE"
* form = $v3-orderableDrugForm#TAB
  * text = "膜衣錠"
* ingredient[0]
  * itemCodeableConcept.coding = $snomed#386876001 "Valsartan (substance)"
  * itemCodeableConcept.text = "VALSARTAN"
  * strength
    * numerator.value = 320
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"
* ingredient[1]
  * itemCodeableConcept.coding = $snomed#387525002 "Hydrochlorothiazide (substance)"
  * itemCodeableConcept.text = "HYDROCHLOROTHIAZIDE"
  * strength
    * numerator.value = 12.5
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-03-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-無健保代碼藥品-Amlodipine 口服懸液 1 mg/mL（院內調製）"
Description: "電子處方箋-無健保代碼 Amlodipine 口服懸液 1 mg/mL（院內調製）藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[fda-medication-tw] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMedication-cs#9999990011 "Amlodipine 口服懸液 1 mg/mL（院內調製）"
  * text = "Amlodipine"
* form = $v3-orderableDrugForm#ORSUSP
  * text = "口服懸液劑"
* ingredient
  * itemCodeableConcept.coding = $snomed#386864001 "Amlodipine (substance)"
  * itemCodeableConcept.text = "Amlodipine"
  * strength
    * numerator.value = 1
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "mL"
    * denominator.code = #mL
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-04-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼藥品-庫魯化錠 500 毫克"
Description: "電子處方箋-健保代碼 BC071521G0 庫魯化錠 500 毫克 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[nhi-medication] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#BC071521G0
  * text = "Metformin hydrochloride"
* form = $v3-orderableDrugForm#TAB
  * text = "錠劑"
* ingredient
  * itemCodeableConcept.coding = $snomed#109083009 "Metformin hydrochloride (substance)"
  * itemCodeableConcept.text = "Metformin hydrochloride"
  * strength
    * numerator.value = 500
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-05-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼藥品-恩排糖膜衣錠 10 毫克"
Description: "電子處方箋-健保代碼 BC26406100 恩排糖膜衣錠 10 毫克 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[nhi-medication] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#BC26406100
  * text = "Empagliflozin"
* form = $v3-orderableDrugForm#TAB
  * text = "膜衣錠"
* ingredient
  * itemCodeableConcept.coding = $snomed#703894008 "Empagliflozin (substance)"
  * itemCodeableConcept.text = "Empagliflozin"
  * strength
    * numerator.value = 10
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-06-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼藥品-代蜜持續性藥效錠 30 毫克"
Description: "電子處方箋-健保代碼 AB48089100 代蜜持續性藥效錠 30 毫克 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[nhi-medication] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#AB48089100
  * text = "Gliclazide"
* form = $v3-orderableDrugForm#ERTAB
  * text = "持續性藥效錠"
* ingredient
  * itemCodeableConcept.coding = $snomed#395731001 "Gliclazide (substance)"
  * itemCodeableConcept.text = "Gliclazide"
  * strength
    * numerator.value = 30
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"

Instance: med-07-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼藥品-利他能錠 10 毫克"
Description: "電子處方箋-健保代碼 BC27080100 利他能錠 10 毫克 藥品(Medication)資訊範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[nhi-medication] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#BC27080100
  * text = "Methylphenidate Hydrochloride"
* form = $v3-orderableDrugForm#TAB
  * text = "錠劑"
* ingredient
  * itemCodeableConcept.coding = $snomed#42163009 "Methylphenidate hydrochloride (substance)"
  * itemCodeableConcept.text = "Methylphenidate hydrochloride"
  * strength
    * numerator.value = 10
    * numerator.unit = "mg"
    * numerator.code = #mg
    * numerator.system = "http://unitsofmeasure.org"
    * denominator.value = 1
    * denominator.unit = "Tablet"
    * denominator.code = #{tbl}
    * denominator.system = "http://unitsofmeasure.org"