Instance: Patient-birthDate
InstanceOf: SearchParameter
Usage: #definition
* url = "https://nhicore.nhi.gov.tw/empd/SearchParameter/Patient-birthDate"
* version = "0.1.0"
* name = "SearchParameterPatientbirthDate"
* status = #active
* date = "2024-02-03"
* contact.name = "衛生福利部"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.mohw.gov.tw/"
* description = "病人的出生日期(birthDate)"
* code = #birthDate
* base = #Patient
* type = #date
* expression = "Patient.birthDate"