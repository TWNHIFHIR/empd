Extension: ExtensionCombinedPrescriptionNote
Id: Extension-CombinedPrescriptionNote
Title: "Extension-須被合併之處方箋註記"
Description: "用於表示須被合併之處方箋註記 Combined Prescription Note"
Context: Composition.section
* ^version = "0.2.1"
* . MS
  * ^short = "擴充的資料項目。[應填入須被合併之處方箋註記]"
  * ^definition = "擴充的資料項目。"
* value[x] 1.. MS
* value[x] only boolean
* valueBoolean 1..1


