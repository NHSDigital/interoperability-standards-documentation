
<figure>{% include diagnostics-module.svg %}</figure>
<br clear="all"/>

For an example of what we would see here see [FHIR Genomics Implementation Guide](https://simplifier.net/guide/FHIR-Genomics-Implementation-Guide/Home)

<figure>{% include diagnostics-module-activity-state-example.svg %}</figure>
<br clear="all"/>

### Data Standards

#### NHS England 

- [Clinical Observations](https://simplifier.net/guide/ClinicalObservations/Home) Data standards only. no interactions
- [Pathology FHIR Implementation Guide](https://simplifier.net/guide/pathology-fhir-implementation-guide/Home) 
  - See `cautionary` note on the use of [FHIR Messaging](interoperability-standards.html#messaging) which this guide contains

### Interoperability Standards

- INTEROPen and HL7 UK standards include:
   - `deprecated` [Care Connect RESTful API (FHIR STU3)](https://nhsconnect.github.io/CareConnectAPI/index.html) which defines a minimum/base API contract for FHIR RESTful servers for sharing read only patient data and documents.
- International standards include:
    - [International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html) This specification describes how an application acting on behalf of a patient can access information about the patient from a clinical records system using a FHIR R4 based API. The clinical records system may be supporting a clinical care provider (e.g., a hospital or a general practitioner), a health data exchange, or other system managing patient records, including a national health record system.
    - [Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) The Query for Existing Data for Mobile Profile (QEDm) supports dynamic queries for clinical data elements, including observations, allergy and intolerances, problems, diagnostic results, medications, immunizations, procedures, encounters and provenance by making the information widely available to other systems within and across enterprises to support provision of better clinical care. It defines a transaction used to query a list of specific data elements, persisted as FHIR resources.


### NHS England Services

TODO only a 'fag packet' 


- [FHIR Genomics Implementation Guide](https://simplifier.net/guide/FHIR-Genomics-Implementation-Guide/Home) 



