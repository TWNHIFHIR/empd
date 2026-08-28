Alias: $IdentityType-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-identity-type
Alias: $IdentityType-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/nhi-identity-type

Profile: CoverageEMR
Parent: Coverage
Id: Coverage-EMR
Title: "電子處方箋/調劑單張-就醫身分別"
Description: "用於表示電子處方箋與調劑單張之就醫身分別"
* ^version = "0.2.1"
* ^status = #active

* extension 0..1 MS
* extension contains ExtensionPaymentCategory named PaymentCategory 0..1
* extension[PaymentCategory] ^short = "擴充的資料項目。[應填入電子處方箋給付類別 Payment Category]"
* status = #active (exactly)
* status MS
* type 1.. MS
* type from $IdentityType-vs (required)
  * coding 1..1
  * ^short = "表示本次就醫之就醫身分別，用以區分健保與非健保身分。[應填入就醫身分類別]"
  * coding from $IdentityType-vs (required)
    * ^binding.description = "就醫身分別；應填入[Identity Type](ValueSet-nhi-identity-type.html)值集中的其中一個代碼。"
    * system 1..1
    * system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/nhi-identity-type"
    * code 1..1
    * code from $IdentityType-vs (required)
* payor MS

Instance: cov-01-ep
InstanceOf: CoverageEMR
Title: "電子處方箋-就醫身分別-健保"
Description: "電子處方箋-使用健保就醫身分之就醫資料範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR"
* status = #active
* type = $IdentityType-cs#00 "健保"
* type.text = "健保"
* beneficiary = Reference(Patient/pat-ep)
* payor = Reference(Organization/org-nhi-ep)
* extension
  * url = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-PaymentCategory"
  * valueCodeableConcept
    * coding
      * system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs"
      * code = #4
      * display = "普通疾病"

Instance: cov-02-ep
InstanceOf: CoverageEMR
Title: "電子處方箋-就醫身分別-非健保"
Description: "電子處方箋-使用非健保就醫身分之就醫資料範例。"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR"
* status = #active
* type = $IdentityType-cs#01 "非健保"
* type.text = "非健保"
* beneficiary = Reference(Patient/pat-ep)
* payor = Reference(Patient/pat-ep)
* extension
  * url = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-PaymentCategory"
  * valueCodeableConcept
    * coding
      * system = "https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs"
      * code = #4
      * display = "普通疾病"



Instance: cov-ds
InstanceOf: CoverageEMR
Description: "調劑單張-就醫身分別範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR"
* status = #active
* type = $IdentityType-cs#00 "健保"
* beneficiary = Reference(Patient/pat-ds)
* payor = Reference(Patient/pat-ds)