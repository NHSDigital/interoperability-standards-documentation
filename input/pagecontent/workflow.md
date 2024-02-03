
### Conversations

`Conversations between components often resemble conversations in real life`

Gregor Hohpe 2017 [Conversation Patterns](https://www.enterpriseintegrationpatterns.com/patterns/conversation/index.html)

This is the key concept behind [FHIR Workflow](https://hl7.org/fhir/R4/workflow.html). This is based on patient information being shared via [RESTful API](https://hl7.org/fhir/R4/http.html) and/or [Documents](https://hl7.org/fhir/R4/documents.html) as **default**. Clinical records are **NOT transferred or duplicated** as would be the case with FHIR and some V2 [Messaging](https://hl7.org/fhir/R4/messaging.html) 

#### Example National Proxy Service


<div>
<img src="National-Proxy-Validation.png"  alt="National Proxy Validation" width="60%">
<p>Figure 1 - National Proxy Validation</p>
<p></p>
</div>

Explain diagram - ideally refer to proxy documentation

{% include national-proxy-service-sequence-diagram.svg %}

{% include national-proxy-service-sequence-diagram-fhir.svg %}

{% include national-proxy-service-state-diagram.svg %}


