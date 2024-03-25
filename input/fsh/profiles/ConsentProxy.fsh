Profile: ConsentNationalProxy
Parent: http://hl7.org/fhir/StructureDefinition/Consent
Id: ConsentNationalProxy
Title: "NHS England National Proxy Consent Profile"
Description: "NHS England National Proxy Consent Profile from https://nhsd-confluence.digital.nhs.uk/display/NPA/Confirm+consent"

* insert NHSEngland-Copyright

* status 1..1
  * ^short = "Status of permission"
* performer 1..1
  * ^short = "Proxy NHS number"
* performer only Reference(RelatedPerson)
* performer.identifier 1..1
* performer.identifier.system 1..1
* performer.identifier.value 1..1
* patient 1..1
  * ^short = "Patient NHS number"
* patient only Reference(PatientPDS)
* patient.identifier 1..1
* patient.identifier.system 1..1
* patient.identifier.value 1..1

* category 1..
* category ^slicing.discriminator.type = #value
* category ^slicing.rules = #open
* category ^slicing.discriminator.path = "coding.system"
* category contains information-access 1..1
* category[information-access] = http://terminology.hl7.org/CodeSystem/v3-ActCode#INFA

* provision 0..1
  * ^short = "Requested services"
* verification 0..*
  * ^short = "Basis for access"
* verification.verifiedWith 1..1
  * ^short = "Patient (if consent-based) or RelatedPerson.relationship (if based on a relationship)"
* verification.verifiedWith only Reference(RelatedPerson)
