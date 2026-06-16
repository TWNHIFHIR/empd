Alias: $PaymentCategory-cs = https://nhicore.nhi.gov.tw/empd/CodeSystem/PaymentCategory-cs
Alias: $PaymentCategory-vs = https://nhicore.nhi.gov.tw/empd/ValueSet/PaymentCategory-vs

Profile: CoverageEMR
Parent: Coverage
Id: Coverage-EMR
Title: "電子處方箋/調劑單張-就醫身分別"
Description: "用於表示電子處方箋與調劑單張之就醫身分別"
* ^version = "0.1.0"
* ^status = #active
* ^date = "2023-10-30"
* status = #active (exactly)
* status MS
* type 1.. MS
  * ^short = "Coverage category such as medical or accident。[應填入給付類別]"
  * coding from $PaymentCategory-vs (required)
    * ^binding.description = "給付類別；應填入[PaymentCategory-vs](ValueSet-PaymentCategory-vs.html)值集中的其中一個代碼。"
  * text MS
    * ^short = "[應填入就醫身分別 Identity Type]"
* payor MS

Instance: cov-ep
InstanceOf: CoverageEMR
Description: "電子處方箋-就醫身分別範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR"
* status = #active
* type = $PaymentCategory-cs#1 "職業傷害"
* beneficiary = Reference(Patient/pat-ep)
* payor = Reference(Patient/pat-ep)

Instance: cov-ds
InstanceOf: CoverageEMR
Description: "調劑單張-就醫身分別範例"
Usage: #example
* meta.profile = "https://nhicore.nhi.gov.tw/empd/StructureDefinition/Coverage-EMR"
* status = #active
* type = $PaymentCategory-cs#4 "普通疾病"
* beneficiary = Reference(Patient/pat-ds)
* payor = Reference(Patient/pat-ds)