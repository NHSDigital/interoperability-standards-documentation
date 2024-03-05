
### Current Standards

The current standard for Patient Identifier Cross-referencing in England can be found in
<a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> the section 3.1.4 Patient Identity Management describes interactions used by the majority of English NHS Trusts and suppliers to implement IHE [Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html) technical framework.

<img src="ihe-pix.png" alt="Structured Data Capture" width="80%" height="80%">
<br clear="all"/>

### IHE + HL7 FHIR Versions

Candidate interoperability standards are 

- <a href="https://profiles.ihe.net/ITI/PMIR/index.html" target="_blank">Patient Master Identity Registry (PMIR)</a>
- <a href="https://profiles.ihe.net/ITI/PIXm/index.html" target="_blank">Patient Identifier Cross-referencing for mobile (PIXm)</a>

Combinations of both standards are possible.

PMIR with a single Patient feed. FHIR Cast and FHIR Subscription are included to show subsequent interactions.

<figure>{% include patient-master-identity-registry-sequence-single.svg %}</figure>
<br clear="all"/>

The patient in the first interaction would look something like this [Patient Donald with CHI Number](Patient-donald-with-chi-number.html)
The response adds in NHS Number [Patient Donald with CHI Number and NHS Number](Patient-donald-with-chi-number-and-nhs-number.html)

PMIR with a multiple Patient feed. FHIR Cast and FHIR Subscription are included to show subsequent interactions.

<figure>{% include patient-master-identity-registry-sequence-multiple.svg %}</figure>
<br clear="all"/>
