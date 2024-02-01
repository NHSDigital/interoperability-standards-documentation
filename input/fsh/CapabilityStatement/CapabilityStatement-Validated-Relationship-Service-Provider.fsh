Instance: Validated-Relationship-Service-Provider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England Validated Relationship Service Provider"
* status = #draft
* date = 2024-01-30
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "This is an Open API specification for the Validated Relationship Service which has an API on RelatedPerson"
* rest.mode = #server

* insert ResourceWithExpectation(#RelatedPerson, https://fhir.nhs.uk/England/StructureDefinition/RelatedPerson, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(patient:identifier, #token, #SHALL)
* insert SearchParamWithExpectation(identifier, #token, #SHOULD)
* rest.resource[=]
  * searchInclude[+] = "RelatedPerson:patient"
