
### Deprecated Standards

This guidance replaces the following standards:

- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a> Appointment Event notifications
- <a href="https://developer.nhs.uk/apis/nhsbooking-2.0.4/index.html" target="_blank">NHS England FHIR STU3 FHIR NHS Booking API</a> Appointment API Foundation standard

### Relationship Diagram

<figure>{% include administration-module-scheduling-and-appointments.svg %}</figure>
<br clear="all"/>

### Schema, UK Core Conformanace and additional NHS England Conformance  

All resources **SHALL** be based on the HL7 FHIR schema. 
All resources **SHALL** conform (test/validate against) UK Core Conformance data standards 
All resources **SHALL** conform to the additional implementation requirements in NHS England FHIR Conformance

### Known Implementations

#### NHS England

- <a href="https://digital.nhs.uk/developer/api-catalogue/booking-and-referral-fhir" target="_blank">Booking and Referral - FHIR API</a>
- <a href="https://developer.nhs.uk/apis/gpconnect-1-2-7/appointments.html" target="_blank">GP Connect Appointment Management - FHIR API</a> HL7 FHIR STU3
- <a href="https://digital.nhs.uk/developer/api-catalogue/e-referral-service-fhir#overview--overview" target="_blank">e-Referral Service - FHIR API</a> HL7 FHIR STU3
- <a href="https://digital.nhs.uk/developer/api-catalogue/patient-care-aggregator-get-appointments#overview--overview" target="_blank">Patient Care Aggregator Get Appointments API standard</a>

#### Regional or Supplier

- <a href="https://fhir.cerner.com/millennium/r4/" target="_blank">Oracle Cerner Millenium</a>
- <a href="https://fhir.epic.com/" target="_blank">EPIC</a>

### Search for slots

[GET /Schedule?](CapabilityStatement-BookingProvider.html#Schedule1-3)
[GET /Slot?](CapabilityStatement-BookingProvider.html#Slot1-4)

#### Supplier Versions

Suppliers (EMIS IM1/PFS, EPIC and Cerner) have variations of the following:

<figure>{% include booking-free-slots-supplier.svg %}</figure>
<br clear="all"/>

#### NHS England Versions


NHS England has variations of the following:

<figure>{% include booking-free-slots-NHSE.svg %}</figure>
<br clear="all"/>

### Book an appointment

[POST /Appointment](CapabilityStatement-BookingProvider.html#Appointment1-1)

(replaces ADT_A05)

### Update and cancel an appointment

[PUT /Appointment](CapabilityStatement-BookingProvider.html#Appointment1-1)
(replaces HL7 v2 ADT_A05, in FHIR this can be used in conjunction with FHIR Subscription or FHIR Cast.)

[DELETE /Appointment](CapabilityStatement-BookingProvider.html#Appointment1-1)
(replaces HL7 v2 ADT_A38, in FHIR this can be used in conjunction with FHIR Subscription or FHIR Cast)

Note from a workflow prespective, this would normally follow after 'Appointment decline' event. So process is roughly: 
- POST /AppointmentResponse (I can't attend)
- POST /Appointment (cancelled) - organiser of appointment then cancels the meeting.

### Arrived/SendIn for an Appointment

In NHS England v2 spec's. This is a series of event notifications based which uses ADT_A04, this would probably be PUT/POST Encounter.
Can be ignored for now? Included to show all appointment related events. Rough proces is 
- Patient arrives for an appointment and books in
- Dr then asks the patient to come in 

### Search for appointments

[GET /Appointment?](CapabilityStatement-BookingProvider.html#Appointment1-1)

### Respond to an Appointment request (Accept, Tentative or Decline)

I don't think we've covered this previously

<figure>{% include booking-respond-to-appointment.svg %}</figure>
<br clear="all"/>

[POST /AppointmentResonse?](CapabilityStatement-BookingProvider.html#AppointmentResponse1-2)
