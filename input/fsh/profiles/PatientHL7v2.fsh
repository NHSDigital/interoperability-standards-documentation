Profile: PatientHL7v2
Parent: https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient
Id: PatientHL7v2
Description: "NHS England Patient HL7 v2 (ITK)"
* extension contains
    http://hl7.org/fhir/StructureDefinition/patient-nationality named patientNationality 0..* and
    http://hl7.org/fhir/StructureDefinition/patient-religion named patientRegligion 0..*
* identifier 1..* MS
* identifier.assigner 1..1
* identifier.assigner.identifier 1..1
* name 1..* MS
* generalPractitioner.identifier 1..1
* generalPractitioner.identifier.system 1..1
* generalPractitioner.identifier.value 1..1
