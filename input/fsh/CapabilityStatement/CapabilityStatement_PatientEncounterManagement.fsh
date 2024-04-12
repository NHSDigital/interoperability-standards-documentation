Instance: NHSEnglandPatientEncounterManagementProvider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England Patient Encounter Management"
* status = #active
* date = 2023-02-01
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "Provider query and update management of a encounter registry. Based on mandatory queries from [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html#234441218-encounters-option-search-parameters) and also [US Core Encounter - Mandatory search parameters](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-encounter.html), plus [IHE PIXm](https://profiles.ihe.net/ITI/PIXm/ITI-104.html#2310441-add-or-revise-patient) upsert"
* rest.mode = #server

//Encounter
* insert ResourceWithExpectation(#Encounter, https://fhir.nhs.uk/England/StructureDefinition/Encounter, #SHALL)
* rest.resource[=]
  * documentation = "The update expects an identifier parameter i.e. ```PUT [base]/Encounter?identifier={system|}[code]```. \n\n Example: \n\n PUT [base]/Encounter?identifier=https://fhir.leedsth.nhs.uk/YrVisit|YOR123456    \n\n This is the same **upsert** behaviour as described [IHE PIXm](https://profiles.ihe.net/ITI/PIXm/ITI-104.html#2310441-add-or-revise-patient) around the Patient resource."
* rest.resource[=]
  * conditionalUpdate = true
* insert InteractionWithExpectation(#update, #SHALL)
* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(_id, #token, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "```GET [base]/Encounter/[id] or GET [base]/Encounter?_id=[id]``` \n\n e.g. GET [base]/Encounter?_id=12354"
* insert SearchParamWithExpectation(patient, #reference, #SHALL)
* rest.resource[=]
  * searchParam[=]
    * documentation = "```GET [base]/Encounter?patient={Type/}[id]``` \n\n e.g. GET [base]/Encounter?patient=1137192"
* insert SearchParamWithExpectation(patient:identifier, #token, #SHOULD)
* rest.resource[=]
  * searchParam[=]
    * documentation = "```GET [base]/Encounter?patient:identifier={system|}[code]``` \n\n e.g. GET /Encounter?patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9459304130"
* insert SearchParamWithExpectation(date, #date, #SHOULD)
* rest.resource[=]
  * searchParam[=]
    * documentation = "- including support for these date comparators: gt,lt,ge,le \n- including optional support for AND search on date (e.g.date=[date]&date=[date]]&...) \n\n ```GET [base]/Encounter?date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}&patient={Type/}[id]``` \n\n or \n\n ```GET [base]/Encounter?date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}&patient:identifier={system/}[code]``` \n\n e.g. GET /Encounter?date=ge2019-01-01T00:00:00Z&patient:identifier=https://fhir.nhs.uk/Id/nhs-number|9459304130"

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(date)
* insert RequiringSearchParam(patient)

* insert SearchParamCombinationWithExpectation(#SHOULD)
* insert RequiringSearchParam(date)
* insert RequiringSearchParam(patient:identifier)
