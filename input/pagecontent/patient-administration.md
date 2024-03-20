
### Current Standards

The current standard for Patient Identifier Cross-referencing in England can be found in
<a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> the section 3.1.4 Patient Identity Management describes interactions used by the majority of English NHS Trusts and suppliers to implement IHE [Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html) technical framework.

<!--
<img src="ihe-pix.png" alt="Structured Data Capture" width="80%" height="80%">
<br clear="all"/>
-->

### Identification Feeds and Notifications

PDS has two active projects in this area, these are 

- NHS Number allocation
- [Multi Cast Notification Service](https://nhsd-confluence.digital.nhs.uk/display/IOPS/Multicast+Notification+Service) (internal link). See [Multicast Notification Service API](https://digital.nhs.uk/developer/api-catalogue/multicast-notification-service)
  - This is a replacement for [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)

A use case around both programmes is 

`Donald has moved from Edinburgh (Scotland) to Leeds (England) for work reasons. Donald has a series condition and was recieving treatment from NHS Lothian, NHS Lothian has liased with Leeds Foundation NHS Trust to continue his care. As Donald is a UK citizen he is eligible for care from NHS England and so Leeds Foundation NHS Trust apply for an English NHS Number`

#### NHS Acute Trust version 

Leeds Teaching NHS Trust would have registered Donald as a Patient on their Patient Administration System (PAS), they would have created a Medical Record Number (MRN) to identify Donald across the trusts computer systems and possibly record his (NHS Scotland) CHI Number.
In HL7 FHIR this would look like [Patient Donald with CHI Number and MRN](Patient-donald-with-chi-number-and-mrn.html). Leeds Teaching Trusts follows <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> and so will also have an equivalent HL7 v2 representation.

Leeds Teaching NHS Trust registering Donald with NHS England looks like this: 

<img src="PDS-BPMN.png" alt="Structured Data Capture" width="80%" height="80%">
<br clear="all"/>

1. An administrator in Leeds Teaching Trust searches PDS to check Donald does not have a NHS Number
2. Depending on the results:

   a. If Donald is found on PDS, the Leeds Teaching Trust PAS is updated with the NHS Number. Leeds Teaching Trust will likely update the record on PDS with Donalds new address.
   
   b. If Donald is not found on PDS, a NHS Number allocation request (register Donald for care in NHS England) is sent and the returned NHS Number is used to update Leeds Teaching Trusts PAS. The FHIR Patient record returned from PDS looks something like this  [Patient Donald with NHS Number](Patient-donald-with-nhs-number.html)

3. In either case Leeds Teaching Trust need to inform all systems within the trust of the NHS Number. For this they will use the Trust Integration Engine (TIE) which will distribute both HL7 v2 ADT_A31 and/or FHIR Patient updates to the trusts systems. The FHIR Patient could look like this  [Patient Donald with NHS Number, CHI and MRN](Patient-donald-with-chi-number-mrn-and-nhs-number.html)

<figure>{% include pas-sequence-notifications.svg %}</figure>
<br clear="all"/>

Notes:

1. Leeds Teaching NHS Trust is following NHS England HL7 v2 standards, these standards also follow [Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)
2. Leeds Teaching NHS Trust PAS is the main source for patient demographics, it also contains identifiers from both NHS England and Scotland.
3. Leeds Teaching NHS Trust systems are using MRN to identify the Donald, not CHI or NHS Number. After the NHS Number allocation request, most systems will also know Donalds NHS Number.


#### NHS England version

NHS England has a similar sequence of events and notifications but is split between NHS Number Allocation and Multicast Notifications Service/PDS Event Notifications.

A NHS Number Allocation (same use case as Leeds Teaching Trust example above) is:

`Donald has moved from Scotland to a new apartment in Leeds and soon after visits her local NHS Trust to register for NHS services. Martha Puttin who is working on reception attempts several PDS Advanced Trace Querys but as she can find no previous record she decides to allocate a NHS number. She carefully completes the on screen record detailing Donals full name, address, date of birth, sex and telephone number as well as the GP practice number. Martha also marks the record to show that Donald has no previous NHS contact (in England).This is transmitted to PDS as a PDS NHS Number Allocation Request and a NHS number is allocated and returned via the PDS NHS Number Allocation Request Accepted.`

<figure>{% include pds-sequence-nhs-number-allocation.svg %}</figure>
<br clear="all"/>

An example of the Patient resource returned from PDS is [Patient Donald with NHS Number](Patient-donald-with-nhs-number.html)

Like Leeds Teaching Trust, PDS sends out demographic change event notifications. At present this would be via NEMS / [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)

<figure>{% include pds-sequence-mcns-notifications.svg %}</figure>
<br clear="all"/>

This diagram may have errors, MCNS originated as an internal notification service (e.g. it is an answer for the `Demographic Change Event notification` between PDS and the PDS Middleware). 
This should be clarified, as MCNS may not be intending to solve workflow processes like `Personal Demographics Service Notifications - FHIR` 

#### Analysis

The two viewpoints show several standards and specifications on a single process. Similar interactions exist on both use cases and these can be rationalised to this generic sequence.

<figure>{% include ihe-pam-sequence.svg %}</figure>
<br clear="all"/>

In this diagram:

- PDS Adanvanced Trace Queries or PDS Search for a Patient are `Patient Demographic Queries`
- Both NHS Allocation Request and NEMS/MCNS are `Patient Identity Feeds`, the main difference is the former is a request and later an event notification.

The NHS Trust version of these remains unchanged. Details on both of these can be found in 

- <a href="https://profiles.ihe.net/ITI/PDQm/" target="_blank">IHE Patient Demographics Query for Mobile (PDQm)</a>
- <a href="https://profiles.ihe.net/ITI/PIXm/index.html" target="_blank">IHE Patient Identifier Cross-referencing for mobile (PIXm)</a>

These standards are believed to be relatively compatible with exising IHE and HL7 guidance (all versions) as the data model is fairly consistent. Roughly the difference between NHS Trusts, IHE + HL7 and NHS England around data models is:

- `PDS NHS Number Allocation` and `PDS FHIR API` contain less patient identifier information than NHS Trust systems. This is probably not an issue where trusts are using a PAS system as the prime solution for Patient Identity use cases.
- `Personal Demographics Service Notifications - FHIR` has varied data models (message definitions), this is likely making interoperability difficult as conversion to IHE/HL7 is very likely to occur.
- `Multi Cast Notification Service` data model at present is not based on FHIR, it is uncertain if MCNS is intended to fit into the workflow processes described on this page.

`Personal Demographics Service Notifications - FHIR` introduced the concept of pub/sub notifications. IHE have also followed this requirement and created 

- <a href="https://profiles.ihe.net/ITI/PMIR/index.html" target="_blank">Patient Master Identity Registry (PMIR)</a>

<figure>{% include ihe-pam-plus-pmir-sequence.svg %}</figure>
<br clear="all"/>
