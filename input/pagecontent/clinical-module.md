### Overview

The three main interoperability concepts around clinical are:

- [Sharing Patient Record (Core)](#sharing-patient-record-core)
- [Assessments and Care Planning](#assessments-and-care-planning)
- [Care Coordination](#care-coordination)

Each concept is divided into `interoperability standards` which contains options for implementing `data standards`. The theory behind these categorisations can be found on [Confluence - Care Coordination](https://nhsd-confluence.digital.nhs.uk/display/IOPS/Care+Coordination) and is based around clinical process.

> **Mission**
> 
> The aim is to improve record sharing and care coordination via `interoperability standards` in order to support the delivery of patient care more effectively.

It does not aim to define: 

- Enterprise Architecture
- Services e.g. [National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer)
- Data standards

However, it does link to all three but is essentially de-coupled. This is change to how `interoperability standards` were previously delivered. For example [Transfer of Care](https://digital.nhs.uk/services/transfer-of-care-initiative) was previously delivered as a combined standard and service which increased delivery complexity. With this new approach, `Transfer of Care` has several options:
- The records can be located using [National Record Locator](https://digital.nhs.uk/developer/api-catalogue/national-record-locator-fhir/v3/producer)
- They can be defined via `Data Standards`
- There are several ways of implementing the `Data Standard` via `Interoperablity Standards`, which one is used depends on which `Enterprise Architecture` is in use and the interoperability standards are supportive of several architectures. 

This flexibility increases the size of `Interoperablity Standards` as the diagrams below show but the anticipated reuse is expected to be high.  

### Execution General Outline

The delivery of [Sharing Patient Record (Core)](#sharing-patient-record-core) is required in order to simplify the delivery of [Assessments and Care Planning](#assessments-and-care-planning) and [Care Coordination](#care-coordination), both of these require records to be shared. In particular if don't shared patient summary records, options such as `messaging` or `email/fax` will have to be selected and/or the solution becomes complex which will block adoption. 

The chart below shows this relationship (durations of phases are not correct (by a long shot))

<figure>{% include clinical-delivery-gantt.svg %}</figure>
<br clear="all"/>

The mind maps below have two main sections:

- interoperability standards
- data standards

Generally the `data standard` should be completed before the interoperability standard. Interoperability standards have several paths, which one is taken will normally be defined by combinations of 

- use case 
- enterprise architecture
- solution architecture

Several options may be needed for single use cases. E.g. at present Shared Care Records (core) probably needs to be supportive of most of the options but based on feedback we can probably focus on key areas. 

#### Assumptions

##### Sharing Patient Record (Core) 

It is expected feedback will say `data - RESTful API` with extending UK Core FHIR Access to cover the data types currently listed under Data Standards.

##### Assessments and Care Planning

It is assumed the initial use case will be around ReSPECT or End of Life Care planning. It is recommended we initially focus `interoperability standards` around FHIR Structured Data Capture as this has several concepts that are supportive of `Data Standards` future focus in this area.

Both `Sharing Patient Record (Core)` and `Assessments and Care Planning` are supportive of implementing PRSB standards. 
 - `Sharing Patient Record (Core)` has content which is common to many PRSB standards.
 - `Assessments and Care Planning` is a method for additional content to be added to this core record. This could initially include
   - About me
   - Personal Care and Support Plans
   - Other care setting specific content such as wound care, children cancer, diabetes, etc

##### Care Coordination

The working assumption is this would be around wound care.

### Sharing Patient Record (Core)

<figure>{% include clinical-patient-summary-mindmap.svg %}</figure>
<br clear="all"/>
 

#### Use Cases

> Tom Simpson, from Mansfield (Nottinghamshire), is a male who formerly worked as a coal miner and has now retired. He has Type 2 diabetes with kidney disease and high blood pressure. He is currently being care for by 
>  - Primary care - GP
>  - Community care - Nottinghamshire Healthcare NHS Foundation Trust
>  - Social care - Nottinghamshire County Council
>  - Outpatient care - Nottingham University Hospitals NHS Trust

To provide records to all practitioners involved in Tom's care, all the providers have decided to share records. How they share these records is variable due to capabilities of the Electronic Patient Records (EPR) and Electronic Document Management Systems (EDMS) each provider uses. The providers collectively decide to aim for a `data` based approach but where this is not possible, they will share what they can as `data` with the remainder being shared as `documents`.


### Assessments and Care Planning

<figure>{% include clinical-assessments-and-care-planning-mindmap.svg %}</figure>
<br clear="all"/>

### Care Coordination

<figure>{% include clinical-care-coordination-mindmap.svg %}</figure>
<br clear="all"/>
