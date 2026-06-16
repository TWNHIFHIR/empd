Alias: $Patient-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Patient-DS
Alias: $Encounter-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Encounter-DS
Alias: $Practitioner-DS = https://nhicore.nhi.gov.tw/empd/StructureDefinition/Practitioner-DS

Profile: MediaDS
Parent: TWCoreMedia
Id: Media-DS
Title: "調劑單張-領藥者數位簽章"
Description: """此Profiles用於描述調劑單張之領藥者數位簽章。
如為開立第一級、第二級及第三級管制藥品專用處方箋，此Profiles為必填"""
* ^version = "0.1.0"
* ^date = "2024-01-02"
* status MS
* subject 1..
* subject only Reference(TWCorePractitionerRole or Group or Device or TWCoreSpecimen or TWCoreLocation or $Patient-DS or $Practitioner-DS)
* encounter only Reference($Encounter-DS)
* content MS
  * ^short = "Actual Media - reference or data。[應填入領藥者數位簽章]。開立第一級、第二級及第三級管制藥品專用處方箋，此欄位為必填"
* note MS
  * ^short = "對於QR Code相關之說明備註。"

Instance: media-ds
InstanceOf: MediaDS
Description: "調劑單張-領藥者數位簽章範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Media-DS"
* status = #completed
* subject = Reference(pat-ds)
* content
  * data = "6aCY6Jel6ICF5pW45L2N57C956ug"
  * contentType = #image/jpeg
* note.text = "特殊服用方式之藥品：開立3天、總量為12顆。 1天4顆(早上1.5顆、中午1.5顆、晚上0顆、睡前1顆)。"