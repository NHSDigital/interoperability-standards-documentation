Instance: RelatedPerson-NHS-91000000009
InstanceOf: RelatedPerson
Title: "National Proxy Related Person Mother Example"
Description: "An example of a Related Person who is the mother of the subject/patient (Jane Smith)."
Usage: #example
* active = false
* identifier[0].system = $nhs-number
* identifier[0].value = "91000000009"
* patient = Reference(Patient-PDS-NHS-9000000017-Jayne-Smith) "Jayne SMITH"
* patient.identifier.system = $nhs-number
* patient.identifier.value = "9000000017"
* relationship = $v3-RoleCode#NMTH "natural mother"
* relationship.text = "Natural Mother"
* name.use = #official
* name.family = "Glassby"
* name.given = "Ada"
* birthDate = "1916-12-05"
