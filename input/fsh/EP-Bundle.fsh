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

Profile: BundleEMPD
Parent: TWCoreBundle
Id: Bundle-EMPD
Title: "電子處方箋-Bundle"
Description: "此Profiles用於打包電子處方箋所有相關資料，利用此Bundle時請使用document方式將資料進行打包，Bundle所包含之Resource應與Composition涵蓋數量保持一致，且所有的Resource必須符合電子處方箋各資料規範，其相關規範(Structure Definition)與範例(Example)可分別於Bundle內entry的url連結或是在Composition進行查閱。"
* ^version = "0.2.1"

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
    Medication 0..* MS and
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
* entry[Medication].resource only $Medication-EMPD
* entry[MedicationRequest].resource 1.. MS
* entry[MedicationRequest].resource only $MedicationRequest-EMPD 
* obeys enc-nhi-1
* obeys empd-medreq-1

Invariant: enc-nhi-1
Description: "當就醫身分別為健保時，健保卡就醫序號為必填。"
Severity: #error
Expression: "entry.resource.ofType(Coverage).where(type.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-identity-type' and code = '00').exists()).exists() implies entry.resource.ofType(Encounter).identifier.where(system = 'https://nhicore.nhi.gov.tw/empd/func-sequence-number').exists()"

Invariant: empd-medreq-1
Description: "當處方箋種類註記為管制藥品（D、E、F）時，醫師證號及管制藥品醫師證號皆須填寫。"
Severity: #error
Expression: "entry.resource.ofType(MedicationRequest).where(category.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/TypeOfPrescription-cs' and (code = 'D' or code = 'E' or code = 'F')).exists()).exists().not() or entry.resource.ofType(Composition).author.resolve().ofType(Practitioner).where(identifier.where(type.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v2-0203' and code = 'MD').exists()).exists() and qualification.identifier.where(system = 'https://cdmis.fda.gov.tw').exists()).exists()"

Instance: bun-01-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-健保代碼用藥-Bundle"
Description: "電子處方箋-使用健保藥品代碼之用藥處方文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000001"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-01-ep"
  * resource = com-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-01-ep"
  * resource = pra-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-01-ep"
  * resource = enc-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-01-ep"
  * resource = con-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-01-ep"
  * resource = cov-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-01-ep"
  * resource = med-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-01-ep"
  * resource = med-req-01-ep

Instance: bun-02-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-食藥署藥品-Bundle"
Description: "電子處方箋-使用食藥署藥品許可證字號之用藥處方文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000002"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-02-ep"
  * resource = com-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-01-ep"
  * resource = pra-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-01-ep"
  * resource = enc-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-02-ep"
  * resource = con-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-01-ep"
  * resource = cov-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-02-ep"
  * resource = med-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-02-ep"
  * resource = med-req-02-ep

Instance: bun-03-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-無健保代碼用藥-Bundle"
Description: "電子處方箋-使用無健保代碼藥品之用藥處方文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000003"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-03-ep"
  * resource = com-03-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-01-ep"
  * resource = pra-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-02-ep"
  * resource = enc-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-02-ep"
  * resource = con-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-02-ep"
  * resource = cov-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-03-ep"
  * resource = med-03-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-03-ep"
  * resource = med-req-03-ep

Instance: bun-04-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-多項用藥-Bundle"
Description: "電子處方箋-包含多項藥品之用藥處方文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000004"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-04-ep"
  * resource = com-04-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-01-ep"
  * resource = pra-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-01-ep"
  * resource = enc-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-04-ep"
  * resource = con-04-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-01-ep"
  * resource = cov-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-04-ep"
  * resource = med-04-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-05-ep"
  * resource = med-05-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-06-ep"
  * resource = med-06-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-04-ep"
  * resource = med-req-04-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-05-ep"
  * resource = med-req-05-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-06-ep"
  * resource = med-req-06-ep

Instance: bun-05-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-健保代碼管制藥品-Bundle"
Description: "電子處方箋-使用健保藥品代碼之管制藥品處方文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000005"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-05-ep"
  * resource = com-05-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-02-ep"
  * resource = pra-02-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-01-ep"
  * resource = enc-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-05-ep"
  * resource = con-05-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-01-ep"
  * resource = cov-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Medication/med-07-ep"
  * resource = med-07-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-07-ep"
  * resource = med-req-07-ep

Instance: bun-06-ep
InstanceOf: BundleEMPD
Title: "電子處方箋-特材-Bundle"
Description: "電子處方箋-包含特材處方內容之文件Bundle範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Bundle-EMPD"
* identifier
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000005"
* type = #document
* timestamp = "2026-08-31T14:30:00+01:00"
* entry[0]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Composition/com-06-ep"
  * resource = com-06-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Patient/pat-ep"
  * resource = pat-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Organization/org-01-ep"
  * resource = org-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Practitioner/pra-01-ep"
  * resource = pra-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Encounter/enc-01-ep"
  * resource = enc-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Observation/obs-ep"
  * resource = obs-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Condition/con-03-ep"
  * resource = con-03-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/Coverage/cov-01-ep"
  * resource = cov-01-ep
* entry[+]
  * fullUrl = "https://nhicore.nhi.gov.tw/empd/MedicationRequest/med-req-08-ep"
  * resource = med-req-08-ep