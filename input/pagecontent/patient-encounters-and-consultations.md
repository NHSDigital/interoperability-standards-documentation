
## Actors, Transactions, and Content Modules

* Actors
    * **Patient Encounter Supplier** The healthcare provider system used to manage the encounter, this will often be known as   
      * Patient Administration System (PAS)
      * Electronic Patient Record (EPR)
      * Personal Health Record (PHR)
    * **Patient Encounter Consumer** The patient and other practitioners involved in the delivery of care to the patient both internal and external to the healthcare provider. 
    * **Clinical Data Source** A system for recording health care data. This is often a 
      *  Electronic Patient Record (EPR)

## Overview

### General Practice Consultation

#### Use Case

---

Joshua, now 40, has been asked to book a [NHS Health Check](https://www.nhs.uk/conditions/nhs-health-check/). 

Following the booking, Joshua is notified of the appointment. 

He attends the appointment with nurse Aube, Aube takes a number of measurements tests which recorded in the Electronic Patient Record. Aube notes Joshua is overweight and so performs a Blood Sugar tests and also a diabetes risk assesment. 
The diabetes risk assesment indicates elevated risk of **type 2 diabetes** 
The results are discussed with Joshua which includes advice loosing weight and options for help such as physical activity and [NHS Diabetes Prevention Programme (NHS DPP)](https://www.england.nhs.uk/diabetes/diabetes-prevention/) 

On completion of the health check, other care providers are notified the health check has been performed. The results of health check are automatically shared via **GP Connect API's**

---

#### Process Flow

<figure>{% include patient-encounter-sequence-gp.svg %}</figure>
<br clear="all"/>

#### Standards

* [IHE PEM](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2) 
* [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](HSCIC ITK HL7 V2 Message Specifications.pdf) this is a framework based on IHE PEM.

#### Services

nil

### Outpatient (inc. Virtual) Encounters

#### Use Case

---

Joshua has followed Aube's advice and started on a [NHS Diabetes Prevention Programme (NHS DPP)](https://www.england.nhs.uk/diabetes/diabetes-prevention/) and a [Physical Activity](https://www.nice.org.uk/guidance/ph54) programme with a social provider in order to improve his health condition.

Both programmes involve a series of face to face consultations and can be supported by digital tools such as wearable technologies that monitor levels of exercise, apps where users can access health coaches, online peer support groups and the ability to set and monitor goals electronically. Online consultations may be known as virtual consultations.
Each consultation whether online or face 2 face will be recorded on a EPR or PHR. 

As each provider, the patient and the GP are concurrently working on similar pathways they will keep each other informed of key events and share data with each other via Query API's.

On completion of each programme a discharge event notification is generated and a discharge report completed.  

---

#### Process Flow

<figure>{% include patient-encounter-activity-outpatient.svg %}</figure>
<br clear="all"/>

<figure>{% include patient-encounter-sequence-outpatient.svg %}</figure>
<br clear="all"/>

#### Standards

* [IHE PEM](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
* [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](HSCIC ITK HL7 V2 Message Specifications.pdf) this is a framework based on IHE PEM.

#### Services

* [NHS England Transfer of Care API's](https://digital.nhs.uk/services/transfer-of-care-initiative/apis) This is a method of sending Encounter documentation to primary care providers, it also notifies them of the encounter event.
  * Outpatient attendance

### Inpatient Encounters

Also, applicable to emergency and daycases.

---

Joshua blah blah - some condition (diabetes related) which gets him hospital and requires outpatient care 

build up the case for care planning elaboration and XDS/QEDm requirement for sharing care records 

---

#### Process Flow

<figure>{% include patient-encounter-activity-inpatient.svg %}</figure>
<br clear="all"/>

<figure>{% include patient-encounter-sequence-inpatient.svg %}</figure>
<br clear="all"/>

#### Standards

* [IHE PEM](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
* [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](HSCIC ITK HL7 V2 Message Specifications.pdf) this is a framework based on IHE PEM.

#### Services

* [NHS England Transfer of Care API's](https://digital.nhs.uk/services/transfer-of-care-initiative/apis) This is a method of sending Encounter documentation to primary care providers, it also notifies them of the encounter event.
    * Inpatient/daycase (acute) discharge
    * Emergency care discharge
    * Mental health discharge


### Sharing Encounter Data

---

Joshua blah blah - concurrent care from multiple providers so it is important for all providers to share records (and not wait for clinic letters and discharge reports)

---

#### Process Flow

<figure>{% include pcc-44.svg %}</figure>
<br clear="all"/>

#### Standards

* [HL7 International Patient Access (IPA)](https://build.fhir.org/ig/HL7/fhir-ipa/) FHIR R4
* [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) FHIR R4
  * Is likely to become aligned with HL7 IPA.
* [Care Connect FHIR API](https://nhsconnect.github.io/CareConnectAPI/) FHIR STU3

#### Services

* Primary Care/GP Connect
  * [GP Connect (Patient Facing) Access Record - FHIR API](https://digital.nhs.uk/developer/api-catalogue/gp-connect-patient-facing-access-record-fhir)
  * [GP Connect Access Record: Structured - FHIR API](https://digital.nhs.uk/developer/api-catalogue/gp-connect-access-record-structured-fhir)
  * [Interface Mechanism 1 API standards](https://digital.nhs.uk/developer/api-catalogue/interface-mechanism-1-standards)

### Sharing Discharge Reports and Clinic Letters

Probably makes sense to include standards around sharing encounter documentation. 

We probably have a recommendation in not following the previous transfer of care send method and recommending this is **shared instead** (and used in conjunction with the event notifications).
The reason for splitting up ToC is to make it easier to solve and remove the decoupling plus the GP only focus. 
Document should be shared with ALL care providers 

Need to hint this was technically an anti-pattern? (We need to decouple tech from informatics data standards)
It is probably still viable method of sharing clinical documentation via NRL/IHE XDS

#### Process Flow

<figure>{% include document-sharing-mhd.svg %}</figure>
<br clear="all"/>

#### Data Standards

NHS England STU3 [FHIR Documents](https://hl7.org/fhir/STU3/documents.html) which are based on [PRSB Standards](https://theprsb.org/standards/) 

* [Inpatient/daycase (acute) discharge](https://developer.nhs.uk/apis/itk3tocedischarge-2-9-0/)
* [Emergency care discharge](https://developer.nhs.uk/apis/itk3emergencycareedischarge-2-9-0/)
* [Mental health discharge](https://developer.nhs.uk/apis/itk3tocmentalhealthedischarge-2-9-0/)
* [Outpatient Letter](https://developer.nhs.uk/apis/itk3tocoutpatientletter-2-9-0/)

HL7 Europe (Hospital) Discharge Report - ETA 2024/25. This is likely to be a derivative of [HL7 International Patient Summary](https://build.fhir.org/ig/HL7/fhir-ips/index.html)

#### Standards

* [IHE Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) XDS on FHIR. FHIR R4
* [IHE Cross Enterprise Document Sharing (XDS.b)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html)

#### Services

* [NHS England National Record Locator Service](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir)
