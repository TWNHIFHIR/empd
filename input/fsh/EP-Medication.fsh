Alias: $medication-nhi-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-nhi-tw
Alias: $v3-orderableDrugForm = http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm
Alias: $snomed = http://snomed.info/sct

Profile: MedicationEMPD
Parent: TWCoreMedication
Id: Medication-EMPD
Title: "電子處方箋-藥物處方內容(Medication)"
Description: """此Profiles繼承於臺灣核心-藥品(TW Core Medication) ，並進一步用於描述電子處方箋之藥物處方內容  
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* ^date = "2023-10-30"
* code 1..1
  * ^short = "指明這種藥品的代碼。[應填入健保代碼與藥品商品名稱 Brand Name]，健保代碼(code)；商品名稱 Brand Name(display)。"
  * text 1..
    * ^short = "概念的文字表示法。[應填入學名 Generic Name]"
* form 1..
  * ^short = "powder ｜ tablets ｜ capsule +此為SNOMED CT代碼，若機構已有購買相關授權，亦可使用。[應填入劑型 Dosage Form]"
  * text 1..
* ingredient.strength 1.. MS
  * ^short = "所含成份的劑量。[應填入藥品單位含量]"
* code.coding contains
    nhi-medication 0..1 MS 
* code.coding[nhi-medication] from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedication-vs (required)


Instance: med-01-ep
InstanceOf: MedicationEMPD
Title: "電子處方箋-健保代碼之藥品"
Description: "電子處方箋-藥物處方內容(Medication)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code
  * coding[0] = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedication-cs#A000015421
  * text = "YEN KUANG EYE DROPS"
* form = $v3-orderableDrugForm#OPDROP
  * text = "Ophthalmic Drops"
* ingredient
  * itemCodeableConcept.coding = $snomed#363528007 "Sulfamethoxazole (substance)"
  * itemCodeableConcept.text = "Sulfamethoxazole Sodium"
  * strength
    * numerator.value = 20
    * numerator.unit = "mg"
    * denominator.value = 1
    * denominator.unit = "ml"
