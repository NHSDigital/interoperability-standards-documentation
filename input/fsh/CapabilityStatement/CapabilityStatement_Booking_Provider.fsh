Instance: BookingProvider
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NHS England Booking Provider"
* status = #draft
* date = 2024-02-29
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* description = "Provider supports read-only access to a for the purposes of direct care and subject of care access. \n\n**THIS IS FOR DEMONSTRATION PURPOSES**"
* rest.mode = #server

//Appointment
* insert ResourceWithExpectation(#Appointment, https://fhir.nhs.uk/England/StructureDefinition/Appointment, #SHALL)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-Appointment)
* insert InteractionWithExpectation(#create, #SHALL)
* insert InteractionWithExpectation(#read, #SHALL)
* insert InteractionWithExpectation(#delete, #SHALL)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(patient, #reference, #SHOULD)
* insert SearchParamWithExpectation(patient:identifier, #token, #MAY)
* insert WithSearchParamDocumentation(A search by NHS Number. Server does not have a patient index)
* insert SearchParamWithExpectation(patient.identifier, #token, #MAY)
* insert WithSearchParamDocumentation(A search by NHS Number. Server has a patient index)

//AppointmentResponse
* insert ResourceWithExpectation(#AppointmentResponse, https://fhir.nhs.uk/England/StructureDefinition/AppointmentResponse, #SHOULD)
* insert InteractionWithExpectation(#create, #SHALL)
* insert InteractionWithExpectation(#update, #SHALL)

//Schedule
* insert ResourceWithExpectation(#Schedule, https://fhir.nhs.uk/England/StructureDefinition/Schedule, #SHALL)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-Schedule)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(date, #date, #SHALL)
* insert SearchParamWithExpectation(service-type, #token, #SHOULD)

//Slot
* insert ResourceWithExpectation(#Slot, https://fhir.nhs.uk/England/StructureDefinition/Slot, #SHALL)
* insert WithSupportedProfile(https://fhir.hl7.org.uk/StructureDefinition/UKCore-Slot)
* insert InteractionWithExpectation(#search-type, #SHALL)
* insert SearchParamWithExpectation(start, #date, #SHALL)
* insert SearchParamWithExpectation(end, #date, #SHALL)
* insert SearchParamWithExpectation(status, #token, #SHOULD)
* insert SearchParamWithExpectation(service-type, #token, #SHOULD)
* insert SearchParamWithExpectation(service, #token, #MAY)
* insert SearchParamWithExpectation(specialty, #token, #MAY)
* rest.resource[=]
  * searchInclude[+] = "Slot:schedule"
  * searchInclude[+] = "Schedule:actor:Practitioner"
  * searchInclude[+] = "Schedule:actor:PractitionerRole"
  * searchInclude[+] = "Schedule:actor:HealthcareService"
  * searchInclude[+] = "HealthcareService:providedBy"
  * searchInclude[+] = "HealthcareService:location"
  * searchInclude[+] = "Slot:*"


