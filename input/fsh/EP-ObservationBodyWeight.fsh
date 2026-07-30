Alias: $loinc = http://loinc.org
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Profile: ObservationEMPDBodyWeight
Parent: TWCoreObservationVitalSigns
Id: Observation-EMPD-BodyWeight
Title: "電子處方箋-體重"
Description: """此Profiles繼承於臺灣核心-生命體徵(TW Core Observation Vital Signs) Profile，並進一步用於描述電子處方箋之病患體重
若調劑藥物劑量須配合體重而有所調整，則必須使用此Profiles
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.2.1"
* ^date = "2023-10-30"
* code.coding
  * system = "http://loinc.org" (exactly)
  * code = #29463-7 (exactly)
  * display = "Body weight" (exactly)
* value[x] ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* valueQuantity 1..
* valueQuantity only Quantity
  * ^sliceName = "valueQuantity"
  * value 1.. MS
    * ^short = "Numerical value (with implicit precision).[應填入體重 Weight]。若調劑藥物劑量須配合體重而有所調整，此欄位為必填。"
  * code = #kg
  * system = "http://unitsofmeasure.org"
  * unit = "kg"
  * unit MS

Instance: obs-ep
InstanceOf: ObservationEMPDBodyWeight
Title: "電子處方箋-體重"
Description: "電子處方箋-患者體重範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-EMPD-BodyWeight"
* status = #final
* code = $loinc#29463-7 "Body weight"
* subject = Reference(pat-ep)
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* effectiveDateTime = "2023-12-21"
* valueQuantity = 50 'kg' "kg"
* performer = Reference(pra-ep)