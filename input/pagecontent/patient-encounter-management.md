
This proposal originates from CPIS and is presented here as modern solution for **Patient Encounter Management** and should be used to depreciate:

- NHS England HL7 v2 ADT Message Specification
- NHS England HL7 v3 and FHIR Patient Encounter Messaging 

The scope of this proposal is national, regional, NHS Trust and supplier.

### References

- [IHE Patient Encounter Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>


### Introduction - HL7 v2 and IHE Event Notifications

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

### IHE PIX/PIXm or HL7 v2/FHIR Example 1 - Outpatient Clinic

#### Use Case

`Mrs Smith is being admitted to hospital following a referral by her GP Dr Townley of the Malton GP Practice. She arrives at York hospital by car, and is put under the care of Dr. Darwin, who also attends to Mrs Smith. Mrs Smith is admitted for an inpatient spell under the speciality General Medicine. She has a recorded allergy to an anaesthetic agent and has been diagnosed with stress incontinence. A colonic examination procedure is then performed.`

```
Given
Mrs Smith is admitted to hospital
And
a referral has been made by GP Dr Townley of the Malton GP Practice
When
she arrives at York hospital by car
And
is put under the care of Dr. Darwin, who also attends to Mrs Smith
And
has a recorded allergy to an anaesthetic agent and has been diagnosed with stress incontinence.
Then
Mrs Smith is admitted for an inpatient spell under the speciality General Medicine
And
a colonic examination procedure is then performed.
```

##### HL7 v2 ADT_A04 Example

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

##### HL7 FHIR Example

HL7 FHIR Encounter conversion [Example FHIR Encounter - Outpatient Fredrica Smith](Encounter-Encounter-outpatient-fredrica-smith.html). This example conforms to constraints and rules in [UKCore-Encounter](https://simplifier.net/hl7fhirukcorer4/ukcore-encounter)

IHE does not have a HL7 FHIR version IHE PEM but FHIR RESTful interactions can still be used. E.g. 

```
PUT /Encounter?identifier=https://fhir.leedsth.nhs.uk/VisitId|2141
```

This is influenced by the interaction used in IHE PIXm and is similarly an 'upsert' which means amend (PUT) the existing resource if it doesn't exist else create (POST) it, note this is reliant on the visit identifier being present. 

### IHE PIX/PIXm or HL7 v2/FHIR Example 2 - Discharge (Inpatient) Notification

#### Use Case

`Mrs Smith is discharged from her hospital provider spell. The discharge reports 2 observations from the hospital provider spell. The first is a weight measurement and the second a blood pressure. She is discharged with no follow up required, and returns home.`

##### HL7 v2 ADT_A03 Example

An example HL7 v2 ADT_A03 is shown below, this is from <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201010211706||ADT^A03^ADT_A03|13403893338056|P|2.4|1|20101021185800|||GBR|UNICODE|EN||iTKv1.0
EVN||201010211735|||111111111^Cortana^Emily^^^Miss^^RCB55|201010211706
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196512131515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||en|M|C22|||||A|Berlin|||GBR||DEU
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
PV1|1|I|RCB^OBS1^BAY2-6^RCB55|13|||C3456789^Darwin^Samuel^^^Dr^^^GMC|G5612908^Townley^Gregory^^^Dr^^^GMC|C3456789^Darwin^Samuel^^^Dr^^^GMC|300||||||||12|YOR123456^^^YR_VISIT|||||||||||||||||3|19|01||||||201010201716|201010211706
PV2|||ADMIT13|||||||||||||||||||||||||||||||||||C
OBX|1|CE|ID1234567890||CODE6^FTCAREADD^CODE_SYSTEM|kg||N|||Confirmed|||201010180804||C3456789
OBX|2|CE|ID1234564440||CODE7^MADE_UP_CODE_7^CODE_SYSTEM|mmHg||N|||Confirmed|||201010201038||C3456789
ZU1|201010071234|1|C|201010091300|201010211706|500|||||||||201010081200|201010081156|02|Y|0
ZU3|004|03|5|||||normal|8b||1|1
ZU4||201010081756|20101009
ZU8|Z|1|No
```

##### HL7 FHIR Example

This example contains more clinical information than the previous `Outpatient Clinic` example but similarly this is converted to a FHIR Encounter. 

[Example FHIR Encounter - Inpatient Discharge Notification Fredrica Smith](Encounter-Encounter-inpatient-discharge-fredrica-smith.html)

The observations contained in this message have been excluded from this conversion. 
NHS England recommendation is likely to be this data should be shared instead via NRL, IHE XDS/MHD, IPA, IPS, etc (see diagram below). 
Should you wish to include observations in a FHIR Message please see [HL7 Version 2 to FHIR - Patient Administration](https://build.fhir.org/ig/HL7/v2-to-fhir/message_maps.html#chapter--3--patient-administration)

<figure>{% include patient-encounter-management-sequence-modernisation.svg %}</figure>
<br clear="all"/>

The reasons for this recommendation are:

- Methods for sharing data and documents are becoming more common.
- FHIR Messages put a considerable burden on the Patient Encounter Source (PAS or EPR) and take time to develop. 
  - It is now common for PAS/EPR to be also asked to share the data/document, this is duplication.
  - Consumers which require clinical data should do the hard work, not the source.
- Important notifications may be delayed by upto 48 hours when using FHIR Messages an FHIR Documents (e.g. Transfer of Care), as the document may not be ready. 
- Event notifications can keep all patient care providers informed on what is happening on the patient's care journey, it is not focused on updating computer system records.


### Other Programme Considerations

These events will often be produced before encounter documentation is produced, therefore it will not be practical to include any NRL or IHE XDS pointers in these event.

This event represents U-turn from HL7 v3 and FHIR Messaging approaches in this area such as:

- Transfer of Care
- Digital Medicines
- Assessment Discharge and Withdrawal

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

The previous implementation is mostly unchanged, but it is joined by the **Patient Encounter Management** notification which goes to Social Services Safeguarding. This includes more encounter metadata:

- type of encounter
- encounter service code
- encounter reason (optional)
- encounter identifier which can be used to query encounter documents via Connection Care Records
- encounter participants

### HL7 FHIR and IHE Events Notifications via Pub/Sub 

At present this proposal is based on requirement from CPIS, the number of providers interested is probably more than just Social Services Safeguarding. As mentioned GP, Community, Mental Health teams may be also interested in these events. It is not a fixed list of interested parties and so is would likely use [Publish-Subscribe Channel](https://www.enterpriseintegrationpatterns.com/patterns/messaging/PublishSubscribeChannel.html) patterns. 

This is the approach taken in 

- [IHE Patient Master Identity Registry (PMIR)](https://profiles.ihe.net/ITI/PMIR/) which could potentially be used with PDS for Patient Demographics notifications
  - Note this doesn't use the **Subscriptions R5 Backport**
- [IHE Document Subscription for Mobile (DSUBm)](https://build.fhir.org/ig/IHE/ITI.DSUBm/branches/master/index.html) which could potentially be used NRL for pointer notifications and IHE XDS/MHD for document notifications.
  - This makes use of the **Subscriptions R5 Backport**
E.g.

<figure>{% include patient-encounter-management-sequence-notifications-subscriptions.svg %}</figure>
<br clear="all"/>

1. The Patient Encounter Consumer (e.g. Social Services Safeguarding) creates a [Subscription for patient with a NHS Number of 3333333333](Subscription-Subscription-ex-Encounter.html)
2. The Patient Encounter Source (e.g. an Acute NHS Trust) sends a [Resource Publish Transaction Bundle](Bundle-Bundle-ex-ResourcePublish.html) to the Subscription Manager.
3. The Subscription Manager checks for matching subscriptions
4. For each matching Subscription it sends a [Resource Notify Event Notifiction](Bundle-Bundle-ex-EventNotification.html)

The example above used a `REST-Hook` Subscription, the [Subscriptions R5 Backport](https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/channels.html) has several channels including:

- REST-Hook (assumed to be default)
- Websocket
- Email (probably also a common option)
- FHIR Messaging
- Custom Channels
