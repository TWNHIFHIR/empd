Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $loinc = http://loinc.org
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Profile: ObservationDSBodyWeight
Parent: TWCoreObservationVitalSigns
Id: Observation-DS-BodyWeight
Title: "調劑單張-病患體重"
Description: """此Profiles繼承於臺灣核心-生命體徵(TW Core Observation Vital Signs) Profile，並進一步用於描述調劑單張之病患體重。
若調劑藥物劑量須配合體重而有所調整，此Profiles為必填。
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.1.0"
* ^date = "2024-01-02"
* code.coding
  * system = "http://loinc.org" (exactly)
  * code = #29463-7 (exactly)
  * display = "Body weight" (exactly)
* subject only Reference($Patient-DS)
* encounter only Reference($Encounter-DS)
* value[x] ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* valueQuantity 1..
* valueQuantity only Quantity
  * ^sliceName = "valueQuantity"
  * ^short = "檢驗檢查的實際結果。[應填入體重 Weight]。若調劑藥物劑量須配合體重而有所調整，此欄位為必填"
  * value 1.. MS
  * code = #kg
  * system = "http://unitsofmeasure.org"
  * unit = "kg"
  * unit MS

Instance: obs-ds
InstanceOf: ObservationDSBodyWeight
Description: "調劑單張-病患體重範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-DS-BodyWeight"
* status = #final
* code = $loinc#29463-7 "Body weight"
* subject = Reference(Patient/pat-ds)
* encounter = Reference(Encounter/enc-ds)
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* effectiveDateTime = "2023-12-21"
* valueQuantity = 50 'kg' "kg"
* performer = Reference(Practitioner/pra-dis-ds)