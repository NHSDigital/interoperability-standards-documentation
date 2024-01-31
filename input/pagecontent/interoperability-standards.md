
Health has a variety of standards to support technical implementations.

They can be categorised into several areas:

- **Terminology, Coding and Classifications** which provides codes for clinical terms (often called clinical coding) and medicines. Standards include: SNOMED CT, dm+d, NICIP, OPSC-4, ICD-10, ICD-11. For more details see  [NHS England Delen](https://nhsengland.kahootz.com/connect.ti/t_c_home/grouphome)
- **Data Standards** provides definitions of data items used within the health sector. This will often define what data needs to be held in a computer system and define content to be shared between providers. Standards include:
  - [NHS England Data Standards](https://data.standards.nhs.uk/)
  - Other data standards:
    - [openEHR](https://openehr.org/) Archetypes and Templates
    - [PRSB](https://theprsb.org/) Record Standards
- **Process and Activity Definitions** is not currently a technical standard but provides guidance on clinical processes and how the NHS works together. Guidance can be found in:
  - [NICE](https://nice.org.uk/)
  - [NHS England](https://www.england.nhs.uk/) (TODO this is too generic)
- **Enterprise Integration Standards** defines ways computer systems can work together to support clinical processes and activity. This will also define how Interoperability Standards are used.  Standards and patterns include:
  - [IHE Integration profiles](https://www.ihe.net/)
  - [NHS England Interoperability Pattern Book](https://www.england.nhs.uk/wp-content/uploads/2017/03/interoperabilty-handbk.pdf)

This list contains overlaps especially around Solutions, for example: openEHR can also be used as a solution for record storage (for Electronic Healthcare Records) and IHE XDS is used as an API for electronic document management solution (EDMS).

Health **Interoperability Standards** support the technical implementation of all of these standards and sits at the intersection of technical and process focused standards:

<div>
<img src="interoperability-standards.png"  alt="Interoperability Standards Process" width="60%">
<p>Figure 1 - Interoperability Standards Process</p>
<p></p>
</div>

Standards include:

- IHE Technical Frameworks which defines how to use other standards such as DICOM and HL7 to deliver an integration profile. Some IHE standards use their own propriety data model, e.g. IHE XDS (XML).
- DICOM which is the international standard to transmit, store, process, print and display medical imaging.
- HL7 which has standards for the exchange, integration, sharing and retrieval of electronic health information that supports clinical practice and the management, delivery and evaluation of health services.

### HL7

HL7 have several versions and which are based on the common technical standards and patterns when they were created.

#### HL7 v2
HL7 v2 it's data format is a variation of CSV, called [pipe and hat](https://en.wikipedia.org/wiki/Health_Level_7#Version_2_messaging), it is transmitted over TCP/IP using the MLLP protocol. It is most often used to support **Laboratory Ordering** (ORU/ORM) and **Health Administration (ADT)** processes via event messaging. This version is in high use in the NHS Acute sector with near 100% adoption, this has issues in the UK around the use of Terminology, Coding and Classifications. Although HL7 v2 can support data queries, its use in this area is limited and has technical limitations. NHS standards include:

  - [NHS England (ADT) ITK HL7 v2 (2.4) Message Specification](https://github.com/NHSDigital/IOPS-Frameworks/blob/main/documents/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf)
  - NHS Wales (ORU) HL7 v2 (2.5.1)  Message Specification

#### HL7 v3

HL7 v3 was intended to replace HL7 v2 but in the NHS adoption was low. It uses XML format and [SOAP](https://en.wikipedia.org/wiki/SOAP) for exchanging data and in the English NHS a proprietary file transfer system called [MESH](https://digital.nhs.uk/services/message-exchange-for-social-care-and-health-mesh). It is suited to both messaging and for querying (sharing) data. NHS England v3 Standards are defined in:
  - [NHS England Message Implementation Manual](https://digital.nhs.uk/developer/guides-and-documentation/message-implementation-manuals)

#### HL7 CDA

HL7 CDA (Clinical Document Architecture) is a variation of HL7 v2 which is used to convey a hybrid document containing both data and a human readable representation (html). This is particularly suited to **document based sharing** solutions (e.g. IHE XDS) and can also be used for document based exchanges, where providers have different levels of maturity. I.e. providers can chose to use the data or html representation. It is also suitable for recording point in time records.

#### HL7 FHIR

- HL7 FHIR is the latest HL7 standard. It is designed around single domain object called resources (which is related to HL7 v2 segments). 

##### Interactions

FHIR resources are particularly suited to RESTful API's and most common (popular) FHIR implementations use this interaction method.

###### RESTful API 

[RESTful API](https://hl7.org/fhir/R4/http.html) - which is particularly useful in sharing health data. 
  
- INTEROPen and HL7 UK standards include:
  - [Care Connect RESTful API (FHIR STU3)](https://nhsconnect.github.io/CareConnectAPI/index.html) which defines a minimum/base API contract for FHIR RESTful servers for sharing read only patient data and documents.
  - [UK Core FHIR Access](https://build.fhir.org/ig/HL7-UK/UK-Core-Access/) This HL7 FHIR Implementation Guide specifies the requirements for a RESTful endpoint providing read-only access for direct care and subject of care access within the UK (covering patient demographics and medications).

###### Messaging

[Messaging](https://hl7.org/fhir/R4/messaging.html) which is often used as a like for like replacement of HL7 v2 and HL7 v3 messages. NHS England is likely to discourage the use of **Messaging** with a recommendation to refactor messages into two parts: a shared part (using **RESTful API**) and a notification part focused around [FHIR Workflow](https://hl7.org/fhir/R4/workflow-module.html)/clinical workflow. 
  
- NHS England standards include:
  - [ITK3 (FHIR STU3)](https://nhsconnect.github.io/ITK3-FHIR-Messaging-Distribution/)

###### Documents

[Documents](https://hl7.org/fhir/R4/documents.html) which is a replacement for HL7 CDA. Like CDA this is suited to document sharing (e.g. IHE XDS). 

See [Document Interoperability](documents.html) for more details.
   
##### Conformance and Data Standards

- HL7 FHIR Conformance FHIR defines a core schema for each version. The current version in the UK NHS is FHIR R4, STU3 use is now depreciated. Countries (regions and suppliers) will produce additional conformance guidance on top of the core schema which describes how FHIR should be used in each country. These will be based on the countries **Terminology, Coding and Classifications** and also it's **Data Standards**, this guidance will be found in a countries Implementation Guide. In the UK the following have been developed.
  - [HL7 UK Core (FHIR R4)](https://simplifier.net/hl7fhirukcorer4) current standard. 
  - NHS England Standards (FHIR R4):
    - [Interoperable Medicines](https://simplifier.net/guide/ukcoreimplementationguideformedicines)
    - [Pathology](https://simplifier.net/guide/pathology-fhir-implementation-guide)
    - [Genomics](https://simplifier.net/guide/fhir-genomics-implementation-guide)
  - [Care Connect (FHIR STU3) Deprecated](https://fhir.hl7.org.uk/).

### IHE

IHE Technical Frameworks is generally split into several parts:

 - [Volume 1](https://profiles.ihe.net/ITI/TF/Volume1/index.html): Profile definition, use-case analysis, actor definition, and use of transactions and content
 - [Volume 2](https://profiles.ihe.net/ITI/TF/Volume2/index.html): Transaction definitions and constraints
 - [Volume 3](https://profiles.ihe.net/ITI/TF/Volume3/index.html): Document Sharing Metadata, and Content Profiles
 - [Volume 4](https://profiles.ihe.net/ITI/TF/Volume4/index.html): National Extensions
   - ***The UK does not have national extensions.*** Current recommendation is follow both IHE and UK Core Conformance Requirements for implementations, i.e. resource MUST validate against IHE and UK Core profiles.

#### IHE + HL7 v2

Volume 2 will generally use other standards primarily HL7. For example the use cases for HL7 v2 ADT can be found in [Volume 1 - Chapter 14 Patient Administration Management (PAM)](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html) and transactions in [Volume 2 3.31 Patient Encounter Management [ITI-31]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html), the NHS England (ADT) [ITK HL7 v2 (2.4) Message Specification](https://github.com/NHSDigital/IOPS-Frameworks/blob/main/documents/HSCIC%20ITK%20HL7%20V2%20Message%20Specifications.pdf) can be considered a national supplement to this IHE Technical Framework.

#### IHE + HL7 FHIR

- IHE HL7 FHIR based frameworks include:
  - [Patient Demographics Query for mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/index.html) The Patient Demographics Query for Mobile (PDQm) Profile defines a lightweight RESTful interface to a patient demographics supplier leveraging technologies readily available to mobile applications and lightweight browser based applications.
  - [Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) The Query for Existing Data for Mobile Profile (QEDm) supports dynamic queries for clinical data elements, including observations, allergy and intolerances, problems, diagnostic results, medications, immunizations, procedures, encounters and provenance by making the information widely available to other systems within and across enterprises to support provision of better clinical care. It defines a transaction used to query a list of specific data elements, persisted as FHIR resources.
  - [Mobile Health Document Sharing (MHDS)](https://profiles.ihe.net/ITI/MHDS/index.html) This Implementation Guide shows how to build a Document Sharing Exchange using IHE-profiled FHIR® standard, rather than the legacy IHE profiles that are dominated by XDS and HL7® v2. This Implementation Guide assembles other IHE Implementation guides (Profiles) and defines a Document Registry Actor.
  - [Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) Applications specific to resource-constrained and mobile devices are an emerging platform for healthcare-enhancing software. The MHD Profile is not limited to mobile devices, using the term “mobile” only as a grouping for mobile applications, mobile devices or any other systems that are resource and platform-constrained. These constraints may drive the implementer to use simpler network interface technology. There are numerous deployed implementations of [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) that need a simpler network interface technology, for example those hosted by a Health Information Exchange (HIE), large health provider electronic health record (EHR), or personal health record (PHR).
  - [Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html) The Mobile Care Services Discovery (mCSD) Profile supports RESTful queries across related care services resources. The loosely coupled design and flexible querying capability of the mCSD Profile means it can be deployed within a variety of eHealth architectures and support a wide array of care workflows.


#### IHE Cross Enterprise Document Sharing (XDS)

[Cross-Enterprise Document Sharing (XDS.b) ](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) is not based on Hl7 Standards and uses a XML+SOAP based framework. 

See [Document Interoperability](documents.html) for details on how XDS relates to other data and interoperability standards.

##### XDS + XCA Modernisation

IHE and HL7 are working on creating a better alignment with HL7 Standards, details can be found in:

- [IHE Health Information Exchange (HIE) White Paper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html)
- [IHE Helps Pave the Way for FHIR through Project Gemini](https://www.ihe.net/news/ihe-continues-to-pave-the-way-for-fhir-through-project-gemini/)
- [HL7 Project Gemini](https://blog.hl7.org/another_type_of_moonshotproject_gemini)

### openEHR

Is a data standard and a system for implementing health care records, interoperability standards are focused on interactions between these systems.

openEHR (archetypes and templates) may provide definitions for interoperability standards, these would likely use **FHIR Questionnaire** as the definition resource in interoperability standards.

openEHR implementations will utilise interoperability standards listed on this page.

### Statutory Requirements

The current requirements from NHS England are to use HL7 FHIR for Health Interoperability.

- NHS Standard Contract requirements: [Care Connect API](https://nhsconnect.github.io/CareConnectAPI/) a UK FHIR (STU3) RESTful interaction standard from [NHS England Interoperability](https://www.england.nhs.uk/digitaltechnology/connecteddigitalsystems/interoperability/)
  - This is FHIR STU3, a R4 version is currently being elaborated. It is expected the R4 version will be a union of Care Connect API and US Core (the mandatory search parameters are similar)
- [DAPB4020: UK Core Fast Healthcare Interoperability Resources (FHIR) Release 4 (R4) Governance](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/dapb4020-uk-core-fhir-r4-governance)
