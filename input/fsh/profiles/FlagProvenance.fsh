Profile: FlagProvenance
Parent: Provenance
Id: FlagProvenance
Title: "NHSE Flag Provenance Profile"
Description: "Record details of the practitioner recording or removing an individual Flag."

* ^name = "FlagProvenance"
* ^url = "https://fhir.nhs.uk/England/StructureDefinition/FlagProvenance"
* ^version = "0.1.0"
* ^status = #draft
* ^date = "2024-02-14"

* insert NHSEngland-Copyright

* target only Reference(Condition or FlagConsent or Flag)
* agent.role from $ValueSetFlagProvenanceRole (extensible)
* agent.who only Reference(Practitioner)
* agent.onBehalfOf only Reference(Organization)
