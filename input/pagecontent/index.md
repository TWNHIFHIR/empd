<div class="bg-warning" style="ol { counter-reset: item } li { display: block } li:before { content: counters（item, ">
<ol>  
	<li>確保實務上代碼使用的有效性，此版本IG繼承TW Core 0.3.2版本</li>
  <li>新增<a href ="StructureDefinition-MedicationRequest-Self-EMPD.html">Profile: 電子處方箋-處方內容(無健保代碼及特材)-MedicationRequest-Self-EMPD</a></li>
  <li>新增代碼<a href ="ValueSet-NHIMedication-vs.html">ValueSet:NHI-電子處方箋-用藥品項</a>，供Medication.code使用</li>
  <li>新增代碼<a href ="ValueSet-NHIMedicationFrequency-HL7-vs.html">ValueSet:HL7 TimingAbbreviation + NHI-電子處方箋-藥品使用頻率值集</a>，供MedicationRequest.dosageInstruction.timing使用</li>
</ol>
請留意這些異動，以避免影響您的實作。
</div>

### 專案介紹

臺灣電子處方箋與調劑單張實作指引（Taiwan Electronic Medication Prescription and Dispense Implementation Guide，簡稱TW EMPD IG），採用HL7® FHIR® standard（Fast Healthcare Interoperability Resources）IG建置方法，在FHIR [R4.0.1](https://hl7.org/fhir/R4/)之標準基礎上，繼承臺灣核心實作指引（Taiwan Core Implementation Guide，簡稱TW core IG）V1.0.0版本，進一步定義適用於臺灣電子處方箋與調劑單張資料需求的Resources（類似資料表）、其中的資料項目（意即欄位）、基數（意即0..1、0..*、1..1或1..*）及資料類型（文字、日期時間、代碼等）等。

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

* [首頁](index.html)：EMPD IG介紹及背景說明。
* 視覺化邏輯模型：EMPD IG邏輯模型架構視覺化圖。
    - [電子處方箋 視覺化邏輯模型](EPvsmodel.html)
    - [調劑單張 視覺化邏輯模型](DSvsmodel.html)
* 規範文件
    - [能力聲明](capability.html) ：應用EMPD IG於建置業務目的使用的FHIR Server時，該FHIR Server必須及建議應該支援的資料存取功能。
    - [查詢參數與操作定義](Search.html)：查詢FHIR Server的Profiles時，針對各Profiles可使用的查詢參數及操作定義。
    - [邏輯模型](logicmodel.html) ：EMPD IG的所有邏輯模型(Logical Models)，邏輯模型會定義相應情境下使用的所有資料欄位。為了便於實作者快速理解，資料欄位會使用易於理解的命名，實作者再透過邏輯模型中的功能頁籤「Mappings」瞭解各資料欄位實際使用本IG的哪個Profiles的哪個資料項目(element)。
    - [FHIR Profiles及Extensions](profiles.html)：
        - EMPD IG的所有Profiles之定義與範例。
        - 各資料項目不同實作強制程度的Terminology。
    - [專門術語](Termino.html) ：EMPD IG所使用的專門術語，包括代碼系統（Code Systems）及值集（Value Sets）。
* 範例檔：符合EMPD IG所定義Profiles之範例檔。
    - [電子處方箋 範例檔](EPexample.html)
    - [調劑單張 範例檔](DSexample.html)
* [結構定義與範例檔下載](download.html)：實作者若不偏好使用FHIR RESTful API驗證資料是否符合Profiles，可直接下載所需的格式驗證檔，包括XML、JSON及Turtle三種格式，亦可於此下載完整範例檔。
* [安全性](Security.html)：主要說明採用EMPD IG網站進行實作時，有關資料存取授權的作法。
* 版本異動：若EMPD IG網站的版本有所異動，皆可透過異動說明頁得以瞭解版本間的異動差異

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