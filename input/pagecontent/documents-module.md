

<figure>{% include documents-module.svg %}</figure>
<br clear="all"/>

### Document Metadata

> NHS England does not currently have a **data standard** for `Document Metadata`
> 
> It is suggested until this is produced, the model in [UK Core DocumentReference](https://simplifier.net/resolve?fhirVersion=R4&scope=fhir.r4.ukcore.stu3.currentbuild&canonical=https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference) should be followed for all standards (IHE XDS, openEHR and HL7)

[Document Metadata](https://profiles.ihe.net/ITI/papers/metadata/index.html) is present in other **data standards**. The table below shows `Document Metadata` relationships between interoperability standards.

| Data Standard                 | Notes                                                                                                                                                                                            |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| HL7 FHIR DocumentReference    | [XDS metadata equivalent](https://hl7.org/fhir/R4/documentreference-mappings.html#xds)                                                                                                           |
| HL7 UK Core DocumentReference | [UK Core DocumentReference](https://simplifier.net/resolve?fhirVersion=R4&scope=fhir.r4.ukcore.stu3.currentbuild&canonical=https://fhir.hl7.org.uk/StructureDefinition/UKCore-DocumentReference) |                                                                                  |
| HL7 v2 MDM Message            | [FHIR DocumentReference and HL7 v2 mapping](https://hl7.org/fhir/R4/documentreference-mappings.html#v2)                                                                                      |                                                                                   |

### Clinical Documents (Compositions)

Clinical Documents is a concept found in clinical informatics and is used as a type of document in XDS systems in the same manner as other document formats (e.g. PDF, DICOM, etc). The table below shows where documentation on compositions can be found.

| Standards | References                                                                                                                                             |
|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| HL7 FHIR | [FHIR Documents](https://hl7.org/fhir/R4/documents.html)                                                                                               |
| HL7 CDA | [A basic view of Clinical Document Architecture](https://www.hl7.org.uk/wp-content/uploads/HL7UK_Media/Documents/Technical/A-basic-view-of-CDA-v3.doc) | 
| openEHR | [Compositions](https://specifications.openehr.org/releases/RM/latest/ehr.html#_compositions)                                                           |

Composition are related to [Document Metadata](documents.html#document-metadata), the table below shows the relationships between data (and interoperability) standards.

| Data Standard           | Notes                                                                                                                                                                              |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| HL7 FHIR Composition    | [FHIR Composition and DocumentReference mapping](https://hl7.org/fhir/R4/composition-mappings.html#fhirdocumentreference)                                                          |
| HL7 CDA                 | [FHIR Composition and CDA mapping](https://hl7.org/fhir/R4/composition-mappings.html#cda)                                                                                          |
| HL7 UK Core Composition | [UK Core Composition](https://simplifier.net/resolve?fhirVersion=R4&scope=fhir.r4.ukcore.stu3.currentbuild&canonical=https://fhir.hl7.org.uk/StructureDefinition/UKCore-Composition) |
| PRSB                    | [Document Naming](https://theprsb.org/standards/documentnaming/)                                                                                                                   |
| openEHR / Apperta       | [XDS metadata](https://ckm.apperta.org/ckm/archetypes/1051.32.672)                                                                                                                 |    

### Data Standards

Most Clinical Document standards used by NHS England can be found on [PRSB Standards](https://theprsb.org/standards/)

Key standards include: 

- [Outpatient Letters](https://theprsb.org/standards/outpatientletterstandard/)
- Discharge Report
  - [eDischarge Summary Standard](https://theprsb.org/standards/edischargesummary/])
  - [Emergency Care Discharge Standard](https://theprsb.org/standards/emergencycaredischarge/)
  - [Mental health inpatient discharge](https://theprsb.org/standards/mentalhealth/)
- Referral Letters
  - [Clinical referral information](https://theprsb.org/standards/clinicalreferralinformation-2/)
- Pharmacy 
  - [Community Pharmacy Standard](https://theprsb.org/standards/communitypharmacy/)

### Clinical Document Standards

#### NHS England

Are mostly based on Data Standards in the previous section. They do combine FHIR concpets of [Messaging](https://hl7.org/fhir/STU3/messaging.html) and [Documents](https://hl7.org/fhir/STU3/documents.html), in the context of this guide we are only referring to the [Documents](https://hl7.org/fhir/STU3/documents.html) aspect and not ITK3.

- Transfer of Care (based on Care Connect/FHIR STU3 which is `deprecated`)
  - Outpatient Letters
    - [Outpatient Clinic Letter](https://developer.nhs.uk/apis/itk3tocoutpatientletter-2-9-0/)
  - Discharge Report
    - [Acute Inpatient Discharge](https://developer.nhs.uk/apis/itk3tocedischarge-2-9-0/)
    - [Emergency Care Discharge](https://developer.nhs.uk/apis/itk3emergencycareedischarge-2-9-0/)
    - [Mental Health Discharge](https://developer.nhs.uk/apis/itk3tocmentalhealthedischarge-2-9-0/)
- Pharmacy (based on Care Connect/FHIR STU3 which is `deprecated`)
  - [Digital Medicine - FHIR](https://digital.nhs.uk/developer/api-catalogue/digital-medicine-fhir)

#### International

The following standards are all based on FHIR R4

- Patient Summary
  - [Internation Patient Summary](https://build.fhir.org/ig/HL7/fhir-ips/index.html) An International Patient Summary (IPS) document is an electronic health record extract containing essential healthcare information about a subject of care. As specified in EN 17269 and ISO 27269, it is designed for supporting the use case scenario for ‘unplanned, cross border care’, but it is not limited to it. It is intended to be international, i.e., to provide generic solutions for global application beyond a particular region or country.
- Laboratory Report
  - [HL7 Europe Laboratory Report](https://build.fhir.org/ig/hl7-eu/laboratory/) Clinical laboratory results play an important role in diagnosis, treatment, and follow-up of patients. The availability of high quality test results, and the capacity of sharing them, is therefore essential being often the basis for clinical decision making. For this reason the Laboratory has been selected as one of the priority domains for the European EHR eXchange Format (E-EHRxF).
- Pharmacy
  - Europe [Gravitate Health FHIR Implementation Guide (FHIR R4)](https://build.fhir.org/ig/hl7-eu/gravitate-health-ips/) How to integrate patient health information from the International Patient Summary (IPS) with medicinal product information from regulatory approved electronic Product Information (ePI) documents. Together, the IPS and ePI will facilitate the creation of new digital platforms that give patients a more accessible way of acquiring trusted health and medicinal product Information.

### Interoperability Standards

- [Mobile Health Document Sharing (MHDS)](https://profiles.ihe.net/ITI/MHDS/index.html) This Implementation Guide shows how to build a Document Sharing Exchange using IHE-profiled FHIR® standard, rather than the legacy IHE profiles that are dominated by XDS and HL7® v2. This Implementation Guide assembles other IHE Implementation guides (Profiles) and defines a Document Registry Actor.
- [Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) Applications specific to resource-constrained and mobile devices are an emerging platform for healthcare-enhancing software. The MHD Profile is not limited to mobile devices, using the term “mobile” only as a grouping for mobile applications, mobile devices or any other systems that are resource and platform-constrained. These constraints may drive the implementer to use simpler network interface technology. There are numerous deployed implementations of [Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) that need a simpler network interface technology, for example those hosted by a Health Information Exchange (HIE), large health provider electronic health record (EHR), or personal health record (PHR).

