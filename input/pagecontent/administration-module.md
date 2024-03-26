


### Patient Administration

Patient Administration is primarily concerned with supporting the delivery of care. This was an early area of health interoperability standards by both HL7 and IHE, these standards have been widely adopted in the NHS especially in Acute care.

These administrative support a typical process as follows:

<img style="max-width: 100%" alt="Consent workflow BPMN diagram." src="health-admin-overview.png"/>
<br clear="all"/>

A patient decides they need assistance with a health condition and so arrange begin arranging an appointment with a practitioner. The first two steps are often conducted via a telephone call or an application such as NHS App.

- The first step is identifying the patients demographics record on an electronic patient record system (EPR) or a patient administration system. This step may be performed by the patient or an administrator.
  - A record is either found or not found.
  - A record is found. On this step the demographics record will often be updated.
- A record is not found and a demographics record is updated. This step may involve using other systems such NHS England's Personnel Demographics Service (PDS), the services are often similar to those found on EPR or PAS systems and may also be used instead (e.g. PDS).
- An appointment is booked or scheduled
- Patient has a consultation with a practitioner, this can be physical or virtual.

The administrative steps described above break down into four common processes

- **Step 1** [Patient Demographics Queries (PDQ)](patient-demographics-query.html) this allows a 3rd party application to search for patient demographics.
- **Step 2** [Patient Identity Management (PIX)](patient-identity-management.html) this is a series of event notifications which keep other systems informed of demographic record changes.
- **Step 3** Appointment Scheduling - see below
- **Step 4** [Patient Encounter Management (PEM)](patient-encounter-management.html) this is a series of event notifications which inform other systems and practitioners of a patients progress along a care journey. These are often simple event messages which say (they are not often used to convey clinical data but can do):
  - patient has arrived
  - patient has been admitted
  - patient consultation has begun
  - patient has been transferred
  - patient has been discharged

In HL7 v2 these are collectively known as ADT or Admission, Discharge and Transfers. In HL7 FHIR these are known as IHE PDQm, PIXm and PMIR (/FHIR Subscriptions). 

These steps are also supported by central NHS England Services:

- [Personal Demographics Services including NHS Number allocation](personal-demographics-service.html) for verifying NHS, access the national patient demographics record, allocating a NHS Number and updating the national demographics record.


<figure>{% include administration-module-patient-registers.svg %}</figure>
<br clear="all"/>

#### International Specifications

These specifications contain use case, requirements analysis and recommended technical implementation guidance.

- [Patient Demographics Query for Mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/) HL7 FHIR R4
- [Patient Demographics Queries (PDQ)](patient-demographics-query.html) HL7 v2
- [Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html) HL7 FHIR R4
  - [Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/) HL7 FHIR R4 Subscriptions
- [Patient Identity Management (PIX)](patient-identity-management.html) HL7 v2

#### NHS England Specifications

- `deprecated` <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>. Covering
  - [Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2.1)

#### NHS England Services

- [Personal Demographics Services including NHS Number allocation](personal-demographics-service.html)
- [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)


### Security and Privacy

<figure>{% include security-and-privacy-module.svg %}</figure>
<br clear="all"/>

#### International Specifications

These specifications contain use case, requirements analysis and recommended technical implementation guidance.

- [IHE Privacy Consent on FHIR (PCF)](https://profiles.ihe.net/ITI/PCF/index.html) describes how to use Consent to control access via an (OAuth2) authorisation server.
- [IHE Internet User Authorization (IUA)](https://profiles.ihe.net/ITI/IUA/index.html)
- [IHE Basic Audit Log Patterns (BALP)](https://profiles.ihe.net/ITI/BALP/index.html) This does not cover how to view an audit for a patient (e.g. GET /AuditEvent?patient:identifier={nhsNumber})

#### NHS England Services

- [National Proxy Service](national-proxy-service.html)

### Clinical Categorization Resources

<figure>{% include administration-module-clinical-categorization-resources.svg %}</figure>
<br clear="all"/>

#### International Specifications

These specifications contain use case, requirements analysis and recommended technical implementation guidance.

- [Patient Encounter Management (PEM)](patient-encounter-management.html)

##### NHS England Specifications

- `deprecated` <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>. Covering
  - [Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.2.1) 

#### NHS England Services

- [Reasonable Adjustments](https://declankieran-nhsd.github.io/ra-sandbox/index.html)

### Service Provider Directory Resources

<figure>{% include administration-module-provider-directory.svg %}</figure>
<br clear="all"/>

#### International Specifications

These specifications contain use case, requirements analysis and recommended technical implementation guidance.

- [Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html) The Mobile Care Services Discovery (mCSD) Profile supports RESTful queries across related care services resources. The loosely coupled design and flexible querying capability of the mCSD Profile means it can be deployed within a variety of eHealth architectures and support a wide array of care workflows.

#### NHS England Services

- [Spine Directory Service - LDAP API](https://digital.nhs.uk/developer/api-catalogue/spine-directory-service-ldap)
  - [Spine Directory Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/spine-directory-service-fhir) this exposes a subset of SDS LDAP API functionality
- [Organisation Data Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/organisation-data-service-fhir)
- Directory Of Services is spread across
  - [Directory of Services - Urgent and Emergency Care - REST API](https://digital.nhs.uk/developer/api-catalogue/directory-of-services-urgent-and-emergency-care-rest)
  - [Directory of Healthcare Services (Service Search) API](https://digital.nhs.uk/developer/api-catalogue/directory-of-healthcare-services)
  - [Electronic Prescription Service Directory of Services API](https://digital.nhs.uk/developer/api-catalogue/electronic-prescription-service-directory-of-services)
  - [e-Referral Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir)


### Scheduling and Appointments

<figure>{% include administration-module-scheduling-and-appointments.svg %}</figure>
<br clear="all"/>

#### NHS England Specifications

- [NHS Booking - FHIR API](https://digital.nhs.uk/developer/api-catalogue/nhs-booking-fhir) Hl7 FHIR STU3 - for providers other than General Practice providers
- [GP Connect Appointment Management - FHIR API](https://digital.nhs.uk/developer/api-catalogue/gp-connect-appointment-management-fhir) HL7 FHIR STU3 - General Practice providers only

#### NHS England Services

TODO Add in all the booking specs and services
- [Booking and Referral - FHIR API](https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir) HL7 FHIR R4
- [GP Connect (Patient Facing) Appointment Management - FHIR API](https://digital.nhs.uk/developer/api-catalogue/gp-connect-patient-facing-appointment-management-fhir) HL7 FHIR R4



