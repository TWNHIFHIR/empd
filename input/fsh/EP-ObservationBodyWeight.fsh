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

* code.coding
  * system 1..1
  * system = "http://loinc.org" (exactly)
  * code 1..1 
  * code = #29463-7 (exactly)
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
* obeys empd-obs-bw-1

Invariant: empd-obs-bw-1
Description: "體重數值總長度不得超過6位數，其中小數不得超過2位（最大 9999.99）。"
Severity: #error
Expression: "value.ofType(Quantity).value.all(toString().matches('^[0-9]{1,4}([.][0-9]{1,2})?$'))"

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
