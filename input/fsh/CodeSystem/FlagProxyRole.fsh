CodeSystem: FlagProxyRole
Id: FlagProxyRole
Title: "NHSE Flag Proxy Role"
Description: "A CodeSystem to identify the type/role of the proxy involved"

* ^name = "FlagProxyRole"
* ^url = "https://fhir.nhs.uk/England/CodeSystem/FlagProxyRole"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-02-14"
* ^experimental = false

* insert NHSEngland-Copyright

* ^caseSensitive = true
* ^content = #complete
* #001 "Patient consent"
* #002 "Best interest decision made on behalf of the patient (Mental Capacity Act 2005)"
* #003 "Lasting power of attorney for health and welfare, or court-appointed deputy, or equivalent"
* #004 "Other legitimate patient representative - parental responsibility"
