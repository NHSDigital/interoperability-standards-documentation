
### Patient Registers

<figure>{% include administration-module-patient-registers.svg %}</figure>
<br clear="all"/>

#### Interoperability Standards

##### NHS England and HL7 UK

- [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/) This HL7 FHIR Implementation Guide specifies the requirements for a RESTful endpoint providing read-only access for direct care and subject of care access within the UK (covering patient demographics queries (PDQ) and medications).
- `deprecated` <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>. Covering
  - [Patient Demographics Query (PDQ)](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html)
  - [Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)

See also [IHE PDQm NHS England Elaboration](https://nhsd-confluence.digital.nhs.uk/display/IOPS/IHE+PDQm+Elaboration)

##### International
- [Patient Demographics Query for mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/index.html) The Patient Demographics Query for Mobile (PDQm) Profile defines a lightweight RESTful interface to a patient demographics supplier leveraging technologies readily available to mobile applications and lightweight browser based applications.
- [Patient Identifier Cross-Reference for Mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html) The Patient Identifier Cross-reference for Mobile (PIXm) Profile provides RESTful transactions for mobile and lightweight browser-based applications to create, update and delete patient records in a Patient Identifier Cross-reference Manager and to query the Patient Identifier Cross-reference Manager for a patient’s cross-domain identifiers. 

#### NHS England Services

- [Personal Demographics Service](personal-demographics-service.html)
- [National Proxy Service](national-proxy-service.html)
- [Multicast Notification Service](multicast-notification-service.html)

### Security and Privacy

<figure>{% include security-and-privacy-module.svg %}</figure>
<br clear="all"/>

#### NHS England Services

- [National Proxy Service](national-proxy-service.html)

### Clinical Categorization Resources

<figure>{% include administration-module-clinical-categorization-resources.svg %}</figure>
<br clear="all"/>

#### Interoperability Standards

##### NHS England

- `deprecated` <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>. Covering
  - [Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2.1) 


### Service Provider Directory Resources

<figure>{% include administration-module-provider-directory.svg %}</figure>
<br clear="all"/>

- [Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html) The Mobile Care Services Discovery (mCSD) Profile supports RESTful queries across related care services resources. The loosely coupled design and flexible querying capability of the mCSD Profile means it can be deployed within a variety of eHealth architectures and support a wide array of care workflows.

### Scheduling and Appointments

<figure>{% include administration-module-scheduling-and-appointments.svg %}</figure>
<br clear="all"/>

Add in STU3 standards


