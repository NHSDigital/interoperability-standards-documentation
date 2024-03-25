Profile: RelatedPerson
Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-RelatedPerson
Id: RelatedPerson
Description: "NHS England RelatedPerson"
* identifier 1..* MS
* active 1..1 MS
* birthDate MS
* address MS
* name MS
* patient 1..1
* patient only Reference(PatientPDS)
* relationship 1..1 MS

