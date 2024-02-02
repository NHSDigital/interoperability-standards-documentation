Instance: Personal-Demographics-Service-Provider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England Personal Demographics Service Provider"
* status = #draft
* date = 2024-01-30
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "NHS England Personal Demographics Service Provider  which has an API on Patient and RelatedPerson"
* rest.mode = #server

* insert ResourceWithExpectation(#Patient, https://fhir.nhs.uk/England/StructureDefinition/PatientPDS, #SHALL)
* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_fuzzy-match, #string, #SHALL)
* insert SearchParamWithExpectation(_exact-match, #string, #SHALL)
* insert SearchParamWithExpectation(_history, #string, #SHALL)
* insert SearchParamWithExpectation(_max-results, #string, #SHALL)
* insert SearchParamWithExpectation(family, #string, #SHALL)
* insert SearchParamWithExpectation(given, #string, #SHALL)
* insert SearchParamWithExpectation(gender, #string, #SHALL)
* insert SearchParamWithExpectation(birthdate, #string, #SHALL)
* insert SearchParamWithExpectation(death-date, #string, #SHALL)
* insert SearchParamWithExpectation(address-postalcode, #string, #SHALL)
* insert SearchParamWithExpectation(address-postcode, #string, #SHALL)
* insert SearchParamWithExpectation(general-practitioner, #string, #SHALL)
* insert SearchParamWithExpectation(email, #string, #SHALL)
* insert SearchParamWithExpectation(phone, #string, #SHALL)

* insert ResourceWithExpectation(#RelatedPerson, https://fhir.nhs.uk/England/StructureDefinition/RelatedPerson, #SHOULD)
* insert InteractionWithExpectation(#search-type, #SHOULD)
* insert SearchParamWithExpectation(patient, #string, #SHOULD)
* rest.resource[=]
  * searchParam[=].documentation = "This is a not represented this way in PDS, it is not possible to represent that style of query (Patient/{id}/RelatedPerson) in a CapabilityStatement)"
