The scope of this document and proposals is national, regional, NHS Trust and supplier.

### References

- [IHE Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)
- [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)
- [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>


### Introduction - HL7 v2 and IHE Event Notifications

A typical NHS Acute will use Trust Integration Engine (TIE) to route these messages to systems within the Trust. 
This common pattern is:

<figure>{% include pix-sequence-notifications-current.svg %}</figure>
<br clear="all"/>

This is described in [IHE Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)

### HL7 v2 ADT_A04 Example converted to HL7 FHIR

#### Use Case

`Mrs Smith attends the hospital to attend a drop in outpatient clinic recommended by her GP Dr. Townley of the Malton GP Practice. She arrives at the hospital and speaks to the receptionist Miss Cortana at the front desk. As this is the first time she has ever visited York Hospital, Miss Cortana takes the patient's name, address and date of birth and searches on the Personal Demographics Service for her details. This is found and Miss Cortana confirms it is the correct person. As Miss Cortana had previously consented to having a Summary Care Record, her allergy information was recieved from PSIS and this was also added to the record. Once this was saved and Mrs Smith was registered, this triggered a HL7 A28 message.`

An example HL7 v2 ADT_A28 is shown below, this is from <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201001021215||ADT^A28^ADT_A05|13403891320453338075|P|2.4|0|20100102121557|||GBR|UNICODE|EN||iTKv1.0
EVN||201001021213|||111111111^Cortana^Emily^^Miss^^RCB55|201001021213
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196513121515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||EN|M|C22|||||A|Berlin|N||GBR||DEU||||ED
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
NK1|2|SMITH^FRANCESCA^^^MRS^^L|16|29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H|+441234567890||||||||||1|196311111513||||EN
AL1|1|DA|Z88.5|5||199807011755
ZU8|U|1|Yes|
```

In FHIR this can convert into a FHIR Message following [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/message_maps.html), but we recommend converting this for FHIR RESTful and so 

- PID + PD1 converts to a [FHIR Patient](Patient-Patient-HL7v2-NHS-3333333333-Fredrica-Smith.html). 
  - FHIR Profile (NHS England) based on previous HL7 v2 PID/PD1 profiles [Patient HL7 v2](StructureDefinition-PatientHL7v2.html)
- NK1 converts to a [FHIR RelatedPerson](RelatedPerson-RelatedPerson-HL7v2-Francesca-Smith.html)
  - FHIR Profile (UK Core) based on previous HL7 v2 NK1 profile [RelatedPerson HL7 v2](https://simplifier.net/hl7fhirukcorer4/ukcore-relatedperson)

### HL7 FHIR and IHE Modernisation

<figure>{% include pix-sequence-notifications-future.svg %}</figure>
<br clear="all"/>

The previous pattern remains unchanged but an option of using FHIR is added. This is described in  [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html)

### HL7 FHIR and IHE Events Notifications via Pub/Sub

Current implementations typically use a [fixed distribution list](https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRouter.html), this can be enhanced by the addition of a [Publish-Subscribe Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html).
This is described in [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/)

Note: 

- Unlike IHE DSUBm, this uses **message** channels, FHIR Messaging and doesn't use the FHIR R5 Subscription backport. 
  - TODO This needs inconsistency needs to be checked - believe **rest-hook** channel is more desirable.

<figure>{% include pix-sequence-notifications-subscriptions.svg %}</figure>
<br clear="all"/>

1. The Patient Identity Consumer creates a [Subscription for patients with NHS Number of 3333333333](Subscription-Subscription-ex-Patient.html)
2. The Patient Identity Source (e.g. an Acute NHS Trust) sends a [Patient Identity Feed Message](Bundle-Bundle-ex-PMIRBundleCreate.html) to the Subscription Manager.
3. The Subscription Manager checks for matching subscriptions
4. For each matching Subscription it sends a [Patient Identity Feed Message](Bundle-Bundle-ex-PMIRBundleCreate.html) to the recipient.

