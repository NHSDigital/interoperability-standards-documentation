Profile: Appointment
Parent: http://hl7.org/fhir/StructureDefinition/Appointment
Id: Appointment
Description: "NHS England Appointment"

* slot MS
* identifier MS
* identifier.system 1..1
* identifier.value 1..1
* serviceType from https://fhir.nhs.uk/ValueSet/NHSDigital-CareSettingType (required)
* serviceCategory

* serviceCategory 1..
* serviceCategory ^slicing.discriminator.type = #value
* serviceCategory ^slicing.rules = #open
* serviceCategory ^slicing.discriminator.path = "coding.system"
* serviceCategory contains class 1..1
* serviceCategory[class] ^short = "Classification when becoming an encounter"
* serviceCategory[class] from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (required)
* specialty from https://fhir.hl7.org.uk/ValueSet/UKCore-PracticeSettingCode
* participant.actor.identifier.system 1..1
* participant.actor.identifier.value 1..1
