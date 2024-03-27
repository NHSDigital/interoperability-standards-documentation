
The scope of this document and proposals is national, regional, NHS Trust and supplier.

### References

- [IHE Patient Demographics Query (PDQ)](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html)
- [IHE Patient Demographics Query for Mobile (PDQm)](https://profiles.ihe.net/ITI/PDQm/index.html)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>


### HL7 v2 and IHE PDQ

<figure>{% include pdq-sequence-current.svg %}</figure>
<br clear="all"/>

#### QBP_Q21

The example below finds a patient with a MRN identifier of 112234 

```
MSH|^~\&|CarefxITK|ORG1|PAS|ORG1|20100511125610+0100||QBP^Q21^QBP_Q21|04857982024975328990|P|2.4|||||GBR||EN||ITKv1.0
QPD|Q22^Get Person Demographics|QRY123|112234^^^METRO HOSPITAL|
RCP|I|20^RD
```

#### RSP_K21

The response to this query contains a single patient in the PID and PD1 segments.

```
MSH|^~\&|PAS|ORG1|CarefxITK|ORG1|20100511125611||RSP^K21^RSP_K21|306944|P|2.4|||||GBR||EN||ITKv1.0
MSA|AA|04857982024975328990
QAK|QRY123|OK|Q21^Get Person Demographics||1
QPD|Q21^Get Person Demographics|QRY123|112234^^^METRO HOSPITAL|
PID|1||112234^^^METRO HOSPITAL||Esther^Priya^^^MS^^L||19861129000000|2|||1 Birley Close^Appley Bridge^Wigan^^WN6 9JL^GBR^H^Q31^Lancashire||||EN|M|C22|||||A|Berlin|N||GBR||DEU||||ED|
PD1|||ST JOHN'S WOOD MED PRACT^^E87609|G9312382^Abadi^DI^^^Dr
```

### HL7 FHIR RESTful and IHE PDQm

The HL7 v2/IHE PDQ is probably not going to be favoured by third party application vendors. They are more likely to favour the IHE PDQm/HL7 FHIR RESTful approach.

<figure>{% include pdq-sequence-future.svg %}</figure>
<br clear="all"/>

Although PDS is not IHE PDQm compliant it has followed this pattern. Please see [NHS England Personal Demographics Service - FHIR API: Search for a patient](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir#get-/Patient)

### NHS Acute Trust Examples

#### Patient Registration

`Donald has moved from Edinburgh (Scotland) to Leeds (England) for work reasons. Donald has a series condition and was recieving treatment from NHS Lothian, NHS Lothian has liased with Leeds Foundation NHS Trust to continue his care. As Donald is a UK citizen he is eligible for care from NHS England and so Leeds Foundation NHS Trust apply for an English NHS Number`

<img src="PAS-BPMN.png" alt="Patient Demographic Query" width="80%" height="80%">
<br clear="all"/>

1. The first step Leeds Teaching would do would be to find Donald on the local Patient Administration System (PAS).
2. Depending on whether Donald is found or not.

   a. If Donald is found on the PAS, Donalds demographics record would be updated.
   
   b. If Donalds is not found, Donald is registered Donald as a Patient on the PAS. They would have allocated a Medical Record Number (MRN) to identify Donald across the trusts computer systems and possibly record his (NHS Scotland) CHI Number. In addition, a Task would be created to obtain a NHS Number for Donald. 

As HL7 FHIR Donalds record would look like [Patient Donald with CHI Number and MRN](Patient-Patient-donald-with-chi-number-and-mrn.html). The updating/creating of this record will generate event notifications to inform other systems of this change, (Leeds Teaching Trust follows <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>).

Leeds Teaching NHS Trust registering Donald with NHS England looks like this: 

<img src="PDS-BPMN.png" alt="Patient Demographic Query" width="80%" height="80%">
<br clear="all"/>

1. An administrator in Leeds Teaching Trust searches PDS to check Donald does not have a NHS Number
2. Depending on the results:

   a. If Donald is found on PDS, the Leeds Teaching Trust PAS is updated with the NHS Number. Leeds Teaching Trust will likely update the record on PDS with Donalds new address.
   
   b. If Donald is not found on PDS, a NHS Number allocation request (register Donald for care in NHS England) is sent and the returned NHS Number is used to update Leeds Teaching Trusts PAS. The FHIR Patient record returned from PDS looks something like this  [Patient Donald with NHS Number](Patient-Patient-donald-with-nhs-number.html)

3. In either case Leeds Teaching Trust need to inform all systems within the trust of the NHS Number. For this they will use the Trust Integration Engine (TIE) which will distribute both HL7 v2 ADT_A31 and/or FHIR Patient updates to the trusts systems. The FHIR Patient could look like this  [Patient Donald with NHS Number, CHI and MRN](Patient-Patient-donald-with-chi-number-mrn-and-nhs-number.html). For more details on this see [Patient Identity Management (PIX)](patient-identity-management.html)

Notes:

1. Leeds Teaching NHS Trust is following NHS England HL7 v2 standards, these standards also follow [Patient Identifier Cross-referencing (PIX)](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html)
2. Leeds Teaching NHS Trust PAS is the main source for patient demographics, it also contains identifiers from both NHS England and Scotland.
3. Leeds Teaching NHS Trust systems are using MRN to identify the Donald, not CHI or NHS Number. After the NHS Number allocation request, most systems will also know Donalds NHS Number.

#### NHS Number Verification and Finding Patient's NHS Number (using PDS)

To improve the use of the NHS Number and automate NHS Number verification processes, Calderdale and Huddersfield NHS Foundation Trust connected their Trust Integration Engine to NHS England's Personnel Demographics Service.

The existing HL7 v2 ADT feeds included a `wire tap` which would call ODS if:
- The patient didn't have a verified NHS Number
- The patient didn't have a NHS Number

If results were found the Patient Administration System (PAS) was updated with verification status or a found NHS Number.

<figure>{% include pds-online-consultation-register-patient.svg %}</figure>
<br clear="all"/>

### Online Consultation Provider

This use case is from an Online Consultation providers use case supplied to PDS.

#### Patient Registration 

<figure>{% include pds-chft-tie.svg %}</figure>
<br clear="all"/>

1. The patient would have completed a registration details in the providers application, these details are used to obtain the demographics record from the local GP system
2. If a patient record is found then the local providers systems is updated with returned demographic details and the GP System `id` of the patient. Demographic records on the GP system may be updated.
3. If the patient is not found, then NHS England's Personnel Demographics Service is searched.
4. If a record is found then the patient's NHS Number is recorded on the local system
5. If the record is found or not found, a Task is created to register the patient (this is administration task)
6. If the local record and PDS record do not match, then the PDS record is updated (currently this is an administration task)

#### Record Locator Service (PDS)

<figure>{% include pds-online-consultation-record-locator.svg %}</figure>
<br clear="all"/>

1. NHS England's Personnel Demographics Service is searched (probably by NHS Number) to obtain the national demographics record.
2. From the registered GP Practice which is located in the returned FHIR Patient resource, a care directory service is called to return the FHIR API for this organisation.
3. The Patient API on this Endpoint is called to retrieve the `patientId` of the patient with this NHS Number returned in the first call.
4. The API for the GP system is then accessed as required using the `patientId` from the previous step as a query parameter.
