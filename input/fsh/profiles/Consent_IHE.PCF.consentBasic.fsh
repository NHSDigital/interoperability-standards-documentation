Profile: BasicConsent
Parent: http://hl7.org/fhir/StructureDefinition/Consent
Id: IHEPCF-Basic-Consent
Description: "NHS England IHE PCF Explicit Basic Consent. Note NHS England does not contrain out any elements, this is a key difference to [IHE PCF Explicit Basic Consent](https://profiles.ihe.net/ITI/PCF/StructureDefinition/IHE.PCF.consentBasic)"

* status 1..1
* scope 1..1
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy
* category 1..
* patient 1..1
* dateTime 1..1
* performer 1..
* organization 1..
* source[x] 1..1
* policy.uri 1..1
//* policy.authority
//* policyRule
//* verification 0..0
* provision 1..1 MS
* provision.type 1..1
* provision.period MS
* provision.purpose MS
* provision.actor MS
* provision.actor.role = http://terminology.hl7.org/CodeSystem/v3-ParticipationType#IRCP
//* provision.action 0..0
//* provision.class 0..0
//* provision.code 0..0
//* provision.provision.provision 0..0

* provision.purpose from BasicPurposeVS (extensible)
