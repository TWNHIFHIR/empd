Alias: $medication-nhi-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-nhi-tw
Alias: $v3-orderableDrugForm = http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm

Profile: MedicationDS
Parent: TWCoreMedication
Id: Medication-DS
Title: "調劑單張-藥物處方內容(Medication)"
Description: """此Profiles繼承於臺灣核心-藥品(TW Core Medication) ，並進一步用於描述調劑單張之藥物處方內容  
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* ^date = "2024-01-02"
* identifier MS
  * value MS
    * ^short = "The value that is unique。[應填入藥品批號]"
* code 1..
  * ^short = "指明這種藥品的代碼。[應填入健保代碼、藥品商品名稱 Brand Name與學名 Generic Name]"
* form 1..
  * ^short = "powder ｜ tablets ｜ capsule +此為SNOMED CT代碼，若機構已有購買相關授權，亦可使用。[應填入劑型 Dosage Form]"
  * text 1..
* ingredient 1.. MS
  * strength 1.. MS
    * ^short = "所含成份的劑量。[應填入藥品單位含量]"
* code.coding contains
    nhi-medication 0..1 MS 
* code.coding[nhi-medication] from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedication-vs (required)

Instance: med-01-ds
InstanceOf: MedicationDS
Description: "調劑單張-藥物處方內容(Medication)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-DS"
* identifier.value = "1"
* code = $medication-nhi-tw#A000015421
  * text = "YEN KUANG EYE DROPS"
* form = $v3-orderableDrugForm#TAB
  * text = "TAB"
* ingredient
  * itemCodeableConcept.coding.display = "Alemtuzamab (substance)"
  * strength
    * numerator = 250 'mg'
    * denominator = 250 'mg'
