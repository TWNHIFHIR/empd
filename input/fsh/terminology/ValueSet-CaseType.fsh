ValueSet: NHICaseType
Id: nhi-case-type
Title: "NHI-健保案件分類值集"
Description: "健保案件分類值集，包含門診西醫案件分類及住院案件分類。"
* ^version = "2026-04-30"
* ^status = #active
* ^experimental = false
* ^date = "2026-04-30"

* include codes from system NHIOutpatientCaseTypeCodeSystem
* include codes from system NHIInpatientCaseTypeCodeSystem