Alias: $Coverage-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $Composition-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Composition-EMPD
Alias: $Organization-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD
Alias: $Patient-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-EMPD
Alias: $Practitioner-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-EMPD
Alias: $Encounter-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-EMPD
Alias: $Observation-EMPD-BodyWeight = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-EMPD-BodyWeight
Alias: $Condition-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD
Alias: $Medication-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD
Alias: $MedicationRequest-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD
Alias: $MedicationSelfEMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD

Profile: BundleEMPD
Parent: TWCoreBundle
Id: Bundle-EMPD
Title: "電子處方箋-Bundle"
Description: "此Profiles用於打包電子處方箋所有相關資料，利用此Bundle時請使用document方式將資料進行打包，Bundle所包含之Resource應與Composition涵蓋數量保持一致，且所有的Resource必須符合電子處方箋各資料規範，其相關規範(Structure Definition)與範例(Example)可分別於Bundle內entry的url連結或是在Composition進行查閱。"
* ^version = "0.1.0"
* ^date = "2023-10-30"
* type MS
* entry MS
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open
* entry contains
    Composition 1..* MS and
    Organization 1..1 MS and
    Patient 1..1 MS and
    Practitioner 1..1 MS and
    Encounter 1..1 MS and
    CoverageIdentifier 1..1 MS and
    ObservationBodyWeight 0..1 MS and
    Condition 1..* MS and
    Medication 1..* MS and
    MedicationRequest 1..* MS
* entry[Composition].resource 1.. MS
* entry[Composition].resource only $Composition-EMPD
* entry[Organization].resource 1.. MS
* entry[Organization].resource only $Organization-EMPD
* entry[Patient].resource 1.. MS
* entry[Patient].resource only $Patient-EMPD
* entry[Practitioner].resource 1.. MS
* entry[Practitioner].resource only $Practitioner-EMPD
* entry[Encounter].resource 1.. MS
* entry[Encounter].resource only $Encounter-EMPD
* entry[CoverageIdentifier].resource 1.. MS
* entry[CoverageIdentifier].resource only $Coverage-EMPD
* entry[ObservationBodyWeight] ^short = "若調劑藥物劑量須配合體重而有所調整，此欄位為必填"
  * resource 1.. MS
  * resource only $Observation-EMPD-BodyWeight
* entry[Condition].resource 1.. MS
* entry[Condition].resource only $Condition-EMPD
* entry[Medication].resource 1.. MS
* entry[Medication].resource only $Medication-EMPD or $MedicationSelfEMPD
* entry[MedicationRequest].resource 1.. MS
* entry[MedicationRequest].resource only $MedicationRequest-EMPD

Instance: bun-ep
InstanceOf: BundleEMPD
Description: "電子處方箋-Bundle範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * value = "bun-10"
  * system = "http://www.moi.gov.tw/"
* type = #document
* timestamp = "2024-02-19T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-ep"
  * resource = com-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-ep"
  * resource = org-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-ep"
  * resource = pra-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-ep"
  * resource = enc-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-ep"
  * resource = con-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-ep"
  * resource = cov-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-01-ep"
  * resource = med-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/MedicationSelfEMPD-non01"
  * resource = MedicationSelfEMPD-non01
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-01-ep"
  * resource = med-req-01-ep