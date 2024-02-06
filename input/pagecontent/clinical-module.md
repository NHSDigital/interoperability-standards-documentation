### Overview

The three main interoperability concepts around clinical are:

- [Patient Summary](#patient-summary)
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

The delivery of [Patient Summary](#patient-summary) is required in order to simplify the delivery of [Assessments and Care Planning](#assessments-and-care-planning) and [Care Coordination](#care-coordination), both of these require records to be shared. In particular if don't shared patient summary records, options such as `messaging` or `email/fax` will have to be selected and/or the solution becomes complex which will block adoption. 

The chart below shows this relationship (durations of phases are not correct (by a long shot))

<figure>{% include clinical-delivery-gantt.svg %}</figure>
<br clear="all"/>


### Patient Summary

<figure>{% include clinical-patient-summary-mindmap.svg %}</figure>
<br clear="all"/>

#### Assumptions

It is expected feedback will say `data - RESTful API`.  

#### Use Cases

> Tom Simpson, from Mansfield (Nottinghamshire), is a male who formerly worked as a coal miner and has now retired. He has Type 2 diabetes with kidney disease and high blood pressure. He is currently being care for by 
>  - Primary care - GP
>  - Community care - Nottinghamshire Healthcare NHS Foundation Trust
>  - Social care - Nottinghamshire County Council
>  - Outpatient care - Nottingham University Hospitals NHS Trust

To provide records to all practitioners involved in Tom's care, all the providers have decided to share records. How they share these records is variable due to capabilities of the Electronic Patient Records (EPR) and Electronic Document Management Systems (EDMS) each provider uses. The providers collectively decide to aim for a `data` based approach but where this is not possible, they will share what they can as `data` with the remainder being shared as `documents`.

> Beryl Burton, from Leeds (West Yorkshire/Riding), is a keen cyclist who is being treated for Relative energy deficiency in sport (RED-S). She is well on the road to recovery and is participating in the Marmotte cycle event in the French Alps. Unfortunatley took a tubble while descending the Col du Galibier and has been taken to a French emergency care department 

The French practitioners and Beryl want to view her patient record to give the best care, in particular view her medication records. The following options could be provided: 
- Beryl can choose to share her record using `International Patient Access (data)`, this is compatible with `UK Core FHIR Access (data)` for medications.
- The French practitioners could use `International Patient Summary`, this could be implemented on top of `UK Core FHIR Access (data)`. The use of the `hybrid (FHIR Document)` due to the variable capabilities of the international systems, this hybrid allows practitioner to either view the record in html format and/or use the data.
 
### Assessments and Care Planning

<figure>{% include clinical-assessments-and-care-planning-mindmap.svg %}</figure>
<br clear="all"/>

### Care Coordination

<figure>{% include clinical-care-coordination-mindmap.svg %}</figure>
<br clear="all"/>
