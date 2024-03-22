


### Health Administration

Health Administration is primarily concerned with supporting the delivery of care. This was an early area of health interoperability standards by both HL7 and IHE, these standards have been widely adopted in the NHS especially in Acute care.

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
- [National Proxy Service](national-proxy-service.html)

<figure>{% include administration-module-patient-registers.svg %}</figure>
<br clear="all"/>


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


