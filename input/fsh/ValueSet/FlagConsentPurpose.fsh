ValueSet: FlagConsentPurpose
Id: FlagConsentPurpose
Title: "NHSE Flag Consent Purpose"
Description: "A ValueSet to identify the purpose of a consent given for an NHS England flag."

* ^name = "FlagConsentPurpose"
* ^url = "https://fhir.nhs.uk/England/ValueSet/FlagConsentPurpose"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-02-14"
* ^experimental = false

* insert NHSEngland-Copyright

* ^expansion.timestamp = "2024-02-14T12:00:00+00:00"
* ^expansion.contains[0].system = "https://fhir.nhs.uk/England/CodeSystem/RA-ConsentPurpose"
* ^expansion.contains[=].code = #RACONSENT
* ^expansion.contains[=].display = "Reasonable Adjustments - Consent to record Reasonable Adjustments"

* ^expansion.contains[0].system = "https://fhir.nhs.uk/England/CodeSystem/CPIS-ConsentPurpose"
* ^expansion.contains[=].code = #CPISCONSENT
* ^expansion.contains[=].display = "CPIS - Consent to record CPIS flags"

* ^expansion.contains[0].system = "https://fhir.nhs.uk/England/CodeSystem/FGM-ConsentPurpose"
* ^expansion.contains[=].code = #FGMCONSENT
* ^expansion.contains[=].display = "FGM - Consent to record FGM flags"
