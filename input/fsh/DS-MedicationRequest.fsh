Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $Extension-TotalDuration = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-TotalDuration
Alias: $Medication-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-DS
Alias: $Coverage-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $sct = http://snomed.info/sct
Alias: $TypeOfPrescription-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/TypeOfPrescription-cs
Alias: $TypeOfPrescription-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/TypeOfPrescription-vs
Alias: $DispenseType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/DispenseType-cs
Alias: $DispenseType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/DispenseType-vs
Alias: $SelfpayStatus-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/SelfpayStatus-cs
Alias: $SelfpayStatus-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/SelfpayStatus-vs

Profile: MedicationRequestDS
Parent: TWCoreMedicationRequest
Id: MedicationRequest-DS
Title: "調劑單張-處方內容(MedicationRequest)"
Description: "此Profile繼承於臺灣核心-藥品處方(TW Core MedicationRequest)，並用於描述調劑單張的處方內容[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"
* ^date = "2024-01-02"
* extension MS
* extension contains $Extension-TotalDuration named TotalMedicationDays 1..1
* extension[TotalMedicationDays] ^short = "擴充的資料項目。[應填入調劑單張給藥總日份 Total Medication Days]"
  * ^isModifier = false
* identifier 1..
  * ^short = "此藥品處方的外部識別碼。[應填入處方箋存取授權碼/處方箋單號 Prescription No./連續處方箋調劑序號]。至少需填入處方箋單號 Prescription No."
* category ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    typesOfPrescription 1..1 and
    dispenseType 0..1 and
    selfpayStatus 1..1
* category[typesOfPrescription] from $TypeOfPrescription-vs (required)
  * ^short = "用藥型別。[應填入處方箋種類註記 Types of Prescription]。"
  * ^binding.description = "應填入[MedicationRequestPrescription](ValueSet-TypeOfPrescription-vs.html)值集中的其中一個代碼。"
* category[dispenseType] from $DispenseType-vs (required)
  * ^short = "醫令調劑方式。[應填入醫令調劑方式]。"
  * ^binding.description = "醫令調劑方式；應填入[OrderType](ValueSet-DispenseType-vs.html)值集中適合的代碼，確定無適合的代碼才可以使用其他值集的代碼來表示。"
* category[selfpayStatus] from $SelfpayStatus-vs (required)
  * ^short = "自費註記。用於判別就醫識別碼是否必填。如自費註記為"Y"，無須檢核健保代碼。"
  * ^binding.description = "自費註記；應填入[SelfpayStatus](ValueSet-SelfpayStatus-vs.html)值集中適合的代碼。"
* medication[x] only CodeableConcept-tw or Reference($Medication-DS)
* medicationCodeableConcept MS
* medicationCodeableConcept.coding contains
    nhi-medication 0..1 MS 
* medicationCodeableConcept.coding[nhi-medication] from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedication-vs (required)
* medicationReference MS
* medicationReference only Reference($Medication-DS)
* subject only Reference(Group or $Patient-DS)
* encounter only Reference($Encounter-DS)
* authoredOn ^short = "藥品處方請求最初何時被撰寫？[應填入取藥時間]"
  * ^definition = "處方最初書寫或撰寫的日期（或許也有時間）。\r\n格式：西元YYYYMMDD HH:MM:SS"
* insurance 1.. MS
* insurance only Reference(ClaimResponse or $Coverage-EMPD)
* note
  * ^short = "關於處方的資訊或其他相關備註說明。[應填入處方箋註銷註記/須被合併之處方箋註記]。至少需填入須被合併之處方箋註記"
  * ^definition = "關於處方的附加資訊，不能由其他屬性來傳達。\r\n[須被合併之處方箋註記]：合併請填是，預設值為「否」。說明：同時開立管制藥品及一般藥品時，須開立二張處方箋，並在這二張處方箋此欄位上註記「是」"
* dosageInstruction
  * timing
    * code from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs
      * coding from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs (required)
  * method MS
    * ^short = "用藥的技術。[應填入用藥指示]"
* dispenseRequest 1..
  * validityPeriod 1..
    * start 1.. MS
      * ^short = "Starting time with inclusive boundary。[應填入調劑時間]"
      * ^definition = "The start of the period. The boundary is inclusive.\r\n格式：西元YYYYMMDD HH:MM:SS"
    * end 1.. MS
      * ^short = "End time with inclusive boundary, if not ongoing。[應填入處方箋有效日期]"
      * ^definition = "The end of the period. If the end of the period is missing, it means no end was known or planned at the time the instance was created. The start may be in the past, and the end date in the future, which means that period is expected/planned to end at that time.\r\n包含第二次之後的建議領藥日期；格式為西元YYYYMMDD"
  * numberOfRepeatsAllowed 1..
    * ^short = "可重複領藥的次數。[應填入連續處方可調劑次數 Refill Times]"

Instance: med-req-01-ds
InstanceOf: MedicationRequestDS
Description: "調劑單張-處方內容(MedicationRequest)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-DS"
* identifier[0]
  * system = "http://www.moi.gov.tw/"
  * value = "Med000001"
* identifier[+].value = "7"
* insurance = Reference(cov-ds)
* status = #active
* authoredOn = "2024-01-12T00:00:00+08:00"
* intent = #order
* medicationReference = Reference(med-01-ds)
* subject = Reference(pat-ds)
* encounter = Reference(enc-ds)
* category[typesOfPrescription] = $TypeOfPrescription-cs#B "慢性病處方箋"
* category[dispenseType] = $DispenseType-cs#0 "自行調劑、檢驗(查)或物理治療"
* category[selfpayStatus] = $SelfpayStatus-cs#00 "自費"
* dosageInstruction.method = $sct#419385000 "Use"
* dispenseRequest
  * validityPeriod
    * start = "2024-01-12T00:00:00+08:00"
    * end = "2024-01-19T00:00:00+08:00"
  * numberOfRepeatsAllowed = 1
* note[0].text = "A"
* note[+].text = "否"
* extension
  * url = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-TotalDuration"
  * valueQuantity
    * value = 7
    * unit = "days"