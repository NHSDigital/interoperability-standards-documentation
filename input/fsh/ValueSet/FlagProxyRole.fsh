ValueSet: FlagProxyRole
Id: FlagProxyRole
Title: "NHSE Flag Proxy Role"
Description: "A ValueSet to identify the type/role of the proxy involved."

* ^name = "FlagProxyRole"
* ^url = "https://fhir.nhs.uk/England/ValueSet/FlagProxyRole"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-02-14"
* ^experimental = false

* insert NHSEngland-Copyright

* ^expansion.timestamp = "2024-02-14T12:00:00+00:00"
* ^expansion.contains[0].system = "https://fhir.nhs.uk/England/CodeSystem/FlagProxyRole"
* ^expansion.contains[=].code = #001
* ^expansion.contains[=].display = "Patient consent"
* ^expansion.contains[+].system = "https://fhir.nhs.uk/England/CodeSystem/FlagProxyRole"
* ^expansion.contains[=].code = #002
* ^expansion.contains[=].display = "Best interest decision made on behalf of the patient (Mental Capacity Act 2005)"
* ^expansion.contains[+].system = "https://fhir.nhs.uk/England/CodeSystem/FlagProxyRole"
* ^expansion.contains[=].code = #003
* ^expansion.contains[=].display = "Lasting power of attorney for health and welfare, or court-appointed deputy, or equivalent"
* ^expansion.contains[+].system = "https://fhir.nhs.uk/England/CodeSystem/FlagProxyRole"
* ^expansion.contains[=].code = #004
* ^expansion.contains[=].display = "Other legitimate patient representative - parental responsibility"
