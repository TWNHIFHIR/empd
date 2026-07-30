Alias: $Composition-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Composition-DS
Alias: $Organization-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-DS
Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $ChargeItem-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/ChargeItem-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $Condition-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-DS
Alias: $Practitioner-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS
Alias: $Medication-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-DS
Alias: $MedicationRequest-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-DS
Alias: $Observation-DS-BodyWeight = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-DS-BodyWeight
Alias: $Coverage-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $Media-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Media-DS
Alias: $MedicationDispense-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationDispense-DS
Alias: $MedicationSelfEMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD
Alias: $MedicationSelfEMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD

Profile: BundleDS
Parent: TWCoreBundle
Id: Bundle-DS
Title: "調劑單張-Bundle"
Description: "Profiles用於打包調劑單張所有相關資料，利用此Bundle時請使用document方式將資料進行打包，Bundle所包含之Resource應與Composition涵蓋數量保持一致，且所有的Resource必須符合調劑單張各資料規範，其相關規範(Structure Definition)與範例(Example)可分別於Bundle內entry的url連結或是在Composition進行查閱。"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* type MS
* entry MS
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open
* entry contains
    Composition 1..* MS and
    Organization 1..* MS and
    Patient 1..* MS and
    ChargeItem 1..* MS and
    Encounter 1..* MS and
    Condition 1..* MS and
    Practitioner 1..* MS and
    Medication 1..* MS and
    MedicationRequest 1..* MS and
    ObservationBodyWeight 0..1 MS and
    Coverage 1..1 MS and
    Media 0..* MS and
    MedicationDispense 1..* MS
* entry[Composition].resource 1.. MS
* entry[Composition].resource only $Composition-DS
* entry[Organization].resource 1.. MS
* entry[Organization].resource only $Organization-DS
* entry[Patient].resource 1.. MS
* entry[Patient].resource only $Patient-DS
* entry[ChargeItem].resource 1.. MS
* entry[ChargeItem].resource only $ChargeItem-DS
* entry[Encounter].resource 1.. MS
* entry[Encounter].resource only $Encounter-DS
* entry[Condition].resource 1.. MS
* entry[Condition].resource only $Condition-DS
* entry[Practitioner].resource 1.. MS
* entry[Practitioner].resource only $Practitioner-DS
* entry[Medication].resource 1.. MS
* entry[Medication].resource only $Medication-DS or $MedicationSelfEMPD
* entry[MedicationRequest].resource 1.. MS
* entry[MedicationRequest].resource only $MedicationRequest-DS
* entry[ObservationBodyWeight].resource 1.. MS
* entry[ObservationBodyWeight].resource only $Observation-DS-BodyWeight
* entry[Coverage].resource 1.. MS
* entry[Coverage].resource only $Coverage-EMPD
* entry[Media].resource 1.. MS
* entry[Media].resource only $Media-DS
* entry[MedicationDispense].resource 1.. MS
* entry[MedicationDispense].resource only $MedicationDispense-DS

Instance: bun-ds
InstanceOf: BundleDS
Description: "調劑單張-Bundle範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-DS"
* identifier
  * value = "Bundle-DS"
  * system = "http://www.moi.gov.tw/"
* type = #document
* timestamp = "2024-02-19T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-ds"
  * resource = com-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ds"
  * resource = pat-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-ds"
  * resource = org-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-dis-ds"
  * resource = org-dis-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-ds"
  * resource = pra-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-dis-ds"
  * resource = pra-dis-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-ds"
  * resource = enc-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-ds"
  * resource = con-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ds"
  * resource = obs-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-ds"
  * resource = cov-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/ChargeItem/cha-ds"
  * resource = cha-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-01-ds"
  * resource = med-01-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/MedicationSelfEMPD-non01"
  * resource = MedicationSelfEMPD-non01
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-01-ds"
  * resource = med-req-01-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationDispense/med-dis-01-ds"
  * resource = med-dis-01-ds
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Media/media-ds"
  * resource = media-ds