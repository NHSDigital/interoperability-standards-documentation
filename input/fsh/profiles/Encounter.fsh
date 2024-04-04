Profile: Encounter
Parent: http://hl7.org/fhir/StructureDefinition/Encounter
Id: Encounter
Description: "NHS England Encounter"
* identifier 1..* MS
* serviceType 1..1 MS
* serviceType from https://fhir.nhs.uk/ValueSet/NHSDigital-CareSettingType (required)
* subject 1..1 MS
* participant.individual.identifier.system 1..1
* participant.individual.identifier.value 1..1
