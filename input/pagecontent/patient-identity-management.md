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

This pattern is very common within the NHS and Social Services so any deviation is not recommended. It should be anticipated that a mix of HL7 versions will be present, to avoid difficulties it is recommended that the data model used by these different HL7 versions is followed. The next section demonstrates a transformation of a HL7 v2 Event Notification to HL7 Resources.

### IHE PIX/PIXm or HL7 v2/FHIR Example

#### Use Case

`Mrs Smith attends the hospital to attend a drop in outpatient clinic recommended by her GP Dr. Townley of the Malton GP Practice. She arrives at the hospital and speaks to the receptionist Miss Cortana at the front desk. As this is the first time she has ever visited York Hospital, Miss Cortana takes the patient's name, address and date of birth and searches on the Personal Demographics Service for her details. This is found and Miss Cortana confirms it is the correct person. As Miss Cortana had previously consented to having a Summary Care Record, her allergy information was recieved from PSIS and this was also added to the record. Once this was saved and Mrs Smith was registered, this triggered a HL7 A28 message.`

#### HL7 v2 ADT_A28/A31 Examples

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

The payload for a v2 ADT_A31 for a use case of 

`Mrs Smith's record is updated with the addition of a further allergy.`

is 

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201001021236||ADT^A31^ADT_A05|134039113204538055|P|2.4|0|20100102123657|||GBR|UNICODE|EN||iTKv1.0
EVN||201001021237|||111111111^Cortana^Emily^^Miss^^RCB55|201001021230
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196513121515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||EN|M|C22|||||A|Berlin|N||GBR||DEU||||ED
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
NK1|2|SMITH^FRANCESCA^^^MRS^^L|16|29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H|+441234567890||||||||||1|196311111513||||EN
AL1|1|DA|Z88.5|5||199807011755
AL1|2|DA|T63.0|7||199306050000
ZU8|U|1|Yes
```

#### HL7 FHIR Patient and RelatedPerson Examples

In FHIR either of these examples can convert into a FHIR Message following [HL7 Version 2 to FHIR](https://build.fhir.org/ig/HL7/v2-to-fhir/message_maps.html), but we recommend converting this for FHIR RESTful and so 

##### HL7 FHIR Patient

- PID + PD1 segments from the HL7 v2 example convert to a [Example FHIR Patient](Patient-Patient-HL7v2-NHS-3333333333-Fredrica-Smith.html). 
  - FHIR Profile (NHS England) based on previous HL7 v2 PID/PD1 profiles [Patient HL7 v2](StructureDefinition-PatientHL7v2.html). 
  - [UKCore-Patient](https://simplifier.net/hl7fhirukcorer4/ukcore-patient) could be used instead. Note the constraints in [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](HSCIC ITK HL7 V2 Message Specifications.pdf) are similar.

IHE PIXm (/FHIR RESTful) would be sent to a recipient as 

```
PUT /Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|3333333333
```

##### HL7 FHIR RelatedPerson 

- NK1 segment from the HL7 v2 example converts to a [Example FHIR RelatedPerson](RelatedPerson-RelatedPerson-HL7v2-Francesca-Smith.html)
  - FHIR Profile (UK Core) based on previous HL7 v2 NK1 profile [RelatedPerson HL7 v2](https://simplifier.net/hl7fhirukcorer4/ukcore-relatedperson). Note UKCore-RelatedPerson could be used instead.

RelatedPerson is not covered by IHE PIXm but FHIR RESTful interactions can still be used.

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

