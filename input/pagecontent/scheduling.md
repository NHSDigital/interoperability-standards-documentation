

## Provider Discovery

### Query API

See [IHE Mobile Care Services Discovery (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html)

## Booking

<figure>{% include scheduling-booking.svg %}</figure>
<br clear="all"/>

### Find Potential Appointments

See [IHE ITI Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) ITI-115

### Book Appointment 

See [IHE ITI Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) ITI-117

## Searching 

### Find Existing Appointments

See [IHE ITI Scheduling](https://build.fhir.org/ig/IHE/ITI.Scheduling/index.html) ITI-118

## Managing

### Event Notifications

<figure>{% include scheduling-notifications.svg %}</figure>
<br clear="all"/>

The suggestion to use [iCal](https://www.ietf.org/rfc/rfc2445.txt) may better meet user needs for notifications, note FHIR Appointment and AppointmentResponse are related to iCal.

HL7v2 SRM (request), SRR (response), SIU (event notification): SRM S01 - Schedule request - New appointment booking Trigger Event (HL7 v2.5.1) (caristix.com)
HL7 v2 ADT_A05 may also be used for appointment notifications, note this is focused around inpatient care and may more naturally be equivalent to FHIR Encounter.
