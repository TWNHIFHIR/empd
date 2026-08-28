Extension: ExtensionPaymentCategory
Id: Extension-PaymentCategory
Title: "Extension-給付類別"
Description: "用於表示給付類別 Payment Category"
Context: Coverage
* ^version = "0.2.1"
* . MS
  * ^short = "擴充的資料項目。[應填入給付類別 Payment Category]"
  * ^definition = "擴充的資料項目。"
* value[x] 1.. MS
* value[x] only CodeableConcept
* valueCodeableConcept from PaymentCategoryValueSet (required)
  * coding 1..1
    * system 1..1 MS
    * system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs"
    * code 1..1 MS
    * code from PaymentCategoryValueSet (required)


