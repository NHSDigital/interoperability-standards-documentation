ValueSet: PatientFlagCategory
Id: PatientFlagCategory
Title: "NHSE Patient Flag Category"
Description: "A ValueSet to identify the type/category of a flag."

* ^name = "PatientFlagCategory"
* ^url = "https://fhir.nhs.uk/England/ValueSet/PatientFlagCategory"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-02-14"
* ^experimental = false

* insert NHSEngland-Copyright

* ^expansion.timestamp = "2024-02-14T12:00:00+00:00"
* ^expansion.contains[0].system = "https://fhir.nhs.uk/England/CodeSystem/PatientFlagCategory"
* ^expansion.contains[=].code = #NRAF
* ^expansion.contains[=].display = "National Reasonable Adjustments Flag"
* ^expansion.contains[+].system = "https://fhir.nhs.uk/England/CodeSystem/PatientFlagCategory"
* ^expansion.contains[=].code = #CP-IS
* ^expansion.contains[=].display = "Child Protection - Information Sharing Flag"
* ^expansion.contains[+].system = "https://fhir.nhs.uk/England/CodeSystem/PatientFlagCategory"
* ^expansion.contains[=].code = #FGM
* ^expansion.contains[=].display = "Female Genital Mutilation Flag"
