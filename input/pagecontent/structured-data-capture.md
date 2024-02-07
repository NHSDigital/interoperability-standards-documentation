[NHS England One Digital Blueprint](https://nhs.sharepoint.com/:w:/r/sites/msteams_a64122/Shared%20Documents/General/Publications/2024-01%20NHS%20England%20One%20Digital%20Blueprint.docx?d=w9b978d383a5b40d68c17c4f9af71c657&csf=1&web=1&e=e9oVwY) states:

### IHE Profiles


#### IHE Retrieve Form for Data Capture (RFD)

Ref: OneDigital - page 15
 
> •	NHS England will join and become part of the Integrating the Health Enterprise (IHE) community.  Our teams will actively participate and support the development of IHE profiles.  Our interop methodology will incorporate IHE profiles, and we will ensure all future services are compliant with this framework.

and also defines a new service:

Ref: OneDigital - page 11

> •	Structured Data Capture Platform (CDR) – a platform that leverages clinical archetypes to capture clinical data, surfaced into national and point of care applications.  Leverages OpenEHR information models to support structured clinical data capture at the point of care or directly from a citizen. Also referred to as a Clinical Data Repository.

The corresponding IHE profile is

[Retrieve Form for Data Capture (RFD)](https://profiles.ihe.net/ITI/TF/Volume1/ch-17.html)

Note: The use cases also work for both the new service and an FHIR SDC. 

#### HL7 FHIR Structured Data Capture (SDC)

Note: the IHE use cases in the link above are still applicable to SDC

This has not been modernised. The most likely candidate is [HL7 FHIR Structured Data Capture (SDC)](https://build.fhir.org/ig/HL7/sdc/)

This also:

- hides the complexity of openEHR API which, like HL7 v3, are XML+SOAP based using a complex models. 
  - openEHR can already convert Archetypes and Teamplates to FHIR Questionnaire which is part of HL7 FHIR SDC
  - openEHR COMPOSITION will be more complex but FHIR QuestionnaireResponse is likely to be a candidate for its modernisation.

### Data and Interoperability Issues 

- openEHR does support interoperability with other systems but these tend to be legacy interfaces
  - IHE XDS is used to share COMPOSITION, this is a simple mapping to FHIR DocumentReference
  - IHE PDQ (HL7 v2 ADT) is used to provide patient demogaphics, this probably needs updating to IHE PDQm (and so PDS)
  - IHE PEM (HL7 v2 ADT) is used to link openEHR to patient administration systems (PAS), this probably needs updating (no IHE profile)
- openEHR tends to have a system `Solution Architecture` rather interoperability or `Enterprise Architecture` perspective which means that although it does support several IHE/HL7 standards it tends to hardwire them as systems.
  - Recommendation is to speak to openEHR and suggest a more general approach to fit the wider enterprise rather than solutions.
- openEHR views FHIR as a competitor, often agressively. Both standards have clearly defined aims, the former data standards and the later interoperability standards. This viewpoint is not constructive, will lead to considerable confusion within the NHS and probably result in slower delivery velocity.
  - Recommendation is to speak to openEHR and ask them to stop portraying FHIR as a EHR or data standard.
  - Recommendation is to speak to openEHR and ask them to stop portraying openEHR as an interoperability standard due to the issues it has around interoperability.
- openEHR does not support concepts of CodeSystems and ValueSets (or SNOMED CT reference sets)
  - UK generated archetypes/templates also tend to have low use of clinical coding
  - we may need to investigate ways of preventing openEHR local codes from entering the ecosystem.

Further investigation is needed in this area. 

Ref: OneDigital - page 13

> •	Integration Services – enable systems within a geography to communicate with each other, including traditional health care systems leveraging HL7 v2 and 3 and more modern standards such as OpenEHR and FHIR.  Should reduce the need for local integration platforms through local partnership arrangements.

It is high unlikely `Interoperability Standards` would regard openEHR as a modern Integration Service. This feedback should be **anticipated from suppliers** when they view openEHR XSD Schemas (this is very likely to **cause resistance to openEHR** and so the recommendation would be to facade openEHR complexity with HL7 FHIR Structured Data Capture resources).

### Relationship Diagram

On `overview` of how the new service could fit into NHS England and the NHS.

This needs explaining but the high level descriptions should be sufficient to describe the linked services.

<figure>{% include structured-data-capture-nhs-england-one-digital.svg %}</figure>
<br clear="all"/>
