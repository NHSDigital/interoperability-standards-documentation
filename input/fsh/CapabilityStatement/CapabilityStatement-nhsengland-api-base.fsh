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

//Patient
* insert ResourceWithExpectation(#Patient, https://fhir.nhs.uk/England/StructureDefinition/Patient, #MAY)
* insert WithSupportedProfile(https://fhir.nhs.uk/England/StructureDefinition/PatientPDS)
* rest.resource[=]
  * documentation = "API present in: \n - [Personal Demographics Service FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) \n\n FHIR profile is used by EPS consumers. \n\n SHOULD and SHALL conformance is taken from [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) - MAY is used to indicate no conformance (added due to rendering issue in the publisher)"
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
  * documentation = "API present in \n - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir). \n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(identifier, #token, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)
* insert SearchParamWithExpectation(patient:identifier, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "[e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir))"
* insert SearchParamWithExpectation(category, #token, #MAY)
* rest.resource[=]
  * searchParam[=]
    * documentation = "[e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir))"
* rest.resource[=]
  * searchRevInclude[+] = "Appointment:based-on"
  * searchRevInclude[+] = "Task:focus"

//HealthcareService
* insert ResourceWithExpectation(#HealthcareService, https://fhir.nhs.uk/England/StructureDefinition/HealthcareService, #MAY)
* rest.resource[=]
  * documentation = "API present in \n - [e-Referral Service Patient Care](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-patient-care-fhir)\n - [e-Referral FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir) \n\n No [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/index.html) conformance requirements"
* insert InteractionWithExpectation(#read, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(_id, #string, #MAY)
* insert WithSearchParamDocumentation( - e-Referral FHIR API)
* rest.resource[=]
  * searchParam[=]
    * documentation = "e-Referral FHIR API"

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
