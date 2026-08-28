CodeSystem: NHIIdentityTypeCodeSystem
Id: nhi-identity-type
Title: "NHI-電子處方箋-就醫身分別"
Description: "臺灣衛生福利部中央健康保險署「就醫身分別」代碼，代碼出版日期：2026-08-31；資料所屬單位：臺灣衛生福利部中央健康保險署。"
* ^caseSensitive = true
* ^content = #complete
* ^date = "2026-08-31"
* ^version = "0.2.1"
* ^experimental = false
* #00 "健保"
* #01 "非健保"

ValueSet: NHIIdentityTypeValueSet
Id: nhi-identity-type
Title: "NHI-電子處方箋-就醫身分別值集"
Description: "NHI-電子處方箋-就醫身分別值集"
* ^date = "2026-08-31"
* ^version = "0.2.1"
* ^experimental = false
* include codes from system NHIIdentityTypeCodeSystem