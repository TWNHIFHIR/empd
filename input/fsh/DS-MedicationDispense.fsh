Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Medication-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Medication-DS
Alias: $Practitioner-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS
Alias: $medication-path-tw = https://twcore.mohw.gov.tw/ig/twcore/CodeSystem/medication-path-tw
Alias: $v3-GTSAbbreviation = http://terminology.hl7.org/CodeSystem/v3-GTSAbbreviation

Profile: MedicationDispenseDS
Parent: TWCoreMedicationDispense
Id: MedicationDispense-DS
Title: "調劑單張-調劑內容(MedicationDispense)"
Description: "此Profiles用於描述調劑單張的調劑內容。"
* ^version = "0.2.1"
* ^date = "2024-01-13"
* identifier 1..
  * ^short = "External identifier.[應填入項次 Item/藥品批號]。至少需填入項次 Item"
  * value MS
* category ^short = "配藥/調劑藥品的類型。[應填入醫令類別]"
* medication[x] only CodeableConcept-tw or Reference($Medication-DS)
* medicationReference MS
* medicationReference only Reference($Medication-DS)
* medicationCodeableConcept MS
* medicationCodeableConcept ^short = "所提供的藥品。此資料項目為可擴充綁定預設國際標準值集，但實作者可視實務專案需求只綁定以下slices中的任一值集。目前未只限定綁定預設值集是因為尚無slice值集與預設國際標準值集的代碼對應表，待後續有相對的代碼對應表後將建議採用國際標準值集作為唯一綁定值集並針對該值集進行擴充與管理，以利進行跨國與跨系統之資料交換。[應填入健保代碼與藥品商品名稱Brand Name]。健保代碼(code)；藥品商品名稱Brand Name(display)，至少需填入藥品商品名稱Brand Name。"
  * ^definition = "指明所提供的藥品，這是一個指向代表藥品的resource的連接，可以是藥品的細節，也可以是一個帶有代碼的屬性，從已知的藥品列表中指明此藥品。\r\n商品名稱Brand Name，此為用於調製之藥品名稱"
* subject only Reference(Group or $Patient-DS)
* quantity 1..
  * value 1.. MS
    * ^short = "Numerical value (with implicit precision).[應填入給藥總量 Total Amount]"
  * unit 1.. MS
    * ^short = "Unit representation.[應填入給藥總量單位 Total Units]。如：顆、CC、瓶等"
* daysSupply 1..
  * ^short = "Amount of medication expressed as a timing amount.[應填入給藥日數 Medication Days]"
  * value 1.. MS
  * unit MS
* receiver only Reference($Patient-DS or $Practitioner-DS)
* note 1.. MS
  * ^short = "Information about the dispense.[應填入調劑之核種名稱/調劑之放射活度/完成調劑之放射活度/完成調劑之核醫放射性藥品數量/處方疑義樣態註記]。至少需填入處方疑義樣態註記"
  * ^definition = "Extra information about the dispense that could not be conveyed in the other attributes.\r\n[處方疑義樣態註記]：預設為「無」\r\n填寫說明：\r\n處方有疑義樣態時請填寫「有」\r\n處方無疑義樣態請填寫「無」"
  * text MS
* dosageInstruction 1..
  * timing 1..
    * repeat 1..
      * frequency 1..
        * ^short = "Event occurs frequency times per period.[應填入頻率 Frequency]"
    * code ^short = "BID | TID | QID | AM | PM | QD | QOD | +[應填入使用時間]。如：飯前後"
      * coding MS
  * route 1..
    * ^short = "How drug should enter body.[應填入給藥途徑 Route of Administration]"
  * doseAndRate 1..
    * dose[x] ^slicing.discriminator.type = #type
      * ^slicing.discriminator.path = "$this"
      * ^slicing.rules = #open
    * doseQuantity 1..
    * doseQuantity only SimpleQuantity
      * ^sliceName = "doseQuantity"
      * value 1.. MS
        * ^short = "Numerical value (with implicit precision).[應填入劑量]"
      * unit 1.. MS
        * ^short = "Unit representation.[應填入劑量單位  Dose Units]。如：顆、CC等"
* substitution MS
  * wasSubstituted MS
    * ^short = "Whether a substitution was or was not performed on the dispense.[應填入有更換藥品註記]"
    * ^definition = "True if the dispenser dispensed a different drug or product from what was prescribed.\r\n預設為「無」\r\n填寫說明：\r\n有更換藥品時請填寫「有」\r\n無有更換藥品請填寫「無」"
  * reason MS
    * ^short = "Why was substitution made.[應填入不得以其他廠牌藥品替代之理由]。填寫說明：有特殊情況時才填寫不可替代時始需註明"

Instance: med-dis-01-ds
InstanceOf: MedicationDispenseDS
Description: "調劑單張-調劑內容(MedicationDispense)範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/MedicationDispense-DS"
* identifier[0].value = "3"
* identifier[+].value = "7"
* status = #preparation
* medicationReference = Reference(med-01-ds)
* quantity
  * value = 6
  * unit = "顆"
* subject = Reference(pat-ds)
* daysSupply = 10 'd' "Day"
* dosageInstruction
  * timing
    * repeat.frequency = 4
    * code = $v3-GTSAbbreviation#PM "PM"
  * route = $medication-path-tw#PO
  * doseAndRate.doseQuantity
    * value = 1
    * unit = "顆"
* note[0].text = "A"
* note[+].text = "否"
* substitution
  * wasSubstituted = true
  * reason.text = "不可替代時始需註明"