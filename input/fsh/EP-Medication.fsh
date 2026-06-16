Alias: $medication-nhi-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-nhi-tw
Alias: $v3-orderableDrugForm = http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm

Profile: MedicationEMPD
Parent: TWCoreMedication
Id: Medication-EMPD
Title: "電子處方箋-藥物處方內容(Medication)"
Description: """此Profiles繼承於臺灣核心-藥品(TW Core Medication) ，並進一步用於描述電子處方箋之藥物處方內容  
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.1.0"
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

Instance: med-01-ep
InstanceOf: MedicationEMPD
Description: "電子處方箋-藥物處方內容(Medication)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD"
* code = $medication-nhi-tw#A000015421
  * text = "YEN KUANG EYE DROPS"
* form = $v3-orderableDrugForm#TAB
  * text = "TAB"
* ingredient
  * itemCodeableConcept.coding.display = "Alemtuzamab (substance)"
  * strength
    * numerator = 250 'mg'
    * denominator = 250 'mg'
