CodeSystem: NonNHIlMaterialCodeSystem
Id: NonNHIMaterial-cs
Title: "無健保代碼之特材"
Description: """用於無健保代碼之特材。編碼規則共12碼：第1-2碼依現行特材代碼前2碼編碼原則、第3碼為半形Z、第4-9碼為許可證號（6碼，不足補0）、第10-12碼為流水號（自001起編）。僅提供參考。

編碼範例：骨科類特材 FBZ012345001（第1項建議）、FBZ012345002（同一張許可證之第2項建議）。"""
* ^version = "0.2.1"
* ^status = #active
* ^experimental = false
* ^date = "2026-05-26"
* ^contact.name = "衛生福利部"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.mohw.gov.tw/"
* ^copyright = "衛生福利部"
* ^caseSensitive = true
* ^content = #fragment
* #FBZ012345001 "準分子雷射冠狀動脈血管整型術導管" "SPECTRANETICS ELCA CATHETER"
* #FBZ012345002 "旋轉血管成型系統" "Boston Scientific Rotablator Rotational Angioplasty System"
* #FBZ012345003 "旋轉血管成型系統導引線" "Boston Scientific Rotablator Rotational Angioplasty System Guide Wire"
* #FBZ012345004 "冠狀動脈擴張導管" "OrbusNeich Scoreflex Coronary Dilatation Catheter"
* #FBZ012345005 "氣球擴張導管" "Acrostak GRIP PTCA Balloon Catheter"
* #FBZ012345006 "週邊血管網狀氣球導管" "Spectranetics AngioSculpt PTA Scoring Balloon Catheter"
* #FBZ012345007 "血管內固定錨系統" "Medtronic Aptus Heli-FX EndoAnchor System"
* #FBZ012345008 "冠狀動脈血管網狀氣球導管" "Spectranetics AngioSculpt PTCA Scoring Balloon Catheter"
* #FBZ012345009 "切割氣球導管" "Boston Scientific Wolverine Coronary Cutting Balloon"
* #FBZ012345010 "電極導管" "Japan Lifeline Ring Electrophysiology Catheter"
