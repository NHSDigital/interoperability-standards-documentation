



### Overview

<div>
<img src="National-Proxy-Process-Overview.png"  alt="National Proxy Overview" width="60%">
<p>Figure 1 - National Proxy Overview</p>
<p></p>
</div>

[Internal Confluence Page](https://nhsd-confluence.digital.nhs.uk/display/NPA/Overview+-+NPA)

### Enterprise Architecture and System Architecture Links

It is believed this service contains [IHE Privacy Consent on FHIR (PCF)](https://profiles.ihe.net/ITI/PCF/index.html), it is the first known service in this category. Links to this IHE Profile will be identified in the relevant sections below. 
This section is similar (but not same) [advanced consent](https://profiles.ihe.net/ITI/PCF/content.html#3584-advanced)  
So this would apply to NHS England Services following [IHE Mobile Health Document Sharing (MHDS)](https://wiki.ihe.net/index.php/Mobile_Health_Document_Sharing_(MHDS)). Systems identified in this category are:

[National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer)

It also uses [Personal Demographics Service](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) and shares a similar `RelatedPerson' API.

### Entity Relationship Diagram

<figure>{% include national-proxy-service-relationship.svg %}</figure>
<br clear="all"/>

### Create a relationship

<figure>{% include national-proxy-service-activity-create-relationship.svg %}</figure>
<br clear="all"/>

<figure>{% include national-proxy-service-sequence-diagram-fhir.svg %}</figure>
<br clear="all"/>

| FHIR/IHE Framework |
|--------------------|
| [FHIR Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/index.html) |

[Confluence Link](https://nhsd-confluence.digital.nhs.uk/display/NPA/Create+a+relationship)

The documentation above implies the use of a FHIR `RelatedPerson` resource. The link below shows the model described on that page using a FHIR `Questionnaire` resource.
Note the field `permissions` has been omittted. TODO Need to clarify if this is required at this point of the process, this appears to be data from subsequent steps.

[Proxy Access Request Form](Questionnaire-Questionnaire-Proxy-Access-Request.html)

To view this form in a more friendly form, either use the JSON representation with either:

- [NLM Form Builder](https://lhcformbuilder.nlm.nih.gov/) once you are in the main screen, click preview.
- NHS England Data Standards - are working a tool called `Mauro Data Mapper` which may become the NHS England equivalent of the NLM product. This may be able to import a FHIR Questionnaire resource.
- [NHS England Interoperabilty Standards Form Viewer - prototype](https://nhsdigital.github.io/IOPS-Validation-UI/questionnaire) This is a prototype but is connected to NHS England Ontology Server, so both dropdowns work.

<div>
<img src="National-Proxy-Request-Form.png"  alt="National-Proxy-Request-Form using NHS England Form Viewerr" width="60%">
<p>Figure 2 - National Proxy Request Form</p>
<p></p>
</div>

### Validate a relationship

| FHIR/IHE Framework                                            |
|---------------------------------------------------------------|
| [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) |

[Confluence Link](https://nhsd-confluence.digital.nhs.uk/display/NPA/Validate+a+relationship)

This process occurs after [Create a relationship](#create-a-relationship). The data model on the confluence page looks like it is a match to [FHIR Consent](https://hl7.org/fhir/R4/consent.html). This probably applies to the confluence categories of:
- Safeguarding
- Verification
- Consent

TODO this should have a data model, could use FHIR Questionnaire for this but NHS England Data Standards would probably be more appropiate. 
Not all the FHIR Consent needs to be mapped to this model. What we probably do need if we are to follow FHIR Workflow  [Resource Relationships](https://hl7.org/fhir/R4/workflow.html#relationships) 

From a workflow perspective we would be asked a GP (or other) to validate the consent, this could be done via the FHIR Task resource



This `conversation` results in state changes as shown below. 
Steps labelled `internal provider workflow` are for information purposes and do not result in interactions between National Proxy Service and the supplier (e.g. GP). These represent supplier workflow
Note once the supplier (e.g. GP) has changed the `completed` the Consent is automatically updated from `proposed` to `active` and the RelatedPerson entry is visible on the API with the current status. 

<figure>{% include national-proxy-service-state-diagram.svg %}</figure>
<br clear="all"/>

### View a relationship

| FHIR/IHE Framework | FHIR Interaction                | FHIR Profile                                               |
|--------------------|---------------------------------|------------------------------------------------------------|
| n/a | [RESTful API](restful-api.html) |  [UKCore-RelatedPerson](StructureDefinition-RelatedPerson) | 

[Confluence Link](https://nhsd-confluence.digital.nhs.uk/display/NPA/View+a+relationship)

See [API Specification](#view-a-relationship) below. Note is a potential change here due to the proposed modelling using Consent. 

This could mean any of the following

- Add _revinclude option on the GET /RelatedPerson API Consent.actor i.e. `GET /RelatedPerson?_revinclude=Consent.actor`
- Add a GET /Consent/{id} API (really should be provided for [Validate a relationship](#validate-a-relationship)) and GET /Consent? with query parameters
  - actor (searching for the person making the request)
  - patient (search for consents for a patient)
  - 
### Manage the lifecycle of a relationship

<figure>{% include national-proxy-service-activity-manage-relationship.svg %}</figure>
<br clear="all"/>

| FHIR/IHE Framework                                            |
|---------------------------------------------------------------|
| [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) |

[Confluence Link](https://nhsd-confluence.digital.nhs.uk/display/NPA/Manage+the+lifecycle+of+a+relationship)

Would expect this to be a POST /Task from the GP and would follow a similar pattern to [Validate a relationship](#validate-a-relationship)


### Revoke a relationship

<figure>{% include national-proxy-service-activity-manage-relationship.svg %}</figure>
<br clear="all"/>

| FHIR/IHE Framework                                            |
|---------------------------------------------------------------|
| [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html) |

[Confluence Link](https://nhsd-confluence.digital.nhs.uk/display/NPA/Revoke+a+relationship)

Would expect this to be a POST /Task from the GP to request the relationship is ended and would follow a similar pattern to [Validate a relationship](#validate-a-relationship)

### API Documentation (CapabilityStatement)

1. Copy the JSON version of [CapabilityStatement-Validated-Relationship-Service-Provider](CapabilityStatement-Validated-Relationship-Service-Provider.html)

2. Paste this into [FHIR Development (Experimental)](https://nhsdigital.github.io/IOPS-Validation-UI/api)

3. Click 'Refresh OAS'

4. An OAS representation of the FHIR CapabilityStatement will be rendered on the right hand side of the screen.

5. Click 'Try it out' to see an API demonstration.


<div>
<img src="OAS-Documentation.png"  alt="FHIR CapabilityStatement render using OAS/Swagger" width="60%">
<p>Figure 3 - FHIR CapabilityStatement render using OAS/Swagger</p>
<p></p>
</div>


