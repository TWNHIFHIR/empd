Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Profile: PatientDS
Parent: TWCorePatient
Id: Patient-DS
Title: "調劑單張-病人基本資料"
Description: """此Profiles繼承於臺灣核心-病人(TW Core Patient) ，並進一步用於描述調劑單張之病人基本資料
[[*FMM1*](http://build.fhir.org/versions.html#maturity)]"""
* ^version = "0.1.0"
* ^date = "2024-01-02"
* extension[age] 1..
  * ^short = "年齡。[應填入就診年齡 Age]"
* identifier ^short = "病人的身份識別碼（identifier），通常為業務目的所使用的識別碼，例如病歷號。[應填入身分證號Personal ID Number與病歷號碼Chart No.]。 Personal ID Number為身分證字號、護照號碼與居留證號碼則一使用。"
* identifier[medicalRecord].value ^short = "唯一值。[應填入病歷號碼Chart No.]\r\n例如：病歷號為8862168"
  * ^definition = "識別碼中通常與使用者有關的部分，在系統情境內是唯一的。\r\n開立處方箋機構之病人病歷號碼。"
* name 1.. MS
  * ^short = "病人的姓名。[應填入姓名 Name]"
* gender ^short = "male ｜ female ｜ other ｜ unknown。[應填入性別 Gender]"
* birthDate ^short = "病人出生日期。[應填入出生日期 Birth Date]"
  * ^definition = "個人的出生日期\r\n格式為西元YYYYMMDD"
* contact
  * relationship ^short = "概念（Concept）－參照一個專門術語或只是文字表述。[應填入與用藥對象之關係]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填"
    * ^definition = "可以透過正式參照一個專門術語或知識本體來定義一個概念，或者也可以文字表述此概念。\r\n僅第一級、第二級及第三級管制藥品處方箋需填寫\r\n參考項目：本人、家屬、朋友、看護、志工、其他"
  * name ^short = "聯絡人姓名。[應填入領藥者姓名]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填"
  * telecom ^short = "聯絡人的詳細聯絡資訊。[應填入領藥者聯絡電話]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填"
    * ^definition = "此人的詳細聯絡方式，例如：電話號碼或電子郵件地址"

Instance: pat-ds
InstanceOf: PatientDS
Description: "調劑單張-病人基本資料範例"
Usage: #example
* identifier
  * use = #official
  * system = "http://www.moi.gov.tw/"
  * value = "Z199999829"
  * type = $v2-0203#MR "Medical record number"
* name
  * use = #official
  * text = "甄○康"
* gender = #female
* birthDate = "1985-01-02"
* extension
  * url = "https://twcore.mohw.gov.tw/ig/twcore/StructureDefinition/person-age"
  * valueAge = 39 'a'