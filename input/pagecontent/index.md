<div class="bg-warning">
因考量實作需求，於2026/9/28異動以下內容：
<ol>
  <li>新增及調整專門術語（Terminology）：
    <ul>
      <li>新增 <a href="ValueSet-NHIMedication-vs.html">ValueSet: NHI-電子處方箋-用藥品項</a>，供 <code>Medication.code</code> 使用。</li>
      <li>新增 <a href="ValueSet-NHIMedicationFrequency-HL7-vs.html">ValueSet: HL7 TimingAbbreviation + NHI-電子處方箋-藥品使用頻率值集</a>，供 <code>MedicationRequest.dosageInstruction.timing</code> 使用。</li>
      <li>新增 <a href="ValueSet-NonNHIMedication-vs.html">ValueSet: 無健保代碼之藥品</a>，供無健保代碼藥物品項使用。</li>
      <li>新增 <a href="ValueSet-NHIMaterial-vs.html">ValueSet: NHI-電子處方箋-健保特材值集</a>，供健保代碼特材使用。</li>
      <li>新增 <a href="ValueSet-NonNHIMaterial-vs.html">ValueSet: 無健保代碼之特材</a>，供無健保代碼特材使用。</li>
      <li>新增 <a href="ValueSet-nhi-case-type.html">ValueSet: NHI-健保案件分類值集</a>，供 <code>Encounter.class</code> 使用。</li>
      <li>新增 <a href="ValueSet-nhi-identity-type.html">ValueSet: 就醫身分別值集</a>，供 <code>Coverage.type.coding</code> 使用。</li>
      <li>新增 <a href="ValueSet-organization-identifier-tw.html">ValueSet: 特約醫事機構</a>，供健保特約醫事機構代碼使用。</li>
      <li>新增 <a href="ValueSet-medication-request-status-empd.html">ValueSet: EMPD MedicationRequest 狀態</a>，限使用 <code>active</code> 與 <code>cancelled</code>。</li>
      <li>修改 <a href="ValueSet-SelfpayStatus-vs.html">ValueSet: 自費註記</a>：<code>00</code>（自費）調整為 <code>Y</code>（自費），<code>01</code>（非自費）調整為 <code>N</code>（非自費）。</li>
      <li>更新 <a href="CodeSystem-NHIMedication-cs.html">CodeSystem: NHI-電子處方箋-用藥品項（NHIMedication-cs）</a> 代碼內容。</li>
      <li>更新 <a href="CodeSystem-NHIMaterial-cs.html">CodeSystem: NHI-電子處方箋-特材收載值集（NHIMaterial-cs）</a> 代碼內容。</li>
      <li>更新 <a href="CodeSystem-organization-identifier-tw.html">CodeSystem: NHI-電子處方箋-特約醫事機構（organization-identifier-tw）</a> 代碼內容。</li>
    </ul>
  </li>

  <li>新增 <a href="StructureDefinition-Extension-PaymentCategory.html">Extension: 給付類別（Extension-PaymentCategory）</a>：
    <ul>
      <li><code>Extension.url</code>：固定為 <code>https://nhicore.nhi.gov.tw/empd/StructureDefinition/Extension-PaymentCategory</code>。</li>
      <li><code>Extension.value[x]</code>：限用 CodeableConcept 且必填，required 綁定 <a href="ValueSet-PaymentCategory-vs.html">ValueSet: 給付類別值集</a>。</li>
    </ul>
  </li>

  <li>新增 <a href="StructureDefinition-Extension-CombinedPrescriptionNote.html">Extension: 須被合併之處方箋註記（Extension-CombinedPrescriptionNote）</a>：
    <ul>
      <li><code>Extension.value[x]</code> 限用 boolean 且必填，以 <code>valueBoolean</code> 表示處方箋是否須與同次就醫紀錄之其他處方箋合併。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Bundle-EMPD.html">Profile: 電子處方箋-Bundle（Bundle-EMPD）</a>：
    <ul>
      <li>新增 Constraint <code>enc-nhi-1</code>：就醫身分別為健保時，健保卡就醫序號必填。</li>
      <li>新增 Constraint <code>empd-medreq-1</code>：處方箋種類為第一、二、三級管制藥品專用處方箋（<code>D</code>／<code>E</code>／<code>F</code>）時，醫師證號及管制藥品使用執照皆必填。</li>
      <li>因特材改由 MedicationRequest 表示，Medication Resource 改為可選填：
        <ul>
          <li><code>Bundle.entry</code>：基數 <code>9..*</code> → <code>8..*</code>。</li>
          <li><code>Bundle.entry:Medication</code>：基數 <code>1..*</code> → <code>0..*</code>。</li>
          <li><code>Bundle.entry:CoverageIdentifier</code>：基數 <code>1..*</code> → <code>1..1</code>。</li>
        </ul>
      </li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Composition-EMPD.html">Profile: 電子處方箋-Composition（Composition-EMPD）</a>：
    <ul>
      <li><code>Composition.date</code>：語意調整為「處方箋有效期間迄」。</li>
      <li><code>Composition.section:Coverage</code>：基數 <code>1..*</code> → <code>1..1</code>。</li>
      <li>因特材改由 MedicationRequest 表示：
        <ul>
          <li><code>Composition.section:MedicationPrescribed.entry</code>：基數 <code>2..*</code> → <code>1..*</code>。</li>
          <li><code>Composition.section:MedicationPrescribed.entry:Medication</code>：基數 <code>1..*</code> → <code>0..*</code>。</li>
        </ul>
      </li>
      <li><code>Composition.section:MedicationPrescribed.extension</code>：原由 <code>MedicationRequest.note</code> 表示的「須被合併之處方箋註記」，改由 <code>Extension-CombinedPrescriptionNote</code> 的 <code>valueBoolean</code> 表示。</li>
      <li><code>Composition.section:Coverage.code.coding.display</code>：移除固定值。</li>
      <li><code>Composition.section:ObservationBodyWeight.code.coding.display</code>：移除固定值。</li>
      <li><code>Composition.section:Condition.code.coding.display</code>：移除固定值。</li>
      <li><code>Composition.section:MedicationPrescribed.code.coding.display</code>：移除固定值。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Patient-EMPD.html">Profile: 電子處方箋-病人基本資料（Patient-EMPD）</a>：
    <ul>
      <li>新增 Constraint <code>pat-id-1</code>：病人之國民身分證統一編號、護照號碼或居留證號，至少需填寫其中一種。</li>
      <li><code>Patient.name:usual</code>：改為必填（<code>1..1</code>），並須填寫 <code>name:usual.text</code>。</li>
      <li><code>Patient.name:usual.text</code>：長度限制 60。</li>
      <li><code>Patient.identifier:medicalRecord.value</code>：長度限制 10。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Observation-EMPD-BodyWeight.html">Profile: 電子處方箋-體重（Observation-EMPD-BodyWeight）</a>：
    <ul>
      <li><code>Observation.valueQuantity.value</code>：數字限制 6,2（總長度不得超過 6 位數，小數不得超過 2 位，最大值為 9999.99；Constraint：<code>empd-obs-bw-1</code>）。</li>
      <li><code>Observation.subject</code>：參照目標調整為 Patient-EMPD。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Encounter-EMPD.html">Profile: 電子處方箋-門診基本資料（Encounter-EMPD）</a>：
    <ul>
      <li><code>Encounter.identifier:medical-encounter-identifier</code>：新增「就醫識別碼」slice 且為必填，<code>system</code> 固定為 <code>https://nhicore.nhi.gov.tw/empd/medical-encounter-identifier</code>。</li>
      <li><code>Encounter.identifier:func-sequence-number</code>：新增「健保卡就醫序號」slice，符合健保就醫條件時必填，<code>system</code> 固定為 <code>https://nhicore.nhi.gov.tw/empd/func-sequence-number</code>。</li>
      <li><code>Encounter.identifier:medical-encounter-identifier.value</code>：長度限制 20。</li>
      <li><code>Encounter.identifier:func-sequence-number.value</code>：長度限制 4。</li>
      <li><code>Encounter.class</code>：綁定 <a href="ValueSet-nhi-case-type.html">ValueSet: NHI-健保案件分類值集</a>。</li>
      <li><code>Encounter.type</code>：原由 <code>Condition.note</code> 表示之「部分負擔代碼」改至此欄位，並綁定 <a href="ValueSet-PartCode-vs.html">部分負擔代碼值集</a>。</li>
      <li><code>Encounter.subject</code>：參照目標調整為 Patient-EMPD。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Coverage-EMR.html">Profile: 電子處方箋／調劑單張-就醫身分別（Coverage-EMR）</a>：
    <ul>
      <li><code>Coverage.type.coding</code>：原由 <code>Coverage.type.text</code> 表示之「就醫身分別」改至此欄位，並綁定 <a href="ValueSet-nhi-identity-type.html">就醫身分別值集</a>。</li>
      <li><code>Coverage.extension:PaymentCategory</code>：原由 <code>Coverage.type.coding</code> 表示之「給付類別」改由此 Extension 表示，並綁定 <a href="ValueSet-PaymentCategory-vs.html">給付類別值集</a>。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Organization-EMPD.html">Profile: 電子處方箋-醫事機構基本資料（Organization-EMPD）</a>：
    <ul>
      <li><code>Organization.identifier</code>：基數調整為 <code>1..1</code>，需使用健保特約醫事機構代碼或臺灣醫事司醫事機構代碼。</li>
      <li><code>Organization.identifier:nhi-organization</code>：新增健保特約醫事機構代碼 slice，綁定健保特約醫事機構值集。</li>
      <li><code>Organization.identifier:twcore-organization</code>：新增醫事司醫事機構代碼 slice，綁定 TW Core 醫事機構值集。</li>
      <li><code>Organization.name</code>：改為必填（<code>1..1</code>）。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Practitioner-EMPD.html">Profile: 電子處方箋-醫事人員基本資料（Practitioner-EMPD）</a>：
    <ul>
      <li>開立第一、二、三級管制藥品專用處方箋時，醫師證號及管制藥品使用執照皆必填。</li>
      <li><code>Practitioner.identifier:medicalLicenseNumber</code>：新增 slice，原由 <code>Practitioner.qualification.identifier</code> 表示之醫師證號改由此欄位表示，<code>system</code> 固定為 <code>https://dep.mohw.gov.tw/DOMA</code>。</li>
      <li><code>Practitioner.qualification</code>：基數 <code>1..1</code> → <code>0..1</code>。</li>
      <li><code>Practitioner.qualification.identifier</code>：用以表示管制藥品使用執照，<code>system</code> 固定為 <code>https://cdmis.fda.gov.tw</code>。</li>
      <li><code>Practitioner.name</code>：基數調整為 <code>1..1</code>。</li>
      <li><code>Practitioner.name.text</code>：基數調整為 <code>1..1</code>，長度限制 60。</li>
      <li><code>Practitioner.telecom.value</code>：長度限制 20。</li>
      <li><code>Practitioner.identifier:medicalLicenseNumber.value</code>：長度限制 30。</li>
      <li><code>Practitioner.qualification.identifier.value</code>：長度限制 30。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Medication-EMPD.html">Profile: 電子處方箋-藥物處方內容（Medication-EMPD）</a>：
    <ul>
      <li><code>Medication.code.coding:nhi-medication</code>：新增健保用藥品項 slice，綁定 <a href="ValueSet-NHIMedication-vs.html">NHI-電子處方箋-用藥品項值集</a>。</li>
      <li><code>Medication.code.coding:nonNHIMedication</code>：新增無健保代碼藥物品項 slice。</li>
      <li>新增 Constraint <code>empd-med-1</code>：自費藥品且無藥品許可證字號時，代碼須使用 <code>999999</code> 加院所自訂 4 碼流水號，共 10 碼。</li>
      <li>配合 FHIR Ratio 資料型態定義，調整 <code>Medication.ingredient.strength</code> 之 numerator／denominator，其 <code>value</code>、<code>system</code> 及 <code>code</code> 改為必填，<code>system</code> 固定使用 UCUM <code>http://unitsofmeasure.org</code>。</li>
      <li><code>Medication.code.text</code>：長度限制 600。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-MedicationRequest-EMPD.html">Profile: 電子處方箋-處方內容（MedicationRequest-EMPD）</a>：
    <ul>
      <li>新增 Constraint <code>empd-ord-1</code>：醫令類別非特殊材料時，須提供劑量、劑量單位、頻率、給藥途徑、給藥日數及給藥總量等相關資訊。</li>
      <li>新增 Constraint <code>empd-medreq-2</code>：未使用 <code>medicationReference</code> 表示藥品時，應以 <code>medicationCodeableConcept</code> 填寫特材代碼。</li>
      <li>新增 Constraint <code>empd-medreq-3</code>：無健保代碼之特材暫編碼須符合 12 碼編碼規則。</li>
      <li><code>MedicationRequest.status</code>：原由 <code>MedicationRequest.note</code> 表示之處方箋註銷註記改由此欄位表示，並 required 綁定 <a href="ValueSet-medication-request-status-empd.html">EMPD MedicationRequest 狀態值集</a>，限使用 <code>active</code> 表示處方箋有效、<code>cancelled</code> 表示處方箋已註銷。</li>
      <li><code>MedicationRequest.category:orderType</code>：基數 <code>0..1</code> → <code>1..1</code>，醫令類別改為必填。</li>
      <li><code>MedicationRequest.medication[x]:medicationCodeableConcept.coding:NHIMaterial</code>：新增健保代碼特材 slice，綁定 <a href="ValueSet-NHIMaterial-vs.html">NHI-電子處方箋-健保特材值集</a>。</li>
      <li><code>MedicationRequest.medication[x]:medicationCodeableConcept.coding:nonNHIMaterial</code>：新增無健保代碼特材 slice。</li>
      <li><code>MedicationRequest.note</code>：
        <ul>
          <li>原「處方箋註銷註記」改由 <code>MedicationRequest.status</code> 表示。</li>
          <li>原「自費註記」改由 <code>MedicationRequest.category:selfpayStatus</code> 表示。</li>
          <li>原「須被合併之處方箋註記」改由 Composition 的 <code>Extension-CombinedPrescriptionNote</code> 表示。</li>
        </ul>
      </li>
      <li><code>MedicationRequest.dosageInstruction.doseAndRate.dose[x]</code> 及 <code>doseQuantity</code>：基數 <code>1..1</code> → <code>0..1</code>，當為特材時可不填。</li>
      <li><code>MedicationRequest.dosageInstruction.timing.repeat.frequency</code>：名稱由「頻率」調整為「藥品使用次數」，基數 <code>1..1</code> → <code>0..1</code>。</li>
      <li><code>MedicationRequest.dosageInstruction.timing.code</code>：名稱由「使用時間」調整為「藥品使用頻率及服用時間」，基數 <code>0..1</code> → <code>1..1</code>。</li>
      <li><code>MedicationRequest.dosageInstruction.timing.code.coding</code>：基數 <code>0..*</code> → <code>1..*</code>，綁定 <a href="ValueSet-NHIMedicationFrequency-HL7-vs.html">藥品使用頻率值集</a>。</li>
      <li>「不得以其他廠牌藥品替代之理由」改以 <code>MedicationRequest.substitution.reason.text</code> 表示。</li>
      <li><code>MedicationRequest.subject</code>：參照目標調整為 Patient-EMPD。</li>
      <li><code>MedicationRequest.identifier:PrescriptionNo.value</code>：長度限制 64。</li>
      <li><code>MedicationRequest.identifier:Item.value</code>：長度限制 2。</li>
      <li><code>MedicationRequest.extension:TotalMedicationDays.value[x]</code>：給藥總日份不得超過 999。</li>
      <li><code>MedicationRequest.dispenseRequest.numberOfRepeatsAllowed</code>：處方可調劑次數不得超過 99。</li>
      <li><code>MedicationRequest.dispenseRequest.expectedSupplyDuration</code>：給藥日數不得超過 999 天，單位固定為天（<code>d</code>）。</li>
      <li><code>MedicationRequest.dispenseRequest.quantity.value</code>：數字限制 6,2（Constraint：<code>empd-medreq-6</code>）。</li>
      <li><code>MedicationRequest.dosageInstruction.doseAndRate.doseQuantity.value</code>：數字限制 11,3（Constraint：<code>empd-medreq-5</code>）。</li>
      <li><code>MedicationRequest.dosageInstruction.doseAndRate.doseQuantity.unit</code>：長度限制 30。</li>
      <li><code>MedicationRequest.dosageInstruction.method.text</code>：長度限制 600。</li>
      <li><code>MedicationRequest.substitution.reason.text</code>：長度限制 800。</li>
    </ul>
  </li>

  <li>修改 <a href="StructureDefinition-Condition-EMPD.html">Profile: 電子處方箋-診斷（Condition-EMPD）</a>：
    <ul>
      <li><code>Condition.note</code>：改為表示「醫療評估內容註記」。</li>
      <li>原「部分負擔代碼」改由 <code>Encounter.type</code> 表示。</li>
      <li><code>Condition.note.text</code>：長度限制 1000。</li>
      <li><code>Condition.subject</code>：參照目標調整為 Patient-EMPD。</li>
    </ul>
  </li>

  <li>修改調劑單張相關 Profiles：
    <ul>
      <li><a href="StructureDefinition-Bundle-DS.html">Profile: 調劑單張-Bundle（Bundle-DS）</a>：
        <ul>
          <li><code>Bundle.entry</code>：最低筆數 <code>12</code> → <code>11</code>。</li>
          <li><code>Bundle.entry:ObservationBodyWeight</code>：上限調整為 <code>1</code>。</li>
          <li><code>Bundle.entry:Coverage</code>：基數 <code>1..*</code> → <code>1..1</code>。</li>
          <li><code>Bundle.entry:Media</code>：基數 <code>1..*</code> → <code>0..*</code>，領藥者數位簽章改為選填。</li>
        </ul>
      </li>
      <li><a href="StructureDefinition-Composition-DS.html">Profile: 調劑單張-Composition（Composition-DS）</a>：
        <ul>
          <li><code>Composition.section:Coverage</code>：基數 <code>1..*</code> → <code>1..1</code>。</li>
          <li><code>Composition.section:Media</code>：上限 <code>1</code> → <code>*</code>。</li>
          <li><code>Composition.section:Coverage.code.coding.display</code>：移除固定值。</li>
          <li><code>Composition.section:BodyWeight.code.coding.display</code>：移除固定值。</li>
          <li><code>Composition.section:Condition.code.coding.display</code>：移除固定值。</li>
          <li><code>Composition.section:MedicationPrescribed.code.coding.display</code>：移除固定值。</li>
        </ul>
      </li>
      <li><a href="StructureDefinition-Medication-DS.html">Profile: 調劑單張-藥物處方內容（Medication-DS）</a>：
        <ul>
          <li>新增 <code>Medication.code.coding:nhi-medication</code>（<code>0..1</code>、Must Support），required 綁定 <a href="ValueSet-NHIMedication-vs.html">NHI-電子處方箋-用藥品項值集</a>。</li>
        </ul>
      </li>
      <li><a href="StructureDefinition-MedicationRequest-DS.html">Profile: 調劑單張-處方內容（MedicationRequest-DS）</a>：
        <ul>
          <li><code>MedicationRequest.category:selfpayStatus</code>：補充若自費註記為 <code>Y</code>，無須檢核健保代碼。</li>
          <li>新增 <code>MedicationRequest.medication[x]:medicationCodeableConcept.coding:nhi-medication</code>（<code>0..1</code>、Must Support），required 綁定 <a href="ValueSet-NHIMedication-vs.html">NHI-電子處方箋-用藥品項值集</a>。</li>
          <li><code>MedicationRequest.dosageInstruction.timing.code</code> 及其 <code>coding</code>：required 綁定 <a href="ValueSet-NHIMedicationFrequency-HL7-vs.html">藥品使用頻率值集</a>。</li>
          <li><code>MedicationRequest.note</code>：取消必填，自費註記改由 <code>category</code> 表示。</li>
        </ul>
      </li>
      <li><a href="StructureDefinition-Media-DS.html">Profile: 調劑單張-領藥者數位簽章（Media-DS）</a>：
        <ul>
          <li><code>Media.note</code> 新增 Must Support，供 QR Code 相關說明使用。</li>
        </ul>
      </li>
    </ul>
  </li>
</ol>
請留意這些異動，以避免影響您的實作。
</div>

### 專案介紹

臺灣電子處方箋與調劑單張實作指引（Taiwan Electronic Medication Prescription and Dispense Implementation Guide，簡稱TW EMPD IG），採用HL7® FHIR® standard（Fast Healthcare Interoperability Resources）IG建置方法，在FHIR [R4.0.1](https://hl7.org/fhir/R4/)之標準基礎上，繼承臺灣核心實作指引（Taiwan Core Implementation Guide，簡稱TW core IG）V0.3.2版本，進一步定義適用於臺灣電子處方箋與調劑單張資料需求的Resources（類似資料表）、其中的資料項目（意即欄位）、基數（意即0..1、0.._、1..1或1.._）及資料類型（文字、日期時間、代碼等）等。

### 專案背景

民國94年12月進行「醫療院所病歷電子化現況調查」之結果顯示：國內醫院病歷電子化發展已相當普及，共計約有5成醫院病歷資料已進行電腦化，約3成醫院病歷電子化已進展至院內整合階段並逐漸邁向院際之分享與交換應用，顯示過去幾年推動病歷電子化之發展已具初步成效，應順勢大力推展。

為了延續「網路健康服務推動計畫（民國91至94年）」、「衛生局所網路便民服務計畫（民國92至95年）」等計畫之基礎，落實本部「全人健康照護」政策目標，推動「從出生前到老去健康資訊ｅ化流通」發展策略，民國93年10月開始規劃「國民健康資訊建設計畫（National Health Informatics Project，NHIP）」，並於民國94及95年提出計畫申請，於民國96年8月14日核定通過，由政府扮演推動角色，營造國家健康資訊發展環境，推動衛生醫療資訊之重要基礎建設，其中，「推動實施電子病歷」與「建立及營運醫事憑證管理中心 (Healthcare Certification Authority，HCA )」即為NHIP之兩大分項計畫。

「智慧醫療服務計畫」為行政院98年4月30日核定之「健康照護升值白金方案－加值產業」項下四大方案之一，該方案項下包含「推動遠距健康照護計畫」、「推動電子病歷及醫療影像傳輸計畫」、「健保IC卡改善計畫」、「醫院安全關懷RFID計畫」、「健康資料庫加值應用計畫」五大計畫。

後續，本部除繼續推動醫療院所實施電子病歷及互通外，並擬規劃台灣健康雲計畫，發展電子病歷雲端服務，增加國內醫療院所推動電子病歷之意願。

電子處方箋與調劑單張之規範由衛生福利部2022年3月招標之「111年度智慧健康雲專案辦公室營運案專案」經費支應下建置。

### 如何閱讀這個實作指引(IG)

<br>

<img class="figure-img img-responsive img-rounded center-block" src="EMPD.png" alt="EMPD IG目錄" style="display: block;margin-left: auto;margin-right: auto;width: 100%;  float:none"/>

<div style="clear:both;"></div>

<br>

- [首頁](index.html)：EMPD IG介紹及背景說明。
- 視覺化邏輯模型：EMPD IG邏輯模型架構視覺化圖。
  - [電子處方箋 視覺化邏輯模型](EPvsmodel.html)
  - [調劑單張 視覺化邏輯模型](DSvsmodel.html)
- 規範文件
  - [能力聲明](capability.html) ：應用EMPD IG於建置業務目的使用的FHIR Server時，該FHIR Server必須及建議應該支援的資料存取功能。
  - [查詢參數與操作定義](Search.html)：查詢FHIR Server的Profiles時，針對各Profiles可使用的查詢參數及操作定義。
  - [邏輯模型](logicmodel.html) ：EMPD IG的所有邏輯模型(Logical Models)，邏輯模型會定義相應情境下使用的所有資料欄位。為了便於實作者快速理解，資料欄位會使用易於理解的命名，實作者再透過邏輯模型中的功能頁籤「Mappings」瞭解各資料欄位實際使用本IG的哪個Profiles的哪個資料項目(element)。
  - [FHIR Profiles及Extensions](profiles.html)：
    - EMPD IG的所有Profiles之定義與範例。
    - 各資料項目不同實作強制程度的Terminology。
  - [專門術語](Termino.html) ：EMPD IG所使用的專門術語，包括代碼系統（Code Systems）及值集（Value Sets）。
- 範例檔：符合EMPD IG所定義Profiles之範例檔。
  - [電子處方箋 範例檔](EPexample.html)
  - [調劑單張 範例檔](DSexample.html)
- [結構定義與範例檔下載](download.html)：實作者若不偏好使用FHIR RESTful API驗證資料是否符合Profiles，可直接下載所需的格式驗證檔，包括XML、JSON及Turtle三種格式，亦可於此下載完整範例檔。
- [安全性](Security.html)：主要說明採用EMPD IG網站進行實作時，有關資料存取授權的作法。
- 版本異動：若EMPD IG網站的版本有所異動，皆可透過異動說明頁得以瞭解版本間的異動差異

### 專有名詞定義

本實作指引基於TW Core IG規則，敘述如下：

#### Profiles相關

<div style="padding-left: 10px;"> 
<table class="grid">
<thead>
  <tr>
    <th style="width:10%">英文名</th>
    <th style="width:10%">中文名</th>
    <th style="width:80%">說明</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><span style="font-weight:bold">Name</span></td>
    <td>名稱</td>
    <td>resource的資料項目名稱(意即XML元素名稱；JSON或RDF屬性名稱)。有些名稱末端為[x]，圖示為<img class="figure-img img-responsive img-rounded center-block" src="icon_choice.gif"/>，意即可以選擇適用的資料類型以因應對照的資料項目內容，故需依據資料來源類型填入適當的內容值，例如Patient.deceased[x]。<br />
	<img class="figure-img img-responsive img-rounded center-block" src="Deased.png" alt="Patient.deceased[x]範例" width="250px" />
	<br />如原始資料謹紀錄病人存活或死亡，應選用Boolean類型，存活為0、死亡為1；如原始資料紀錄病人死亡時間，應選用dateTime類型，並填入時間，表示病人以死亡。</td>
  </tr>
  <tr>
    <td rowspan="5"><span style="font-weight:bold">Flags</span></td>
    <td>標記</td>
    <td>一組有關影響實作者如何操作資料項目的資訊，範例如下。</td>
  </tr>
  <tr>
    <td><img class="figure-img img-responsive img-rounded center-block" src="MS.png" alt="A MustSupport image" /></td>
    <td>必須支援(MustSupport)，表示伺服器必須有能力接收這個資料項目。詳可參閱<a href="http://hl7.org/fhir/R4/conformance-rules.html#mustSupport"><span style="color:#905">MustSupport</span></a>。</td>
  </tr>
  <tr>
    <td><img class="figure-img img-responsive img-rounded center-block" src="md01.png" alt="A modifier image" /></td>
    <td>必須支援，表示此資料項目可能會完全修正或改變其他資料項目的意涵，需特別留意。詳可參閱<a href="http://hl7.org/fhir/R4/conformance-rules.html#isModifier"><span style="color:#905">Modifier</span></a>。</td>
  </tr>
  <tr>
    <td><img class="figure-img img-responsive img-rounded center-block" src="summary.png" alt="A summary searches image" /></td>
    <td>表示此資料項目為摘要的一部分，詳可參閱<a href="http://hl7.org/fhir/R4/search.html#summary"><span style="color:#905">Summary searches</span></a>。</td>
  </tr>
  <tr>
    <td><img class="figure-img img-responsive img-rounded center-block" src="constraints.png" alt="A contraint image" /></td>
    <td>表示此資料項目受規範設定的限制(constraints)影響，例如：Patient.name的限制為「name.text(完整中文姓名)」或name.family(英文姓)或者兩者必須填寫」，詳可參閱<a href="http://hl7.org/fhir/R4/conformance-rules.html#constraints"><span style="color:#905">Constraints</span></a>。
  </td>
  </tr>
  <tr>
    <td><span style="font-weight:bold">Card.</span></td>
    <td>基數</td>
    <td>此資料項目允許出現在這個resource的最小至最大次數，意即例如某一資料項目的基數若為0..1，表示可不填寫或至多填入1筆；若為1..1，表示必須(只能)填入1筆；若為0..*，表示可不填寫或填入多筆(不限筆數)；若為1..*，表示至少要填入1筆或填入多筆(不限筆數)。</td>
  </tr>
  <tr>
    <td><span style="font-weight:bold">Type</span></td>
    <td>資料型別</td>
    <td>資料項目的資料型別(可超連結至該型別的定義)，例如：boolean、integer、dateTime等。</td>
  </tr>
  <tr>
    <td><span style="font-weight:bold">Description &amp;Constraints</span></td>
    <td>描述與限制</td>
    <td>此資料項目的描述及詳細的限制，並說明原始CDM資料來源、是否需進行轉換、或依照CDM譯碼簿設計填入對應的說明/文字。並說明其編碼的資料項目可使用何種代碼填寫，如需綁定特定代碼，則以Binding陳述並連結到該值集。<br/>
    如Patient.birthDate說明: 出生年月日。【TOTFA.d11/TOTFB.d6】，表示資料為出生年月日之資料，資料來源為TOTFA的d11欄位或是TOTFB的d6欄位陳述。</td>
  </tr>
</tbody>
</table>
</div>
<div style="clear:both;"></div>

#### 綁定值集(value set)的強度

<div style="padding-left: 10px;"> 
<table class="grid">
  <thead>
    <tr>
      <th>英文名</th>
      <th>中文名</th>
      <th>說明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Required</td>
      <td>要求使用</td>
      <td>應填入代碼表中的其中一個代碼</td>
    </tr>
    <tr>
      <td>Preferred</td>
      <td>鼓勵使用</td>
      <td>鼓勵使用代碼表中的代碼， 但不強制一定要使用此代碼表，你也可使用其他代碼表的代碼或單純以文字表示。</td>
    </tr>
    <tr>
      <td>Example</td>
      <td>範例</td>
      <td>可參考代碼表，但此代碼表只是針對這個欄位的一個可能值的示例，不預期也不鼓勵使用者一定要使用此代碼表的代碼。</td>
    </tr>
    <tr>
      <td>Extensible</td>
      <td>可擴充</td>
      <td>應填入代碼表中適合的代碼，確定無適合的代碼才可以使用其他代碼中的代碼來表示。</td>
    </tr>
  </tbody>
</table> 
如下圖所示，telecom.system應使用ContactPointSystem代碼表(或稱代碼系統)中的其中一個代碼，telecom.use及gender也都有應該搭配使用的代碼表，否則以此IG驗證格式時會出現錯誤訊息。 <br />
<img class="figure-img img-responsive img-rounded center-block" src="error01.png" alt="required examples" width="800px" />
<div style="clear:both;"></div>
</div>

其餘詳細規則請詳閱[TW Core IG](https://twcore.mohw.gov.tw/ig/twcore/)網站