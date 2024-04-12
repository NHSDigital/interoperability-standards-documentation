
This proposal originates from CPIS (and potentially Wayfinder) user requirements and describes options for enhancing **Patient Encounter Management** and also suggestions for depreciating this HL7 v2 ADT based event notification standard.

The suggestions are: 

- Querying Existing Data
- Event Notifications (Distribution List) 
  - HL7 v2 ADT/IHE PEM
  - HL7 FHIR version of IHE PEM
- Pub/Sub (Event Notifications)

The scope of this proposal is national, regional, NHS Trust and supplier.

## Querying Existing Data

<figure>{% include qedm-encounter.svg %}</figure>
<br clear="all"/>

|-----------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **FHIR Resource**                                       | **FHIR Profile**                                        | **Interaction**                                                     |
| Encounter |  [NHSEngland-Encounter](StructureDefinition-Encounter.html) based on UKCore-Encounter | See [NHS England Patient Encounter Management](CapabilityStatement-NHSEnglandPatientEncounterManagementProvider.html) |


This includes defining a base set of query parameters which should be followed by suppliers and NHS England programmes.  both [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html#234441218-encounters-option-search-parameters) and also [US Core Encounter - Mandatory search parameters](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-encounter.html).
The initial proposal can be found here [NHS England Patient Encounter Management](CapabilityStatement-NHSEnglandPatientEncounterManagementProvider.html), this is based on similar requirement in  both [IHE Query for Existing Data for Mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/PCC-44.html#234441218-encounters-option-search-parameters) and also [US Core Encounter - Mandatory search parameters](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-encounter.html)
Suppliers and NHS England programmes can build on this base API but SHOULD also adhere to the base API definition.


## Event Notifications

NHS England has not produced any guidance around replacing HL7 v2 ADT/IHE PEM. NHS England has instead focused on the transfer of Encounter/Episode clinical documentation, which includes

- Transfer of Care
- Digital Medicines
- Assessment Discharge and Withdrawal

These are likely to be refactored to use document sharing API's such as those provided by NHS Englands National Record Locator Service and IHE XDS/XDSonFHIR Cross Enterprise Document Sharing. 
It is likely this will create use cases to notify interested parties of events such as:

- A discharge or outpatient letter has been created [IHE Document Subscription for Mobile (DSUBm)](https://build.fhir.org/ig/IHE/ITI.DSUBm/branches/master/index.html)
- Patient admission, discharge or transfer notifications - From a workflow perspective it is important to let other providers know the patients current status is (rather than the status of the clinical record which can follow upto 48 hours after the patient has been discharged).

Options for solving the latter, which is the use case for [IHE Patient Encounter Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2) are:
- (New) HL7 FHIR version IHE PEM
- (Existing) HL7 v2 ADT version of IHE PEM

### HL7 FHIR based version IHE PEM

<figure>{% include pem-encounter.svg %}</figure>
<br clear="all"/>

|-----------------------------------------------------|-----------------------------------------------------|--------------------------------------|
| **FHIR Resource**                                       | **FHIR Profile**                                        | **Interaction**         |
| Encounter |  [NHSEngland-Encounter](StructureDefinition-Encounter.html) based on UKCore-Encounter | ```PUT /Encounter?identifier={system |}[code]``` |


```
PUT /Encounter?identifier=https://fhir.leedsth.nhs.uk/VisitId|2141
```

This recommendation is influenced by the interaction used in IHE PIXm and so is similarly an 'upsert': which means amend (PUT) the existing resource if it doesn't exist else create (POST) it, note this is reliant on the visit identifier being present.

Examples below are based on existing examples from NHS England HL7 v2 ADT specifications.

- [Example FHIR Encounter - Inpatient Discharge Notification Fredrica Smith](Encounter-Encounter-inpatient-discharge-fredrica-smith.html)
- [Example FHIR Encounter - Outpatient Fredrica Smith](Encounter-Encounter-outpatient-fredrica-smith.html)
- [Example FHIR Encounter - Pre Admission Notification Fredrica Smith](Encounter-Encounter-pre-admission-fredrica-smith.html)

These events notifications focus only on the workflow notification and so unlike Transfer of Care, they do not contain clinical information.  
They will contain enough metadata such as the patient NHS Number and the identifier of the Encounter, for this detailed clinical information to be retrieved. The API to be used to obtain the clinical information will vary and this notification is decoupled from those API's.  

<figure>{% include patient-encounter-management-sequence-modernisation.svg %}</figure>
<br clear="all"/>


### HL7 v2 ADT/IHE PEM

For details see 

- [IHE Patient Encounter Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>

#### Background

A typical NHS Acute will use Trust Integration Engine (TIE) to route these existing messages as follows:

<figure>{% include patient-encounter-management-sequence-notifications-current.svg %}</figure>
<br clear="all"/>

- The PAS system emits event notifications to the TIE based on a series of triggers, these are typically:
   - Patient admissions
   - Outpatient/Emergency attendance 
   - Ward Transfers (inpatient)
   - Discharges (inpatient, outpatient and emergency)
- The TIE then distributes these events to other systems in the NHS Trusts. This can include external providers such as GP systems.

### HL7 FHIR and v2 Compatability

It is recommended these interactions are compatible with HL7 v2 ADT/IHE PEM due to the high levels adoption of HL7 v2 ADT in the English NHS.

The use of either option is likely be used in the same event flows as the other, e.g. 

<figure>{% include patient-encounter-management-sequence-notifications-future.svg %}</figure>
<br clear="all"/>

This diagram shows a NHS Trust continuing to use it's HL7 v2 ADT/IHE PEM system but it also starts to use the HL7 FHIR when working with external providers (e.g. primary, community and social care).

It is recommended that the data model in HL7 v2 is retained in HL7 FHIR to simplify the transform and so keep the solution simple. 
This may also improve adoption as both the v2 and FHIR versions are compatible with each othe

## Pub/Sub 

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

## Use Cases

### Outpatient Clinic Attendance Notification

#### Use Case

`Mrs Smith is discharged from her hospital provider spell. The discharge reports 2 observations from the hospital provider spell. The first is a weight measurement and the second a blood pressure. She is discharged with no follow up required, and returns home.`



#### HL7 FHIR Encounter Example

- [Example FHIR Encounter - Outpatient Fredrica Smith](Encounter-Encounter-outpatient-fredrica-smith.html)

#### HL7 v2 ADT_A04 Example

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

### Discharge (Inpatient) Notification

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


#### HL7 FHIR Encounter Example

- [Example FHIR Encounter - Inpatient Discharge Notification Fredrica Smith](Encounter-Encounter-inpatient-discharge-fredrica-smith.html)

#### HL7 v2 ADT_A03 Example

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


### Planned Admission Notification

#### Use Case

```Following Mrs Smith's first antenatal assessment, a due date for her baby was estimated by her consulting doctor Dr Darwin. This due date was used in order pre-admit the patient so that she was provisionally booked to attend York Hospital for her delivery.```

#### HL7 FHIR Encounter Example

- [Example FHIR Encounter - Pre Admission Notification Fredrica Smith](Encounter-Encounter-pre-admission-fredrica-smith.html)

In FHIR R5 Encounter.period is split into actual Period, plannedStartDate and plannedEndDate. This example suggests backporting the plannedStartDate/plannedEndDate as an extension.

#### HL7 v2 ADT_A05 Example

An example HL7 v2 ADT_A05 is shown below, this is from <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201008021530||ADT^A05^ADT_A05|13403891320453338090|P|2.4|0|20100802141857|||GBR|UNICODE|EN||iTKv1.0
EVN||201008021530|||111111111^Cortana^Emily^^Miss^^RCB55|201008021530
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196512131515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||EN|M|C22|||||A|Berlin|N||GBR||DEU||||ED
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
PV1|61|O|RCB^MATWRD|82||||||500||||79|B6|||Pregnant|4532^^^VISITID
PV2|||Labour|||||201009300000|201010010000||||||||||||||||2|||||||||||||C
AL1|1|DA|Z88.5|5||199807011755
ZU3|004||||||||8b||1
ZU6||201008021530|2|||4||5
ZU8|U|1|Yes
```


### CPIS Implementation at Calderdale and Huddersfield NHS Foundation Trust

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
