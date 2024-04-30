based on use case from https://profiles.ihe.net/ITI/PMIR/volume-1.html#1494-pmir-overview and amended to use UK terminology

## Actors, Transactions, and Content Modules

Actors

- **Patient Demographics Consumer** A 3rd party system or application which is a client to a source of patient demographics such as an
  - Patient Administration System (PAS)
  - Electronic Patient Record (EPR)
  - Master Patient Index (MPI) e.g. Personnel Demographics Service (PDS)
- **Patient Identity Source** A source system of patient demographics such as a PAS, EPR, MPI or PDS. Systems such as MPI or PDS may also be
  - **Patient Identity Registry** a master patient index of patient demographics and identity.
- **Patient Identity Consumer** A client system to Patient Identity Source and/or Patient Identity Registry such as a Electronic Document Management System (EDMS/XDS), Laboratory Information Management System (LIMS), etc. These systems do not normally manage patient demographics.

## Introduction

Within the area of Patient Identification, we have identified five main use cases: Find Patient, Create Patient, Update Patient, Merge Patient and Patient Registration Form. For each use case, we have included a high-level description, a process flow which includes a sequence diagram and pre-conditions, main course and post-conditions of the use case, and details of the Standards and Services that are relevant to each use case.

<div>
<img src="demographics-pathway.png"  alt="Demographics Pathway" width="60%">
<p>Figure 1 - Demographics Pathway</p>
<p></p>
</div>

## Overview

<figure>{% include pam-overview-activity.svg %}</figure>
<br clear="all"/>

### Find Patient

#### Use Case

---

Mosa is pregnant and visits the local maternity ward for the first time.

The maternity nurse needs to register the patient; in doing so, it is desired to record the patient’s demographic data in the Electronic Patient Record (EPR). The hospital is connected to a NHS England Personnel Demographic Service (PDS). The nurse issues a patient demographic query request to PDS acting as a Patient Identity Source, with some basic patient demographics data as search criteria.

In the returned patient list, she picks an appropriate record for the patient and this is used to create a local patient demographic record in the EPR. Other local systems (Patient Identity Consumer) are informed of this new patient record via Patient Identity Feeds.

Note: PDS may be replaced with a local Patient Administration System (PAS) or regional Master Patient Index (MPI) systems.

---

#### Process Flow


<table>
<tr>
<td>
<figure>{% include pam-find-patient.svg %}</figure>
</td>
<td>

<h4>Pre-conditions:</h4>

The maternity nurse has access to an EPR/PAS and has the valid authorisaton to retireve the patient's details and has details of the patient's required demographic data.

<br/>
<br/>
<h4>Main Flow:</h4>

The maternity nurse initiates a search query within EPR/PAS which then retrieves her demographic data. If multiple matches are found, the maternity nurse will select the desired record from the list.

<br/>
<br/>
<h4>Post-conditions:</h4>

The patient identity (NHS Number or MRN) is used to access API's and systems.

</td>
</tr>
</table>

#### Standards

- [IHE Patient Demographics Query for Mobile (PDQm)](https://profiles.ihe.net/ITI/PIXm/index.html) The Patient Demographics Query for Mobile (PDQm) Profile defines a lightweight RESTful interface to a patient demographics supplier leveraging technologies readily available to mobile applications and lightweight browser based applications.
- [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](https://nhsdigital.github.io/interoperability-standards-skunkworks/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf) aligned to [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html), PIX and PDQ.

#### Services

- [Personal Demographics Service - FHIR API Access patients](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir) (England national) personal information, such as name, address, date of birth, related people, registered GP, nominated pharmacy and NHS number using the FHIR version of the Personal Demographics Service (PDS) API.
    - This is close to IHE PDQm

### Create Patient

#### Use Case

---

Following a healthy pregnancy, Mosa gives birth to her new baby, Joshua. Information is captured about Joshua and about the relationship between him and his parents in the hospitals electronic patient records (EPR) system. Leveraging the information in the EPR, a new patient master identity record is created for baby Joshua in NHS England’s Personnel Demographics System (PDS).

Joshua’s patient master identity in NHS England PDS establishes his unique identity across the English NHS.

Joshua now has his unique master identifier (NHS Number) for health purposes, which affords care in the English NHS.

Other local systems and the new GP (Patient Identity Consumer) are informed of this new patient record via Patient Identity Feeds.

---

#### Process Flow

<table>
<tr>
<td>
<figure>{% include pam-create-patient.svg %}</figure>
</td>
<td>

<h4>Pre-conditions:</h4>

Joshua is born at a care facility. The details about his name, his gender, and his parental relationships are known. These are captured in the care facility’s EPR. Since this is a birth and the first time the record is entered in the EMR, no queries are made to search for existing records.

<br/>
<br/>
<h4>Main Flow:</h4>

Joshua’s information in the care facility’s EPR is communicated to other systems within the locality via a patient created event notification.

<br/>
<br/>
<h4>Post-conditions:</h4>

If the Create message was valid, local systems may create their own patient demographic record. 


</td>
</tr>
</table>

When a patient record is created this triggers a Patient Created [Event Message](https://www.enterpriseintegrationpatterns.com/patterns/messaging/EventMessage.html)

#### Standards

- [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html) The Patient Identifier Cross-reference for Mobile (PIXm) Profile provides RESTful transactions for mobile and lightweight browser-based applications to create, update and delete patient records in a Patient Identifier Cross-reference Manager and to query the Patient Identifier Cross-reference Manager for a patient’s cross-domain identifiers.
- [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](https://nhsdigital.github.io/interoperability-standards-skunkworks/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf) aligned to [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html), PIX and PDQ.

#### Services

- [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)  Receive notifications about changes to a patient's (England national) demographic details, including record change, birth, death, change of address and change of GP.
  - This is related to IHE PIXm and PMIR




### Update Patient

#### Use Case

Following a healthy childhood and after completing his schooling, Joshua leaves home to start a new job in a nearby city. As part of starting his new job at his new company, Joshua registers with a local GP.

Joshua’s identity details are created in the GP’s EPR with his new address and his new mobile phone number. The EPR searches NHS England PDS for Joshua’s master patient identity and then updates NHS England PDS with Joshua’s updated demographic details.

#### Process Flow

<table>
<tr>
<td>
<figure>{% include pam-update-patient.svg %}</figure>
</td>
<td>

<h4>Pre-conditions:</h4>

Joshua has moved to the city and has a new address and mobile phone number. Joshua’s record is retrieved from the EPR and these updated details are captured in the community care facility’s EPR.

<br/>
<br/>
<h4>Main Flow:</h4>

Joshua’s information in the care facility’s EPR is communicated to other local systems as an update patient record event notification, this may also make use of a Subscribe-Notify pattern

<br/>
<br/>
<h4>Post-conditions:</h4>

If the EPR message was valid, his existing patient record may be updated on the PDS with the new, more up-to-date information that was captured in the community clinic’s EPR.

</td>
</tr>
</table>


#### Standards

- [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html) The Patient Identifier Cross-reference for Mobile (PIXm) Profile provides RESTful transactions for mobile and lightweight browser-based applications to create, update and delete patient records in a Patient Identifier Cross-reference Manager and to query the Patient Identifier Cross-reference Manager for a patient’s cross-domain identifiers.
- [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](https://nhsdigital.github.io/interoperability-standards-skunkworks/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf) aligned to [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html), PIX and PDQ.
- [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/index.html) The Patient Master Identity Registry (PMIR) Profile supports the creating, updating and deprecating of patient master identity information about a subject of care, as well as subscribing to changes to the patient master identity, using the HL7 FHIR standard resources, **FHIR Subscriptions** and RESTful transactions. In PMIR, “patient identity” information includes all information found in the FHIR Patient Resource such as identifier, name, phone, gender, birth date, address, marital status, photo, others to contact, preference for language, general practitioner, and links to other instances of identities. The “patient master identity” is the dominant patient identity managed centrally among many participating organizations (a.k.a., “Golden Patient Identity”)

#### Services

- [Personal Demographics Service Notifications - FHIR](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-notifications-fhir)  Receive notifications about changes to a patient's (England national) demographic details, including record change, birth, death, change of address and change of GP.
  - This is related to IHE PIXm and PMIR


### Merge Patient

#### Use Case

Joshua becomes concerned and travels to a different city to visit a Sexual Health clinic to be tested for HIV. He provides inaccurate demographic information at the clinic, who set up a new record for him in their EPR. The EPR communicates this demographic information to NHS England PDS where the NHS Number is not found and so the local demographic record is used instead.

Joshua completes the HIV rapid test, which is positive. A confirmatory test is taken, which must be sent to the regional lab for processing. Both the results of the rapid test and the results of the confirmatory test reference Joshua’s duplicate patient demographic record. The test results are not shared on the Shared Health Record (SHR) as the patient master identity was not found.

When Joshua returns to the clinic to receive his confirmatory lab results, and after receiving counselling regarding confidentiality rules and the importance of care continuity, Joshua corrects his patient demographic record. The EPR now successfully identifies Joshua’s record on NHS England PDS and this identifies another record for Joshua on the local EPR. The two local records are merged on the EPR and the EPR sends a merge message to all Patient Identity Consumers.

Note: An unmerge would be handled as an administrative function.

The various (external) databases that store health information about Joshua have subscribed to patient update transactions on the local EPR. To ensure patient safety for Joshua, these systems ensure that a query using Joshua’s resolved patient master identity would, correctly, return all of the health information associated with him – whether it was originally persisted under his correct (surviving) patient master identity or under the duplicate (subsumed) patient master identity.

#### Process Flow

<table>
<tr>
<td>
<figure>{% include pam-merge-patient.svg %}</figure>
</td>
<td>

<h4>Pre-conditions:</h4>

Systems that maintain patient information subscribe to the <b>Update Patient</b> event notifications.

<br/>
<br/>
<h4>Main Flow:</h4>

A duplicate patient master identity is detected and when the error is found, the duplicate identities are merged on the EPR, and a transaction is executed to merge them on the EPR.

This triggers sending notifications to the health data systems that have subscribed to updates on the EPR/PAS, which include updated information about the patient identities that were merged. Each of these health data systems updates their local health data to reflect the merged patient master identity.

<br/>
<br/>
<h4>Post-conditions:</h4>

Following the execution of the triggered merge message, each system that maintains health data about the subject of care has updated this local data to reflect the merge of the two patient identities. The subsumed patient identity is deprecated

When a patient record is merged this triggers a Patient Merge Event Message, this may also make use of a Subscribe-Notify pattern

</td>
</tr>
</table>


#### Standards

- [IHE Patient Identifier Cross-referencing for mobile (PIXm)](https://profiles.ihe.net/ITI/PIXm/index.html) The Patient Identifier Cross-reference for Mobile (PIXm) Profile provides RESTful transactions for mobile and lightweight browser-based applications to create, update and delete patient records in a Patient Identifier Cross-reference Manager and to query the Patient Identifier Cross-reference Manager for a patient’s cross-domain identifiers.
- [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](https://nhsdigital.github.io/interoperability-standards-skunkworks/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf) aligned to [IHE Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html), PIX and PDQ.
- [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/index.html) The Patient Master Identity Registry (PMIR) Profile supports the creating, updating and deprecating of patient master identity information about a subject of care, as well as subscribing to changes to the patient master identity, using the HL7 FHIR standard resources, **FHIR Subscriptions** and RESTful transactions. In PMIR, “patient identity” information includes all information found in the FHIR Patient Resource such as identifier, name, phone, gender, birth date, address, marital status, photo, others to contact, preference for language, general practitioner, and links to other instances of identities. The “patient master identity” is the dominant patient identity managed centrally among many participating organizations (a.k.a., “Golden Patient Identity”)

#### Services

nil

### Patient Registration Forms

#### Use Case

---

Following a healthy childhood and after completing his schooling, Joshua leaves home to start a new job in a nearby city. As part of starting his new job at his new company, Joshua registers with a local GP.

The GP receptionist will begin a patient registration process and this will often include completion of a form e.g. GMS1 Form. Once completed details on the form are used to retrieve the NHS England Patient Demographic record from PDS which is used to create a local demographic record. Other details on the form are used to populate the local EPR record (e.g. weight, smoking status, etc)

---

#### Process Flow

<table>
<tr>
<td>
<figure>{% include pam-patient-registration.svg %}</figure>
</td>
<td>

<h4>Pre-conditions:</h4>

GP Receptionist has access to the EPR/PAS. Receptionist is unable to find the patient on the EPR/PAS. 

<br/>
<br/>
<h4>Main Flow:</h4>

Receptionist initiates the registration process and patient completes the registration form providing the necessary personal information, which the receptionist then uses to retrieve the PDS record. If a matching record is found, then the data is used to create a local EPR.

<br/>
<br/>
<h4>Post-conditions:</h4>

New patient's registration process is successfully completed. <b>Create Patient</b> is likely to be triggered.

</td>
</tr>
</table>


#### Data Standards

- [https://digital.nhs.uk/services/register-with-a-gp-surgery-service/get-help-using-the-service/questions-asked](https://digital.nhs.uk/services/register-with-a-gp-surgery-service/get-help-using-the-service/questions-asked)
- [GMS1 - Family Doctor Registration Form](https://www.gov.uk/government/publications/gms1)

#### Standards

- [HL7 Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/)
- [IHE Retrieve Form for Data Capture](https://wiki.ihe.net/index.php/Retrieve_Form_for_Data_Capture)
