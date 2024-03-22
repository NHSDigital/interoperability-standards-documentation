Profile: Consent
Parent: http://hl7.org/fhir/StructureDefinition/Consent
Id: Consent
Title: "NHS England Consent Profile"
Description: "Record consent to capture information for NHS England flags"

* ^name = "Consent"
* ^url = "https://fhir.nhs.uk/England/StructureDefinition/Consent"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-03-22"

* insert NHSEngland-Copyright


* policy 1..1
* policy.uri 1..
* policyRule 1..
* performer ..1
* performer only Reference(Organization or Patient or Practitioner)
* provision.purpose 1..1
