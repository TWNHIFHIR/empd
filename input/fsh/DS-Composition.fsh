Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $Practitioner-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS
Alias: $Organization-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Organization-DS
Alias: $Coverage-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $Observation-DS-BodyWeight = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Observation-DS-BodyWeight
Alias: $Condition-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Condition-DS
Alias: $MedicationRequest-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-DS
Alias: $Medication-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-DS
Alias: $MedicationDispense-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationDispense-DS
Alias: $ChargeItem-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/ChargeItem-DS
Alias: $Media-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Media-DS
Alias: $loinc = http://loinc.org
Alias: $MedicationSelfEMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-Self-EMPD

Profile: CompositionDS
Parent: TWCoreComposition
Id: Composition-DS
Title: "調劑單張-Composition"
Description: "用於表示調劑單張資料集之文檔"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* subject 1..
* subject only Reference($Patient-DS)
* encounter 1.. MS
* encounter only Reference($Encounter-DS)
* author only Reference($Patient-DS or $Practitioner-DS or $Organization-DS)
* custodian 1..
* custodian only Reference($Organization-DS)
* section ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "code.coding.code"
  * ^slicing.rules = #open
* section contains
    Coverage 1..1 and
    BodyWeight 0..1 and
    Condition 1..* and
    MedicationPrescribed 1..* and
    Media 0..*
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
* section[BodyWeight] ^short = "體重"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #85353-1 (exactly)
      * display = "Vital signs, weight, height, head circumference, oxygen saturation and BMI panel" (exactly)
  * entry 1..
  * entry only Reference($Observation-DS-BodyWeight)
* section[Condition] ^short = "診斷"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #29548-5 (exactly)
      * display = "Diagnosis Narrative" (exactly)
  * entry 1..
  * entry only Reference($Condition-DS)
* section[MedicationPrescribed] ^short = "處方內容"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #29551-9 (exactly)
      * display = "Medication prescribed Narrative" (exactly)
  * entry only Reference($MedicationRequest-DS or $Medication-DS or $MedicationSelfEMPD or $MedicationDispense-DS or $ChargeItem-DS)
    * ^slicing.discriminator.type = #profile
    * ^slicing.discriminator.path = "resolve()"
    * ^slicing.rules = #open
  * entry contains
      MedicationRequest 1..* and
      Medication 1..* and
      MedicationDispense 1..* and
      sliceEntry 0..1
  * entry[MedicationRequest] only Reference($MedicationRequest-DS)
  * entry[Medication] only Reference($Medication-DS or $MedicationSelfEMPD)
  * entry[MedicationDispense] only Reference($MedicationDispense-DS)
  * entry[sliceEntry] only Reference($ChargeItem-DS)
* section[Media] ^short = "領藥者數位簽章"
  * code 1..
    * coding 1..
      * system 1..
      * system = "http://loinc.org" (exactly)
      * code 1..
      * code = #85647-6 (exactly)
  * entry 1..
  * entry only Reference($Media-DS)

Instance: com-ds
InstanceOf: CompositionDS
Description: "調劑單張-Composition範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Composition-DS"
* status = #final
* type = $loinc#29304-3 "Medication dispensed"
* subject = Reference(Patient/pat-ds)
* custodian = Reference(Organization/org-dis-ds)
* encounter = Reference(Encounter/enc-ds)
* date = "2024-02-19T14:30:00+01:00"
* author[0] = Reference(Organization/org-ds)
* author[+] = Reference(Organization/org-dis-ds)
* author[+] = Reference(Practitioner/pra-ds)
* author[+] = Reference(Practitioner/pra-dis-ds)
* title = "調劑單張"
* section[Coverage].code = $loinc#29762-2
* section[Coverage].code.text = "Social history Narrative"
* section[Coverage].entry = Reference(Coverage/cov-ds)
* section[BodyWeight].code = $loinc#85353-1
* section[BodyWeight].code.text = "Vital signs, weight, height, head circumference, oxygen saturation and BMI panel"
* section[BodyWeight].entry = Reference(Observation/obs-ds)
* section[Condition].code = $loinc#29548-5
* section[Condition].code.text = "Diagnosis Narrative"
* section[Condition].entry = Reference(Condition/con-ds)
* section[MedicationPrescribed].code = $loinc#29551-9
* section[MedicationPrescribed].code.text = "Medication prescribed Narrative Narrative"
* section[MedicationPrescribed].entry[0] = Reference(Medication/med-01-ds)
* section[MedicationPrescribed].entry[+] = Reference(Medication/MedicationSelfEMPD-non01)
* section[MedicationPrescribed].entry[+] = Reference(MedicationRequest/med-req-01-ds)
* section[MedicationPrescribed].entry[+] = Reference(MedicationDispense/med-dis-01-ds)
* section[MedicationPrescribed].entry[+] = Reference(ChargeItem/cha-ds)
* section[Media].code = $loinc#85647-6
* section[Media].code.text = "Signature of person collecting or coordinating collection of assessment information Provider"
* section[Media].entry = Reference(Media/media-ds)