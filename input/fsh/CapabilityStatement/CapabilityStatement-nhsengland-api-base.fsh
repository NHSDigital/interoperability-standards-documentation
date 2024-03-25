Instance: NHS-England-APIM-Provider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England APIM Base API Definitions"
* status = #draft
* date = 2024-01-30
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "High level summary of FHIR api's used within NHS England API programmes"
* rest.mode = #server



//DocumentReference
* insert ResourceWithExpectation(#DocumentReference, https://fhir.nhs.uk/England/StructureDefinition/DocumentReference, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n - [National Record Locator - FHIR API v3](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer) as STU3 \n - [e-Referral Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#create, #SHOULD)
* insert InteractionWithExpectation(#update, #SHOULD)
* insert InteractionWithExpectation(#delete, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(subject:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n - [National Record Locator - FHIR API v3](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer) \n\n International and Care Connect API suggest using patient instead of subject, this would also be consistent with other NHS England API's"
* insert SearchParamWithExpectation(custodian:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir)"
* insert SearchParamWithExpectation(next-page-token, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir)"
* insert SearchParamWithExpectation(based-on:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - This may not be correct and is inferred from A005 [e-Referral Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) "


//Endpoint
* insert ResourceWithExpectation(#Endpoint, https://fhir.nhs.uk/England/StructureDefinition/Endpoint, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#delete, #SHOULD)
* insert InteractionWithExpectation(#update, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_has, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir)"
* insert SearchParamWithExpectation(Endpoint.identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) believe this should be `identifier`"


//HealthcareService
* insert ResourceWithExpectation(#HealthcareService, https://fhir.nhs.uk/England/StructureDefinition/HealthcareService, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir)\n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir)\n  - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#read, #MAY)
* insert InteractionWithExpectation(#update, #MAY)
* insert InteractionWithExpectation(#delete, #MAY)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_id, #string, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)
* rest.resource[=]
  * searchParam[=]
    * documentation = "e-Referral FHIR API"
* insert SearchParamWithExpectation(HealthcareService.providedBy, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) believe this should be `organization:identifier`"
* insert SearchParamWithExpectation(HealthcareService.identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) believe this should be `identifier`"


//Organization
* insert ResourceWithExpectation(#Organization, https://fhir.nhs.uk/England/StructureDefinition/Organization, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir) \n - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir)\n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir)\n  - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n\n Used by \n\n - EPS consumers. \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#update, #MAY)
* insert InteractionWithExpectation(#delete, #MAY)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_id, #string, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)
* rest.resource[=]
  * searchParam[=]
    * documentation = "e-Referral FHIR API"
* insert SearchParamWithExpectation(Organization.identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) believe this should be `identifier`"
* insert SearchParamWithExpectation(identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(active, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(type, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(name, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(address-country, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(ods-role, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir) EPS expects this data to be `type`"
* insert SearchParamWithExpectation(ods-lastChangeDate, #date, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir) FHIR developers would expect this to be `_lastUpdated`"
* insert SearchParamWithExpectation(ods-activeRole, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir) concerned we have two searches on an extension"

//OrganizationAffiliation
* insert ResourceWithExpectation(#OrganizationAffiliation, https://fhir.nhs.uk/England/StructureDefinition/OrganizationAffiliation, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(active, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(primary-organization, #reference, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"
* insert SearchParamWithExpectation(participating-organization, #reference, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)"


//Patient
* insert ResourceWithExpectation(#Patient, https://fhir.nhs.uk/England/StructureDefinition/PatientPDS, #MAY)
* rest.resource[=]
  * documentation = "API present in: \n - [Personal Demographics Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) \n\n Used by \n\n - EPS consumers. \n\n SHOULD and SHALL conformance is taken from [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) - MAY is used to indicate no conformance (added due to rendering issue in the publisher)"
* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_fuzzy-match, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "PDS is using non standard parameter. This does not appear to have overlap with existing FHIR definitions"
* insert WithSearchParamDocumentation(PDS using non standard parameter)
* insert SearchParamWithExpectation(_exact-match, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "PDS is using non standard parameter. Do not believe this is :exact from [modifiers](https://www.hl7.org/fhir/r4/search.html#modifiers) although it sounds similar and may cause confusion"
* insert SearchParamWithExpectation(_history, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "PDS is using non standard parameter. Do not believe this is _history from [history](https://www.hl7.org/fhir/r4/http.html#history) this probably results in confusion for developers"
* insert SearchParamWithExpectation(_max-results, #string, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "PDS is using non standard parameter. PDS probably should be using _count [_count](https://www.hl7.org/fhir/r4/search.html#count) which should be ok as PDS does not support paging"
* insert SearchParamWithExpectation(identifier, #token, #SHALL)
* insert WithSearchParamDocumentation(A search by NHS Number. Missing from PDS is a read operation instead - so using transient id instead of identifier)
* insert SearchParamWithExpectation(family, #string, #SHOULD)
* insert SearchParamWithExpectation(given, #string, #SHALL)
* insert SearchParamWithExpectation(gender, #string, #SHOULD)
* insert SearchParamWithExpectation(birthdate, #date, #SHOULD)
* insert SearchParamWithExpectation(death-date, #date, #MAY)
* insert SearchParamWithExpectation(address-postalcode, #string, #MAY)
* insert SearchParamWithExpectation(address-postcode, #string, #MAY)
* insert WithSearchParamDocumentation(PDS is using non standard parameter - **will be deprecated in the future**)
* insert SearchParamWithExpectation(general-practitioner, #reference, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "A search by ODS Code. PDS SHOULD be using `general-practitioner:identifier` with `token` type to follow NHS Digital FHIR policy. It is workable as it is but this is searching on an `id` which is transient (changeable), searching on `identifier` is recommended."
* insert SearchParamWithExpectation(email, #token, #MAY)
* insert SearchParamWithExpectation(phone, #token, #MAY)


//Practitioner
* insert ResourceWithExpectation(#Practitioner, https://fhir.nhs.uk/England/StructureDefinition/Practitioner, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_query, #string, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)

//PractitionerRole
* insert ResourceWithExpectation(#PractitionerRole, https://fhir.nhs.uk/England/StructureDefinition/PractitionerRole, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) (NOT CONFORMANT) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(practitioner:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "[e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) - This parameter is NOT present but is believed to be implied. This API is believed to be NOT CONFORMANT as the api as currently stated should return all PractitionreRole's held by eRS and this is clearly not correct."



//RelatedPerson
* insert ResourceWithExpectation(#RelatedPerson, https://fhir.nhs.uk/England/StructureDefinition/RelatedPerson, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [Personal Demographics Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) \n -  Proxy.  \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements)"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #MAY)
* insert WithSearchParamDocumentation(A search by NHS Number. Proxy query parameter and not supported on PDS)
* insert SearchParamWithExpectation(patient:identifier, #token, #MAY)
* insert WithSearchParamDocumentation(A search by NHS Number. Proxy uses query parameter and PDS uses path parameter)
* rest.resource[=]
  * searchInclude[+] = "RelatedPerson:patient"

//ServiceRequest
* insert ResourceWithExpectation(#ServiceRequest, https://fhir.nhs.uk/England/StructureDefinition/ServiceRequest, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir). \n - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) \n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert InteractionWithExpectation(#read, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)
* insert SearchParamWithExpectation(patient:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir)) \n - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) "
* insert SearchParamWithExpectation(ServiceRequest.identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = " - [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) believe this should be `identifier` same as eRS"
* rest.resource[=]
  * searchRevInclude[+] = "Appointment:based-on"
  * searchRevInclude[+] = "Task:focus"

