
This proposal originates from CPIS and is presented here as modern solution for **Patient Encounter Management** and should be used to depreciate:

- NHS England HL7 v2 ADT Message Specification
- NHS England HL7 v3 and FHIR Patient Encounter Messaging 

The scope of this proposal is national, regional, NHS Trust and supplier.

### References

- [IHE Patient Encounter Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>


### Interactions

This proposal is based on a requirement to notify Social Care Safeguarding Services of Encounters with looked after children. It is proposed that this is implemented based on existing interactions used within acute care which are generally based on **HL7 v2 Admissions, Discharges and Transfers (ADT)** and **IHE Patient Encounter Management (PEM)**. 

A typical NHS Acute will use Trust Integration Engine (TIE) to route these existing messages as follows:

<figure>{% include patient-encounter-management-sequence-notifications-current.svg %}</figure>
<br clear="all"/>

- The PAS system emits event notifications to the TIE based on a series of triggers, these are typically:
   - Patient admissions
   - Outpatient/Emergency attendance 
   - Ward Transfers (inpatient)
   - Discharges (inpatient, outpatient and emergency)
- The TIE then distributes these events to other systems in the NHS Trusts. This can include external providers such as GP systems.

The amended version of this flow will look like: 

<figure>{% include patient-encounter-management-sequence-notifications-future.svg %}</figure>
<br clear="all"/>

- In this amended version, the HL7 ADT messages are converted HL7 FHIR Encounter via a transform. These are aimed at external providers but may also be used internally.

It is recommended that the data model in HL7 v2 is retained in HL7 FHIR to simplify the transform and so keep the solution simple.

### HL7 v2 ADT_A04 Example converted to HL7 FHIR

#### Use Case

`Mrs Smith is being admitted to hospital following a referral by her GP Dr Townley of the Malton GP Practice. She arrives at York hospital by car, and is put under the care of Dr. Darwin, who also attends to Mrs Smith. Mrs Smith is admitted for an inpatient spell under the speciality General Medicine. She has a recorded allergy to an anaesthetic agent and has been diagnosed with stress incontinence. A colonic examination procedure is then performed.`

An example HL7 v2 ADT_A04 is shown below, this is from <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> 

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201011011512||ADT^A04^ADT_A01|14038913245354|P|2.4||201011011512|||GBR|UNICODE|EN||iTKv1.0
EVN||201011011512|||111111111^Cortana^Emily^^Miss^^RCB55|201001111512
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196512131515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||EN|M|C22|||||A|Berlin|||GBR||DEU
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
NK1|2|SMITH^FRANCESCA^^^MRS^^L|16|29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H|+441234567890||||||||||1|196311111513||||EN
PV1|57|O|West Wing^RCB-AWRD^BED2^RCB55|13|||C3456789^Darwin^Samuel^^^Dr^^^GMC|G5612908^Townley^Gregory^^^Dr^^^GMC|C3456789^Darwin^Samuel^^^Dr^^^GMC|300||||19|||C3456789^Darwin^Samuel^^^Dr^^^GMC|OUTPATIENT|2141^^^VISITID|||||||||||||||||||||||||201011011600
AL1|1|DA|Z88.5|5||199807011755
PR1|56||U19.2^24 hour ambulatory electrocardiography^OPCS4||201011011512|D|1440|||||C3456789^Darwin^Samuel^^^Dr^^^GMC|C3
ZU1||2|C|201011011530||300||||1|||GP|2|201011011624|201011011620|02|Y|0
```

HL7 FHIR Encounter conversion [Encounter Outpatient Fredrica Smith](Encounter-outpatient-fredrica-smith.html)

### Other Programme Considerations

These events will often be produced before encounter documentation is produced, therefore it will not be practical to include any NRL or IHE XDS pointers in these event.

This event represents U-turn from HL7 v3 and FHIR Messaging approaches in this area such as:

- Transfer of Care
- Digital Medicines
- Assesment Discharge and Withdrawal

back to same event notification pattern in HL7 v2 and IHE PEM. These messages were primarily transfers of clinical data/documents are to be solved by Sharing Clinical Data/Documents by the Connecting Care programme. 

### Example Use Case - CPIS Implementation at Calderdale and Huddersfield NHS Foundation Trust 

CHFT were the first NHS Trust to implement the HL7 v3 CPIS version of CPIS. They created a [wire tap](https://www.enterpriseintegrationpatterns.com/patterns/messaging/WireTap.html) in the TIE which call CPIS based on certain conditions (e.g. emergency encounter and female patient).

CHFT decided not to use CPIS interactively, i.e. a practitioner would choose to call CPIS in an application. This meant that the practitioners work was uninterupted as the check was automated and at busy times especially in emergency settings, these checks may cause delays in care.
This also ensured that every patient would be checked.

<figure>{% include patient-encounter-management-sequence-notifications-chft-cpis.svg %}</figure>
<br clear="all"/>

With this proposal this interaction would change to the following:

<figure>{% include patient-encounter-management-sequence-notifications-chft-cpis-new.svg %}</figure>
<br clear="all"/>

The previous implementation is mostly unchanged but it is joined by the **Patient Encounter Management** notification which goes to Social Services Safeguarding. This includes more encounter metadata:

- type of encounter
- encounter service code
- encounter reason (optional)
- encounter identifier which can be used to query encounter documents via Connection Care Records
- encounter participants

### Scalability

At present this proposal is based on requirement from CPIS, the number of providers interested is probably more than just Social Services Safeguarding. As mentioned GP, Community, Mental Health teams may be also interested in these events. It is not a fixed list of interested parties and so is would likely use [Publish-Subscribe Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html) patterns. 

This is the approach taken in 

- [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/) which could potentially be used with PDS for Patient Demographics notifications
- [IHE Document Subscription for Mobile (DSUBm)](https://build.fhir.org/ig/IHE/ITI.DSUBm/branches/master/index.html) which could potentially be used NRL for pointer notifications and IHE XDS/MHD for document notifications.

E.g.

<figure>{% include patient-encounter-management-sequence-notifications-subscriptions.svg %}</figure>
<br clear="all"/>

