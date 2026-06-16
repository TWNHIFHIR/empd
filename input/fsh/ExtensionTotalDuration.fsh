Extension: ExtensionTotalDuration
Id: Extension-TotalDuration
Title: "Extension-給藥總日份"
Description: "用於表示給藥總日份 Total Medication Days"
Context: MedicationRequest
* ^version = "0.1.0"
* . MS
  * ^short = "擴充的資料項目。[應填入給藥總日份 Total Medication Days]"
  * ^definition = "擴充的資料項目。"
* value[x] 1.. MS
* value[x] only Quantity
  * value 1.. MS
  * unit MS