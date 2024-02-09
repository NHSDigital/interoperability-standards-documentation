Instance: IHE.PCF.consentAuthorizationServer
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England IHE Privacy Consent on FHIR (PCF)"
* status = #draft
* date = 2024-02-09
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "CapabilityStatement for the Consent Authorization Server Actor for use within the English NHS (Enterprise Architecture) and or NHS England (Solution Architecture). \nThis is part of the NHS England National Extension (Volume 4) for [Privacy Consent on FHIR (PCF)](https://profiles.ihe.net/ITI/PCF/index.html). \n\n This profile is implemented by \n - [National Proxy Service](https://digital.nhs.uk/developer/) \n\n These services are potentially used by \n\n**NHS England** \n\n - [National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir) \n - [Security and authorisation](https://digital.nhs.uk/developer/guides-and-documentation/security-and-authorisation) \n\n**English NHS and NHS England Services** \n\n used in the implementation of the following profiles or services \n\n - [NRL producer system](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer) \n - [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) \n - [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html)"
* rest.mode = #server

// Consent
* insert ResourceWithExpectation(#Consent, https://fhir.nhs.uk/England/StructureDefinition/IHEPCF-Basic-Consent, #SHALL)
* rest.resource[=]
  * documentation = ""
* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_lastUpdated, #date, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "When the resource version last changed"
* insert SearchParamWithExpectation(_id, #token, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "Logical id of this artifact"
* insert SearchParamWithExpectation(status, #token, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "Whether the Consent record is active"
* insert SearchParamWithExpectation(patient, #reference, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "The patient. We may have issues supporting this in NHS England API's but we could assume the {id} of the patient is not transient and is the {nhsNumber} i.e. `patient={baseUrlOfPDS}/Patient/91000000009`"
* insert SearchParamWithExpectation(patient.identifier, #token, #SHOULD)
* rest.resource[=]
  * searchParam[=]
    * documentation = "The patient identifier (MRN, NHS Number, etc).  In the English NHS this may be a SHALL"
* insert SearchParamWithExpectation(patient:identifier, #token, #SHOULD)
* rest.resource[=]
  * searchParam[=]
    * documentation = "The patient identifier (NHS Number). In NHS England this this may be a SHALL"
* insert SearchParamWithExpectation(actor, #reference, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "Who|what (RelatedPerson/Practitioner/Patient) is controlled by this rule"
* insert SearchParamWithExpectation(actor:identifier, #token, #SHOULD)
* rest.resource[=]
  * searchParam[=]
    * documentation = "Who|what (RelatedPerson - restrict to RelatedPerson for now for proxy) is controlled by this rule "
