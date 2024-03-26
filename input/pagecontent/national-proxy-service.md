
### References

- [IHE Privacy Consent on FHIR (PCF)](https://profiles.ihe.net/ITI/PCF/index.html) describes how to use Consent to control access via an (OAuth2) authorisation server.

### Overview

<div>
<img src="National-Proxy-Process-Overview.png"  alt="National Proxy Overview" width="60%">
<p>Figure 1 - National Proxy Overview</p>
<p></p>
</div>

Add link to OAS Spec when published


#### Entity Relationship Diagram

<figure>{% include national-proxy-service-relationship.svg %}</figure>
<br clear="all"/>

### Arranging a proxy relationship

<figure>{% include consent-usecase.svg %}</figure>
<br clear="all"/>

<figure>{% include national-proxy-service-activity-create-relationship.svg %}</figure>
<br clear="all"/>

1. The national proxy request is captured in a form which is based on [Proxy Access Request](Questionnaire-Questionnaire-Proxy-Access-Request.html), this is submitted to the National Proxy Service (example [completed national proxy request form](QuestionnaireResponse-questionnaireresponse-national-proxy-request.html))
2. The National Proxy Service uses this form to create FHIR Consent resource which follows [National Proxy FHIR Consent profile](StructureDefinition-ConsentNationalProxy.html), example [proposed Consent](Consent-consent-national-proxy-proposed.html)
3. The National Proxy Service reviews this consent

    a. If further verification is required. The patients GP will be asked to verify the Consent via a [Task](StructureDefinition-Task.html), example [Task national proxy request verification](Task-task-request-consent-verification.html)

4. The consent is now either active [Example Consent active](Consent-national-proxy-confirmed.html) or rejected [Example Consent rejected](Consent-consent-national-proxy-rejected.html)


### View a relationship

<figure>{% include national-proxy-service-sequence-view-relationship.svg %}</figure>
<br clear="all"/>

The RelatedPerson resource's SHALL conform to [England-RelatedPerson](StructureDefinition-RelatedPerson.html), example [RelatedPerson Jayne Smith](RelatedPerson-RelatedPerson-NHS-9000000017-Jane-Smith.html)

#### Search Parameters

| Name               | Type | Description                                                    |
|--------------------|------|----------------------------------------------------------------|
| identifier         | [token](https://www.hl7.org/fhir/search.html#token) | An Identifier of the RelatedPerson                             |
| patient:identifier | [token](https://www.hl7.org/fhir/search.html#token) | An Identifier of the patient this related person is related to |

#### Search Examples

Search for RelatedPerson's with a NHS Number of 9000000017

```
GET /RelatedPerson?identifier=https://fhir.nhs.uk/Id/nhs-number|9000000017
```

Search for RelatedPerson's that are related to a patient with a NHS Number of 9459304130

```
GET /RelatedPerson?identifier=https://fhir.nhs.uk/Id/nhs-number|9459304130
```

