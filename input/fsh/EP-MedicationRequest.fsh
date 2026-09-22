Alias: $Medication-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD
Alias: $Coverage-EMR = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $medication-path-sct-tw-vs = https://twcore.mohw.gov.tw/ig/twcore/ValueSet/medication-path-sct-tw
Alias: $medication-path-tw-cs = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-path-tw
Alias: $medication-path-tw-vs = https://twcore.mohw.gov.tw/ig/twcore/ValueSet/medication-path-tw
Alias: $TypeOfPrescription-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/TypeOfPrescription-cs
Alias: $TypeOfPrescription-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/TypeOfPrescription-vs
Alias: $OrderType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/OrderType-cs
Alias: $OrderType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/OrderType-vs
Alias: $SelfpayStatus-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/SelfpayStatus-cs
Alias: $SelfpayStatus-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/SelfpayStatus-vs
Alias: $medicationrequest-status = http://hl7.org/fhir/CodeSystem/medicationrequest-status
Alias: $NonNHIMaterial-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NonNHIMaterial-vs
Alias: $NonNHIMaterial-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs
Alias: $NHIMedicationFrequency-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedicationFrequency-cs
Alias: $GTSAbbreviation = http://terminology.hl7.org/CodeSystem/v3-GTSAbbreviation
Alias: $NHIMaterial-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMaterial-vs


ValueSet: MedicationRequestStatusEMPD
Id: medication-request-status-empd
Title: "EMPD MedicationRequest Status"
Description: "電子處方箋允許使用之 MedicationRequest 狀態。"
* ^experimental = false
* ^status = #active

* $medicationrequest-status#active "Active"
* $medicationrequest-status#cancelled "Cancelled"

Profile: MedicationRequestEMPD
Parent: TWCoreMedicationRequest
Id: MedicationRequest-EMPD
Title: "電子處方箋-處方內容(MedicationRequest)"
Description: "此Profile繼承於臺灣核心-藥品處方(TW Core MedicationRequest)，並用於描述電子處方箋的處方內容[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"
* ^status = #active

* extension 1..1 MS
* extension contains ExtensionTotalDuration named TotalMedicationDays 1..1
* extension[TotalMedicationDays] ^short = "擴充的資料項目。[應填入電子處方箋給藥總日份 Total Medication Days]"
  * ^isModifier = false
* extension[TotalMedicationDays].value[x] ^maxValuePositiveInt = 999
* status from MedicationRequestStatusEMPD (required)
* status ^short = "表示處方箋目前之狀態。本實作指引限使用 active 與 cancelled；active 表示處方箋有效，cancelled 表示處方箋已註銷。[應填入處方箋註銷註記]"
* identifier 2..
  * ^short = "此藥品處方的外部識別碼。[應填入處方箋單號 Prescription No.與項次 Item]"
  * ^definition = "與此藥品處方相關的識別碼，這些識別碼是由業務流程定義的，並且/或者在對resource本身的直接URL參照不合適的情況下用來參照它。它們是由執行者或其他系統指定給此resource的業務用識別碼，並隨著resource的更新和從伺服器到伺服器的傳播而保持不變。\r\n項次 Item: 使民眾及藥局確認藥品品項數"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #closed
* identifier contains 
    PrescriptionNo 1..1 MS and
    Item 1..1 MS

* identifier[PrescriptionNo] ^short = "用以識別電子處方箋之處方箋單號"
* identifier[PrescriptionNo].use 1..1 MS
* identifier[PrescriptionNo].use = #usual
* identifier[PrescriptionNo].value 1..1 MS
* identifier[PrescriptionNo].value ^short = "[應填入處方箋單號 Prescription No.]"
* identifier[PrescriptionNo].value ^maxLength = 64

* identifier[Item] ^short = "用以識別電子處方箋中處方項目之項次"
* identifier[Item].use 1..1 MS
* identifier[Item].use = #secondary
* identifier[Item].value 1..1 MS
* identifier[Item].value ^short = "[應填入處方箋項次 Item]"
* identifier[Item].value ^maxLength = 2

* category ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category contains
    typesOfPrescription 1..1 and
    orderType 1..1 and
    selfpayStatus 1..1
* category[typesOfPrescription] from $TypeOfPrescription-vs (required)
  * ^short = "[應填入處方箋種類註記 Types of Prescription]。"
  * ^binding.description = "應填入[MedicationRequestPrescription](ValueSet-TypeOfPrescription-vs.html)值集中的其中一個代碼。"
* category[orderType] from $OrderType-vs (required)
  * ^short = "[應填入醫令類別]。"
  * ^definition = "表示藥品處方的型別（例如：預計用藥或給藥的地方（即住院病人或門診病人）。藉由「醫令類別」區分是否為藥品或特殊材料。"
  * ^binding.description = "醫令類別；應填入[OrderType](ValueSet-OrderType-vs.html)值集中適合的代碼，確定無適合的代碼才可以使用其他值集的代碼來表示。"
* category[selfpayStatus] from $SelfpayStatus-vs (required)
  * ^short = "[應填入自費註記]。用於判別就醫識別碼是否必填。如自費註記為\"Y\"，無須檢核健保代碼。"
  * ^binding.description = "自費註記；應填入[SelfpayStatus](ValueSet-SelfpayStatus-vs.html)值集中適合的代碼。"
* medication[x] only CodeableConcept-tw or Reference($Medication-EMPD)
* medicationCodeableConcept MS
* medicationCodeableConcept.coding contains 
    NHIMaterial 0..1 MS and
    nonNHIMaterial 0..1 MS
* medicationCodeableConcept.coding[fda-medication-tw] 0..0
* medicationCodeableConcept.coding[rxnorm-medication-us-core] 0..0
* medicationCodeableConcept.coding[nhi-medication-tw] 0..0
* medicationCodeableConcept.coding[nhi-medication-ch-herb-tw] 0..0
* medicationCodeableConcept.coding[atc-medication-code] 0..0
* medicationCodeableConcept.coding[snomedct-medication-codes] 0..0
* medicationCodeableConcept.coding[NHIMaterial] 0..1
* medicationCodeableConcept.coding[NHIMaterial] from $NHIMaterial-vs (required)
* medicationCodeableConcept.coding[NHIMaterial] ^short = "此為中央健康保險署(NHI)維護之特材代碼，主要針對申報使用，更新頻率相對頻繁，可免費使用，可依情境選用此代碼。"
* medicationCodeableConcept.coding[NHIMaterial].system 1..1
* medicationCodeableConcept.coding[NHIMaterial].code 1..1
* medicationCodeableConcept.coding[nonNHIMaterial] 0..1 
* medicationCodeableConcept.coding[nonNHIMaterial] from $NonNHIMaterial-vs (example)
* medicationCodeableConcept.coding[nonNHIMaterial] ^short = "無健保代碼之特材健保代碼暫編碼。依下列說明編碼(共12碼):第1- 2 碼依現行特材代碼前 2 碼編碼原則 (2碼)+ 第 3 碼為 半形「 z 」 (1 碼)+ 第 4-9 碼為許可證號 (6 碼)+ 第 10-12 碼為流水號 (3 碼) 。"
* medicationCodeableConcept.coding[nonNHIMaterial] ^definition = "當特材無正式健保代碼時，使用本IG定義之無健保代碼特材暫編碼表示健保代碼欄位。"
* medicationCodeableConcept.coding[nonNHIMaterial].system 1..1 
* medicationCodeableConcept.coding[nonNHIMaterial] ^patternCoding.system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs"
* medicationCodeableConcept.coding[nonNHIMaterial].system ^short = "無健保代碼之特材代碼系統。[請固定填寫此代碼系統]"
* medicationCodeableConcept.coding[nonNHIMaterial].code 1..1 
* medicationCodeableConcept.coding[nonNHIMaterial].code ^short = "第1-2碼依現行特材代碼前2碼編碼原則(2碼)+第3碼為半形「 z 」(1 碼)+ 第 4-9 碼為許可證號 (6 碼)+ 第 10-12 碼為流水號 (3 碼)"
* medicationCodeableConcept.coding[nonNHIMaterial].display 
* medicationCodeableConcept.coding[nonNHIMaterial].display ^short = "無健保代碼之特材名稱"
* medicationReference MS
* medicationReference only Reference($Medication-EMPD)
* insurance 1.. MS
* insurance only Reference(ClaimResponse or $Coverage-EMR)
* dosageInstruction 
  * timing 1..1
    * repeat 0..1 
      * frequency 0..1 MS
        * ^short = "藥品於指定使用時間週期內之使用次數。[應填入藥品使用次數 Frequency]"
    * code 1..1 MS
    * code from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs
      * ^short = "BID ｜ TID ｜ QID ｜ AM ｜ PM ｜ QD ｜ QOD ｜ + [應填入使用時間]"
      * coding 1..* MS
      * coding from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs (required)
      * coding ^short = "藥品使用頻率及服用時間。[應填入藥品使用頻率及服用時間 Usagetime]"
      * text ^short = "藥品使用頻率及使用時間之文字表示，並可補充代碼未能完整表達之資訊。"
  * route 1..1
  * route from $medication-path-sct-tw-vs (extensible)
    * ^short = "藥品應如何進入體內。[應填入給藥途徑 Route of Administration]"
    * coding from $medication-path-tw-vs (extensible)
  * method MS
    * ^short = "用藥的技術。[應填入用藥指示]"
    * text ^short = "給藥方法之文字描述；當無適用代碼可完整表達給藥方法時，可於此以文字說明。"
    * text ^maxLength = 600
  * doseAndRate 1.. MS
    * dose[x] MS
      * ^slicing.discriminator.type = #type
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * doseQuantity 0..1 MS
    * doseQuantity only SimpleQuantity
      * ^sliceName = "doseQuantity"
      * value 1.. MS
        * ^short = "Numerical value (with implicit precision).[應填入劑量 Dose]"
      * unit 1.. MS
        * ^short = "Unit representation.[應填入劑量單位 Dose units]"
        * ^maxLength = 30
* dispenseRequest 1..1 
  * validityPeriod 1..1
    * ^short = "處方可用以配藥的有效期限，包含起日與迄日[應填入處方箋有效日期]"
  * numberOfRepeatsAllowed 1..1
    * ^short = "可重複領藥的次數。[應填入連續處方可調劑次數 Refill Times]"
    * ^maxValueUnsignedInt = 99
  * quantity 1..1 MS
    * value 1.. MS
      * ^short = "Numerical value (with implicit precision).[應填入給藥總量 Total Amount]"
    * unit 1.. MS
      * ^short = "Unit representation.[應填入給藥總量單位 Dose units]"
  * expectedSupplyDuration 0..1
    * ^short = "每次配藥可持續的天數。[應填入給藥日數 Medication Days]，不得超過999天。"
    * value ^maxValueDecimal = 999
    * unit = "d"
    * system = "http://unitsofmeasure.org"
    * code = #d
* substitution MS
  * ^short = "對替代藥品的任何限制。填寫說明：有特殊情況時才填寫。"
  * allowed[x] MS
  * reason 1..1 MS
    * text 1..1
      * ^short = "為什麼要（不）進行替換。[應填入不得以其他廠牌藥品替代之理由]，有特殊情況時才填寫。"
      * ^maxLength = 800
* obeys empd-ord-1
* obeys empd-medreq-2
* obeys empd-medreq-3
* obeys empd-medreq-4
* obeys empd-medreq-5
* obeys empd-medreq-6

Invariant: empd-ord-1
Description: "當醫令類別不是特殊材料（code=3）時，應填寫劑量、劑量單位、頻率、給藥途徑、給藥日數及給藥總量。"
Severity: #error
Expression: "category.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/OrderType-cs' and code = '3').exists() or (dosageInstruction.doseAndRate.dose.ofType(Quantity).value.exists() and dosageInstruction.doseAndRate.dose.ofType(Quantity).unit.exists() and dosageInstruction.timing.code.coding.code.exists() and dosageInstruction.route.exists() and dispenseRequest.expectedSupplyDuration.exists())"

Invariant: empd-medreq-2
Description: "未使用 medicationReference 表示藥品時，應於 medicationCodeableConcept 填寫特材代碼。"
Severity: #error
Expression: "medication.ofType(Reference).exists() or medication.ofType(CodeableConcept).exists()"

Invariant: empd-medreq-3
Description: "無健保代碼之特材暫編碼須符合編碼規則：共12碼，第1-2碼依現行特材代碼前2碼編碼原則(2碼)+第3碼為大寫「Z」(1碼)+第4-9碼為許可證號(6碼)+ 第10-12碼為流水號(3碼)"
Severity: #error
Expression: "medication.ofType(CodeableConcept).exists() implies (medication.ofType(CodeableConcept).coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').exists() and medication.ofType(CodeableConcept).coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs').all(code.matches('^(AC|BB|C[ABCDEFGHKMPRTVX]|F[ABEHNPSU]|H[EFH]|LE|N[ABCE]|RR|S[ACS]|T[BFKS]|W[BD])Z.{6}[0-9]{3}$')))"

Invariant: empd-medreq-4
Description: "當藥品使用頻率為依照醫師指示使用（ASORDER）時，給藥方法（dosageInstruction.method）應填寫。"
Severity: #error
Expression: "dosageInstruction.where(timing.code.coding.where(system = 'https://nhicore.nhi.gov.tw/empd/CodeSystem/NHIMedicationFrequency-cs' and code = 'ASORDER').exists()).all(method.exists())"

Invariant: empd-medreq-5
Description: "劑量（dosageInstruction.doseAndRate.doseQuantity.value）總長度不得超過11位數，其中小數不得超過3位。"
Severity: #error
Expression: "dosageInstruction.doseAndRate.dose.ofType(Quantity).value.all(toString().matches('^[0-9]{1,8}([.][0-9]{1,3})?$'))"

Invariant: empd-medreq-6
Description: "給藥總量（dispenseRequest.quantity.value）總長度不得超過6位數，其中小數不得超過2位。"
Severity: #error
Expression: "dispenseRequest.quantity.value.all(toString().matches('^[0-9]{1,4}([.][0-9]{1,2})?$'))"

Instance: med-req-01-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-健保代碼-YEN KUANG EYE DROPS"
Description: "電子處方箋-處方內容(MedicationRequest)使用健保代碼A000015421 YEN KUANG EYE DROPS。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * use = #usual
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000001"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-01-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#N "非自費"
* dosageInstruction
  * timing.repeat.frequency = 3
  * timing.code = $GTSAbbreviation#TID
  * route = $medication-path-tw-cs#OD
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "drop"
    * system = "http://unitsofmeasure.org"
    * code = #[drp]
* dispenseRequest
  * validityPeriod
    * start = "2026-07-21"
    * end = "2026-07-24"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 3
  * quantity
    * value = 5
    * unit = "mL"
    * system = "http://unitsofmeasure.org"
    * code = #mL
* extension[TotalMedicationDays].valuePositiveInt = 7
* substitution
  * allowedBoolean = true
  * reason.text = "不可替代時始需註明"

Instance: med-req-02-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-食藥署藥品許可證"
Description: "電子處方箋-處方內容(MedicationRequest)使用衛署藥輸字第024969號之可得安穩 320/12.5 毫克膜衣錠。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * use = #usual
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000002"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-02-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#B
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#Y "自費"
* dosageInstruction
  * timing.repeat.frequency = 1
  * timing.code = $GTSAbbreviation#QD
  * route = $medication-path-tw-cs#PO
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-26"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 28
  * quantity
    * value = 28
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* extension[TotalMedicationDays].valuePositiveInt = 28
* substitution
  * allowedBoolean = true
  * reason.text = "不可替代時始需註明"


Instance: med-req-03-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-無健保代碼自費藥物"
Description: "電子處方箋-處方內容(MedicationRequest)使用無健保代碼 Amlodipine 口服懸液 1 mg/mL（院內調製）。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * use = #usual
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000003"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-02-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-03-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#B
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#Y "自費"
* dosageInstruction
  * timing.repeat.frequency = 1
  * timing.code = $GTSAbbreviation#QD
  * route = $medication-path-tw-cs#PO
  * doseAndRate.doseQuantity
    * value = 5
    * unit = "mL"
    * system = "http://unitsofmeasure.org"
    * code = #mL
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-27"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 28
  * quantity
    * value = 140
    * unit = "mL"
    * system = "http://unitsofmeasure.org"
    * code = #mL
* extension[TotalMedicationDays].valuePositiveInt = 28

Instance: med-req-04-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-健保代碼BC071521G0"
Description: "電子處方箋-處方內容(MedicationRequest)使用健保代碼BC071521G0 庫魯化錠 500 毫克。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000004"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-04-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#N "非自費"
* dosageInstruction
  * timing.repeat.frequency = 2 
  * timing.code = $GTSAbbreviation#BID
  * route = $medication-path-tw-cs#PO 
  * doseAndRate.doseQuantity 
    * value = 1
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* dispenseRequest
  * validityPeriod 
    * start = "2026-08-24"
    * end = "2026-08-27"
  * numberOfRepeatsAllowed = 0  
  * expectedSupplyDuration.value = 28  
  * quantity //給藥總量
    * value = 56
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* extension[TotalMedicationDays].valuePositiveInt = 28 // 給藥總日份

Instance: med-req-05-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-健保代碼BC26406100"
Description: "電子處方箋-電子處方箋-處方內容(MedicationRequest)使用健保代碼BC26406100 恩排糖膜衣錠 10 毫克。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000004"
* identifier[Item]
  * use = #secondary
  * value = "2"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-05-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#N "非自費"
* dosageInstruction
  * timing.repeat.frequency = 1
  * timing.code = $GTSAbbreviation#QD
  * route = $medication-path-tw-cs#PO
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-27"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 14
  * quantity
    * value = 14
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* extension[TotalMedicationDays].valuePositiveInt = 28

Instance: med-req-06-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-健保代碼AB48089100"
Description: "電子處方箋-處方內容(MedicationRequest)使用健保代碼AB48089100 代蜜持續性藥效錠 30 毫克。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000004"
* identifier[Item]
  * use = #secondary
  * value = "3"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-06-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#N "非自費"
* dosageInstruction
  * timing.repeat.frequency = 1
  * timing.code = $GTSAbbreviation#QD
  * route = $medication-path-tw-cs#PO
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-27"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 7
  * quantity
    * value = 7
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* extension[TotalMedicationDays].valuePositiveInt = 28

Instance: med-req-07-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-健保代碼BC27080100"
Description: "電子處方箋-處方內容(MedicationRequest)使用健保代碼BC27080100 利他能錠 10 毫克。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000004"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-07-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#D
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#N "非自費"
* dosageInstruction
  * timing.repeat.frequency = 2
  * timing.code = $GTSAbbreviation#BID
  * route = $medication-path-tw-cs#PO
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-26"
  * numberOfRepeatsAllowed = 0
  * expectedSupplyDuration.value = 7
  * quantity
    * value = 14
    * unit = "tablet"
    * system = "http://unitsofmeasure.org"
    * code = #{tbl}
* extension[TotalMedicationDays].valuePositiveInt = 28

Instance: med-req-08-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-無健保代碼特材－冠狀動脈血管內碎石術導管"
Description: "電子處方箋-處方內容(MedicationRequest)使用無健保代碼之特材 冠狀動脈血管內碎石術導管。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[PrescriptionNo]
  * system = "https://nhicore.nhi.gov.tw/empd/identifier/prescription"
  * value = "Med000005"
* identifier[Item]
  * use = #secondary
  * value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#3
* category[selfpayStatus] = $SelfpayStatus-cs#Y "自費"
* medicationCodeableConcept.coding[nonNHIMaterial].system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/NonNHIMaterial-cs"
* medicationCodeableConcept.coding[nonNHIMaterial].code = #CBZ001650001
* medicationCodeableConcept.coding[nonNHIMaterial].display = "“賽禾醫療”冠狀動脈血管內碎石術導管"
* dispenseRequest.quantity.value = 1
* dispenseRequest.quantity.unit = "each"
* dispenseRequest
  * validityPeriod
    * start = "2026-08-24"
    * end = "2026-08-26"
  * numberOfRepeatsAllowed = 0
* extension[TotalMedicationDays].valuePositiveInt = 1