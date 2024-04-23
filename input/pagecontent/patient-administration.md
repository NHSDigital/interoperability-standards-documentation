
## Actors, Transactions, and Content Modules

* Actors
    * **Patient Demographics Consumer** A 3rd party system or application which is a client to a source of patient demographics such as an 
      * Patient Administration System (PAS)
      * Electronic Patient Record (EPR)
      * Master Patient Index (MPI) e.g. Personnel Demographics Service (PDS)
    * **Patient Identity Source** A source system of patient demographics such as a PAS, EPR, MPI or PDS. Systems such as MPI or PDS may also be 
      * **Patient Identity Registry** a master patient index of patient demographics and identity.
    * **Patient Identity Consumer** A client system to **Patient Identity Source** and/or **Patient Identity Registry** such as a Electronic Document Management System (EDMS/XDS), Laboratory Information Managment System (LIMS), etc. These systems do not normally manage patient demographics.

## Overview

<figure>{% include patient-administration-activity.svg %}</figure>
<br clear="all"/>

### Find Patient

#### Use Case

---

A Mosa visits is pregnant and visits the local maternity ward for the first time. 

The maternity nurse needs to register the patient; in doing so, it is desired to record the patient’s demographic data in the Electronic Patient Record (EPR). 
The hospital is connected to a NHS England Personnel Demographic Service (PDS). The nurse issues a patient demographic query request to PDS acting as a **Patient Identity Source**, with some basic patient demographics data as search criteria. 

In the returned patient list, she picks an appropriate record for the patient and this is used to create a local patient demographic record in the EPR.
Other local systems (**Patient Identity Consumer**) are informed of this new patient record via Patient Identity Feeds.

**Note:** PDS may be replaced with a local Patient Administration System (PAS) or regional Master Patient Index (MPI) systems.  

---

#### Process Flow

<figure>{% include patient-administration-find-patient.svg %}</figure>
<br clear="all"/>

### Create Patient

#### Use Case

---

Following a healthy pregnancy, Mosa gives birth to her new baby, Joshua. Information is captured about Joshua and about the relationship between him and his parents in the hospitals electronic patient records (EPR) system. Leveraging the information in the EPR, a new patient master identity record is created for baby Joshua in NHS England's Personnel Demographics System (PDS).

Joshua’s patient master identity in NHS England PDS establishes his unique identity across the English NHS.

Joshua now has his unique master identifier (NHS Number) for health purposes, which affords care in the English NHS. 

Other local systems and the new GP (**Patient Identity Consumer**) are informed of this new patient record via Patient Identity Feeds.

---

#### Process Flow

<figure>{% include patient-administration-create-patient.svg %}</figure>
<br clear="all"/>

### Update Patient

#### Use Case

---

Following a healthy childhood and after completing his schooling, Joshua leaves home to start a new job in a nearby city. As part of starting his new job at his new company, Joshua registers with a local GP.

Joshua’s identity details are created in the GP’s EPR with his new address and his new mobile phone number. The EPR searches NHS England PDS for Joshua’s master patient identity and then updates NHS England PDS with Joshua’s updated demographic details.

---

#### Process Flow

<figure>{% include patient-administration-update-patient.svg %}</figure>
<br clear="all"/>

### Merge Patient

#### Use Case

---

Joshua becomes concerned and travels to a different city to visit a Sexual Health clinic to be tested for HIV. He provides inaccurate demographic information at the clinic, who set up a new record for him in their EPR. The EPR communicates this demographic information to NHS England PDS where the NHS Number is not found and so the local demographic record is used instead.

Joshua completes the HIV rapid test, which is positive. A confirmatory test is taken, which must be sent to the regional lab for processing. Both the results of the rapid test and the results of the confirmatory test reference Joshua’s duplicate patient demographic record. The test results are not shared on the Shared Health Record (SHR) as the patient master identity was not found.

When Joshua returns to the clinic to receive his confirmatory lab results, and after receiving counseling regarding confidentiality rules and the importance of care continuity, Joshua corrects his patient demographic record. The EPR now sucessfully identifies Joshua's record on NHS England PDS and this identifies another record for Joshua on the local EPR. The two lcoal records are merged on the EPR and the EPR sends a merge message to all **Patient Identity Consumers**.

**Note:** An unmerge would be handled as an administrative function.

The various (external) databases that store health information about Joshua have subscribed to patient update transactions on the local EPR. To ensure patient safety for Joshua, these systems ensure that a query using Joshua’s resolved patient master identity would, correctly, return all of the health information associated with him – whether it was originally persisted under his correct (surviving) patient master identity or under the duplicate (subsumed) patient master identity.

---

#### Process Flow

<figure>{% include patient-administration-merge-patient.svg %}</figure>
<br clear="all"/>

### Patient Registration Forms

---

Following a healthy childhood and after completing his schooling, Joshua leaves home to start a new job in a nearby city. As part of starting his new job at his new company, Joshua registers with a local GP.

The GP receptionist will begin a patient registration process and this will often include completion of a form e.g. [GMS1 Form](https://www.gov.uk/government/publications/gms1). Once completed details on the form are used to retrieve the NHS England Patient Demographic record from PDS which is used to create a local demographic record. Other details on the form are used to populate the local EPR record (e.g. weight, smoking status, etc) 

---

#### Process Flow

<figure>{% include patient-administration-patient-registration.svg %}</figure>
<br clear="all"/>
