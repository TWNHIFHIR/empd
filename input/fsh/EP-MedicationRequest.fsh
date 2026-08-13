Alias: $Medication-EMPD = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-EMPD
Alias: $Coverage-EMR = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR
Alias: $medication-path-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-path-tw
Alias: $TypeOfPrescription-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/TypeOfPrescription-cs
Alias: $TypeOfPrescription-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/TypeOfPrescription-vs
Alias: $OrderType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/OrderType-cs
Alias: $OrderType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/OrderType-vs
Alias: $SelfpayStatus-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/SelfpayStatus-cs
Alias: $SelfpayStatus-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/SelfpayStatus-vs

Profile: MedicationRequestEMPD
Parent: TWCoreMedicationRequest
Id: MedicationRequest-EMPD
Title: "電子處方箋-處方內容(MedicationRequest)"
Description: "此Profile繼承於臺灣核心-藥品處方(TW Core MedicationRequest)，並用於描述電子處方箋的處方內容[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"
* ^version = "0.2.1"
* ^status = #active
* ^date = "2023-10-30"
* extension 0..1 MS
* extension contains ExtensionTotalDuration named TotalMedicationDays 0..1
* extension[TotalMedicationDays] ^short = "擴充的資料項目。[應填入電子處方箋給藥總日份 Total Medication Days]"
  * ^isModifier = false
* identifier 2..
  * ^short = "此藥品處方的外部識別碼。[應填入處方箋單號 Prescription No.與項次 Item]"
  * ^definition = "與此藥品處方相關的識別碼，這些識別碼是由業務流程定義的，並且/或者在對resource本身的直接URL參照不合適的情況下用來參照它。它們是由執行者或其他系統指定給此resource的業務用識別碼，並隨著resource的更新和從伺服器到伺服器的傳播而保持不變。\r\n項次 Item: 使民眾及藥局確認藥品品項數"
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
  * ^short = "[應填入自費註記]。用於判別就醫識別碼是否必填。如自費註記為"Y"，無須檢核健保代碼。"
  * ^binding.description = "自費註記；應填入[SelfpayStatus](ValueSet-SelfpayStatus-vs.html)值集中適合的代碼。"
* medication[x] only CodeableConcept-tw or Reference($Medication-EMPD)
* medicationCodeableConcept MS
* medicationCodeableConcept.coding contains
    nhi-medication 0..1 MS 
* medicationCodeableConcept.coding[nhi-medication] from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedication-vs (required)
* medicationReference MS
* insurance 1.. MS
* insurance only Reference(ClaimResponse or $Coverage-EMR)
* note ^short = "關於處方的資訊或其他相關備註說明。[應填入處方箋註銷註記/須被合併之處方箋註記]。"
* dosageInstruction 1..1
  * timing 1..1
    * repeat 1..1 MS
      * frequency 1..1 MS
        * ^short = "此事件於每一期間的發生頻率。[應填入頻率 Frequency]"
    * code from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs
      * ^short = "BID ｜ TID ｜ QID ｜ AM ｜ PM ｜ QD ｜ QOD ｜ + [應填入使用時間]"
      * coding from https://nhicore.nhi.gov.tw/empd/ValueSet/NHIMedicationFrequency-HL7-vs (required)
  * route 1..1
    * ^short = "藥品應如何進入體內。[應填入給藥途徑 Route of Administration]"
  * method MS
    * ^short = "用藥的技術。[應填入用藥指示]"
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
        * ^short = "Unit representation.[應填入劑量單位 Dose Units]"
* dispenseRequest
  * validityPeriod 1..1
    * ^short = "處方可用以配藥的有效期限[應填入處方箋有效日期]"
  * numberOfRepeatsAllowed 1..1
    * ^short = "可重複領藥的次數。[應填入連續處方可調劑次數 Refill Times]"
  * quantity 1..1 MS
    * value 1.. MS
      * ^short = "Numerical value (with implicit precision).[應填入給藥總量 Total Amount]"
    * unit 1.. MS
      * ^short = "Unit representation.[應填入給藥總量單位 Total Units]"
  * expectedSupplyDuration 1..1
    * ^short = "每次配藥可持續的天數。[應填入給藥日數 Medication Days]"
* substitution MS
  * ^short = "對替代藥品的任何限制。填寫說明：有特殊情況時才填寫。"
  * allowed[x] MS
  * reason MS
    * ^short = "為什麼要（不）進行替換。[應填入不得以其他廠牌藥品替代之理由]，有特殊情況時才填寫。"
/* obeys empd-ord-1

Invariant: empd-ord-1
Description: "當醫令類別不是特殊材料(code=3)時，應檢核劑量、劑量單位、頻率、使用時間、給藥途徑、給藥日數、給藥總量與給藥總日份。"
Severity: #error
Expression: "category.where(coding.system='https://nhicore.nhi.gov.tw/empd/CodeSystem/OrderType-cs' and coding.code='3').exists() or (dosageInstruction.exists() and dispenseRequest.quantity.value.exists() and dispenseRequest.quantity.unit.exists() and dispenseRequest.expectedSupplyDuration.exists())"
*/

Instance: med-req-01-ep
InstanceOf: MedicationRequestEMPD
Title: "電子處方箋-處方內容-健保代碼"
Description: "電子處方箋-處方內容(MedicationRequest)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationRequest-EMPD"
* identifier[0]
  * system = "http://www.moi.gov.tw/"
  * value = "Med000001"
* identifier[+].value = "1"
* insurance = Reference(cov-01-ep)
* status = #active
* intent = #order
* medicationReference = Reference(med-01-ep)
* subject = Reference(pat-ep)
* category[typesOfPrescription] = $TypeOfPrescription-cs#A
* category[orderType] = $OrderType-cs#1
* category[selfpayStatus] = $SelfpayStatus-cs#01 "非自費"
* dosageInstruction
  * timing.repeat.frequency = 3
  * route = $medication-path-tw#OD
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "[drp]"
* dispenseRequest
  * validityPeriod
    * start = "2026-07-21T00:00:00+08:00"
    * end = "2026-07-28T00:00:00+08:00"
  * numberOfRepeatsAllowed = 1
  * expectedSupplyDuration.value = 3
  * quantity
    * value = 5
    * system = "http://unitsofmeasure.org"
    * unit = "mL"
* note[0].text = "否,無須合併"
* note[+].text = "N,不註銷"
* extension
  * url = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-TotalDuration"
  * valueQuantity
    * value = 7
    * unit = "days"
* substitution
  * allowedBoolean = true
  * reason.text = "不可替代時始需註明"



