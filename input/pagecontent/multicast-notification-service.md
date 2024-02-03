### Overview

See [Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)
This is API is described using OAS

TODO Get confluence page links

### Related HL7/IHE Notification Frameworks

-  Subscriptions are used to establish proactive event notifications from a FHIR server to another system. Servers which have implemented support for Subscriptions will advertise their use via the resources Subscription and SubscriptionTopic. **This is a FHIR R5 description of the subject.**
   - [Subscriptions R5 Backport](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/index.html) describes how this FHIR R5 concept can be used in previous versions of FHIR including FHIR R4. 

- [FHIRcast](https://build.fhir.org/ig/HL7/fhircast-docs) FHIRcast synchronizes healthcare applications in real time to ensure the user acts on the same clinical information across these applications. For example, a radiologist often works in three disparate applications at the same time (a radiology information system, a PACS and a dictation system), in this case, each of these three systems needs to display the same study or patient at the same time.

### NHS England Interoperability Standards

This section is based around the use case of `GP Registration Change events`, which has a business process which would be classed as a part of [IHE Patient Identity Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2). The current NHS England (deprecated) standards for implementing this **enterprise** use case are:

- [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir) which use FHIR STU3 [messaging](interoperability-standards.html#messaging)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> Several NHS Trusts and Suppliers follow this specification, the majority follow more general HL7 v2 ADT. Note the NHS England HL7 v2 specification ADT_A28/A31 are based on [Patient Identity Feed [ITI-8]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-8.html) 

As both of these standards are based on **messaging** it is likely we will have a recommendation to use [RESTful API](restful-api.html) and a candidate to base implementation on would be [IHE Patient Identifier Cross-referencing for mobile (PIXm) - Patient Identity Feed FHIR [ITI-104]](https://profiles.ihe.net/ITI/PIXm/ITI-104.html) which is consistent with the NHS England approach for HL7 v2 ADT.

{% include patient-administration-managment-sequence-notifications.svg %}

All methods on this diagram are using the equivalent of a single [Patient](StructureDefinition-Patient.html) resource plus optional metadata, this is also true for HL7 v2 ADT A28/A31). This may not be true for the existing [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)

Based on messaging patterns from [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/) the recommendations are:

- Fixed Distrubution List [Recipient List](https://www.enterpriseintegrationpatterns.com/patterns/messaging/RecipientList.html) use either FHIR Cast or IHE ITI-104
- [Publish-Subscribe Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html) use FHIR Subscription.

All methods in this section use a maximum of two event types which is either `create` or `update`, as metadata or a http method. The exception to this is [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir) which has several FHIR [Messaging](interoperability-standards.html#messagaing) definitions, it is suggested that this is regarded as a **anti-pattern** and not carried forward. 

### Entity Relationship Diagram

Not applicable at present
