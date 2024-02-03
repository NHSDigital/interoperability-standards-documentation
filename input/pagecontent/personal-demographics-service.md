### Overview

See [Personal Demographics Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir)
This is API is described using OAS

### Entity Relationship Diagram

<figure>{% include personal-demographic-service-relationship.svg %}</figure>
<br clear="all"/>


### Search For a patient

| FHIR/IHE Framework                                                                                                                  | FHIR Interaction                              | FHIR Profile                                                |
|-------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|-------------------------------------------------------------|
| For background info, not followed by PDS [Patient Demographics Query for mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/index.html) | [RESTful API](restful-api.html) | [PatientPDS](StructureDefinition-PatientPDS.html) | 

[Search For a patient](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir#get-/Patient)

<figure>{% include personal-demographic-service-sequence-search-for-a-patient.svg %}</figure>
<br clear="all"/>

### Get patient details

| FHIR/IHE Framework | FHIR Interaction                              | FHIR Profile                                                |
|--------------------|-----------------------------------------------|-------------------------------------------------------------|
| n/a | [RESTful API](restful-api.html) | [PatientPDS](StructureDefinition-PatientPDS.html) | 

[Get patient details](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir#get-/Patient/-id-)

<figure>{% include personal-demographic-service-sequence-get-patient-details.svg %}</figure>
<br clear="all"/>

### Update patient details

| FHIR/IHE Framework | FHIR Interaction                                                             | FHIR Profile                                                |
|--------------------|------------------------------------------------------------------------------|-------------------------------------------------------------|
| n/a | [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902) - Not FHIR Patch | [PatientPDS](StructureDefinition-PatientPDS.html) | 

[Update patient details](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir#patch-/Patient/-id-)

<figure>{% include personal-demographic-service-sequence-update-patient-details.svg %}</figure>
<br clear="all"/>

### Get a patient's related people

| FHIR/IHE Framework | FHIR Interaction                              | FHIR Profile                                                   |
|--------------------|-----------------------------------------------|----------------------------------------------------------------|
| n/a | [RESTful API](restful-api.html) | [UKCore-RelatedPerson](StructureDefinition-RelatedPerson.html) | 

[Get a patient's related people](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir#get-/Patient/-id-/RelatedPerson)

<figure>{% include personal-demographic-service-sequence-get-a-patients-related-people.svg %}</figure>
<br clear="all"/>

### NHS Number Allocation (NEW Request)

[Confluence NHS Number Allocation](https://nhsd-confluence.digital.nhs.uk/display/DEMGRPH/PDS+FHIR+-+NHS+Number+Allocation+Analysis)

| FHIR/IHE Framework | FHIR Interaction                              | FHIR Profile                                                                                                                                                     |
|--------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| For background info, [Patient Identifier Cross-referencing for mobile (PIXm))](https://profiles.ihe.net/ITI/PIXm/index.html) | [RESTful API](restful-api.html) | [PatientPDSNHSNumberAllocation](StructureDefinition-PatientPDSNHSNumberAllocation.html) API has specific rules for content for supplier **new profile required** | 

#### Activity Diagram 

<figure>{% include personal-demographic-service-activity-nhs-number-allocation.svg %}</figure>
<br clear="all"/>

#### Sequence Diagram

<figure>{% include personal-demographic-service-sequence-nhs-number-allocation.svg %}</figure>
<br clear="all"/>


### API Documentation (CapabilityStatement) 

1. Copy the JSON version of [CapabilityStatement-Personal-Demographics-Service-Provider](CapabilityStatement-Personal-Demographics-Service-Provider.html)

2. Paste this into [FHIR Development (Experimental)](https://nhsdigital.github.io/IOPS-Validation-UI/api)

3. Click 'Refresh OAS'

4. An OAS representation of the FHIR CapabilityStatement will be rendered on the right hand side of the screen.

5. Click 'Try it out' to see an API demonstration.

