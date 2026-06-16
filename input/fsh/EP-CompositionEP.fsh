Alias: $Coverage-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $Organization-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-EMPD
Alias: $Patient-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-EMPD
Alias: $Practitioner-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-EMPD
Alias: $Encounter-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-EMPD
Alias: $Observation-EMPD-BodyWeight = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-EMPD-BodyWeight
Alias: $Condition-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-EMPD
Alias: $Medication-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD
Alias: $MedicationRequest-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD
Alias: $loinc = http://loinc.org
Alias: $MedicationSelfEMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD

Profile: CompositionEMPD
Parent: TWCoreComposition
Id: Composition-EMPD
Title: "電子處方箋-Composition"
Description: "用於表示電子處方箋資料集之文檔"
* ^version = "0.1.0"
* ^date = "2023-10-30"
* subject 1..
* subject only Reference(Group or Device or Substance or TWCoreLocation or $Patient-EMPD)
  * reference MS
* encounter 1.. MS
* encounter only Reference($Encounter-EMPD)
  * reference MS
* date ^short = "Composition的編輯時間。[處方箋有效日期]。日期格式為西元 YYYYMMDD"
  * ^definition = "包含第二次之後的建議領藥日期。"
* author only Reference($Practitioner-EMPD or $Patient-EMPD or $Organization-EMPD)
  * reference MS
* custodian 1..
* custodian only Reference($Organization-EMPD)
  * reference MS
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code.coding.code"
  * ^slicing.rules = #open
* section contains
    Coverage 1..1 and
    ObservationBodyWeight 0..1 and
    Condition 1..* and
    MedicationPrescribed 1..*
* section[Coverage] ^short = "就醫身分別"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #29762-2 (exactly)
      * display = "Social history Narrative" (exactly)
  * entry 1..
  * entry only Reference($Coverage-EMPD)
    * reference 1..
* section[ObservationBodyWeight] ^short = "體重。若調劑藥物劑量須配合體重而有所調整，此欄位為必填。"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #85353-1 (exactly)
      * display = "Vital signs, weight, height, head circumference, oxygen saturation and BMI panel" (exactly)
  * entry 1..1
  * entry only Reference($Observation-EMPD-BodyWeight)
    * reference 1..
* section[Condition] ^short = "診斷"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #29548-5 (exactly)
      * display = "Diagnosis Narrative" (exactly)
  * entry 1..
  * entry only Reference($Condition-EMPD)
    * reference 1..
* section[MedicationPrescribed] ^short = "處方內容"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #29551-9 (exactly)
      * display = "Medication prescribed Narrative" (exactly)
  * entry only Reference($Medication-EMPD or $MedicationSelfEMPD or $MedicationRequest-EMPD)
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
  * entry contains
      Medication 1..* and
      MedicationRequest 1..*
  * entry[Medication] only Reference($Medication-EMPD or $MedicationSelfEMPD)
    * reference 1..
  * entry[MedicationRequest] only Reference($MedicationRequest-EMPD)
    * reference 1..

Instance: com-ep
InstanceOf: CompositionEMPD
Description: "電子處方箋-Composition範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Composition-EMPD"
* status = #final
* type = $loinc#57833-6 "Prescription for medication"
* subject = Reference(Patient/pat-ep)
* custodian = Reference(Organization/org-ep)
* encounter = Reference(Encounter/enc-ep)
* date = "2024-02-19T14:30:00+01:00"
* author[0] = Reference(Organization/org-ep)
* author[+] = Reference(Practitioner/pra-ep)
* title = "電子處方箋"
* section[Coverage].code = $loinc#29762-2
* section[Coverage].code.text = "Social history Narrative"
* section[Coverage].entry = Reference(Coverage/cov-ep)
* section[ObservationBodyWeight].code = $loinc#85353-1
* section[ObservationBodyWeight].code.text = "Vital signs, weight, height, head circumference, oxygen saturation and BMI panel"
* section[ObservationBodyWeight].entry = Reference(Observation/obs-ep)
* section[Condition].code = $loinc#29548-5
* section[Condition].code.text = "Diagnosis Narrative"
* section[Condition].entry = Reference(Condition/con-ep)
* section[MedicationPrescribed].code = $loinc#29551-9
* section[MedicationPrescribed].code.text = "Medication prescribed Narrative Narrative"
* section[MedicationPrescribed].entry[0] = Reference(Medication/med-01-ep)
* section[MedicationPrescribed].entry[+] = Reference(Medication/MedicationSelfEMPD-non01)
* section[MedicationPrescribed].entry[+] = Reference(MedicationRequest/med-req-01-ep)