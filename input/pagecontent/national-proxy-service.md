

### Overview

<div>
<img src="National-Proxy-Process-Overview.png"  alt="National Proxy Overview" width="60%">
<p>Figure 1 - National Proxy Overview</p>
<p></p>
</div>

Add link to OAS Spec when published

<figure>{% include national-proxy-service-sequence-view-relationship.svg %}</figure>
<br clear="all"/>

### View a relationship

<figure>{% include consent-usecase.svg %}</figure>
<br clear="all"/>

The RelatedPerson resource's SHALL conform to [England-RelatedPerson](StructureDefinition-RelatedPerson.html)

#### Search Parameters

| Name               | Type | Description                                                    |
|--------------------|------|----------------------------------------------------------------|
| identifier         | [token](https://www.hl7.org/fhir/search.html#token) | An Identifier of the RelatedPerson                             |
| patient:identifier | [token](https://www.hl7.org/fhir/search.html#token) | An Identifier of the patient this related person is related to |

#### Search Examples

Search for RelatedPerson's with a NHS Number of 9449304130

```
GET /RelatedPerson?identifier=https://fhir.nhs.uk/Id/nhs-number|9449304130
```

Search for RelatedPerson's that are related to a patient with a NHS Number of 9459304130

```
GET /RelatedPerson?identifier=https://fhir.nhs.uk/Id/nhs-number|9459304130
```

