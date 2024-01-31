### FHIR Profiles

The FHIR specification is a "platform specification" - it creates a common platform or foundation on which a variety of different solutions are implemented. As a consequence, this specification usually requires further adaptation to particular contexts of use. Typically, these adaptations specify:

- Rules about which resource elements are or are not used, and what additional elements are added that are not part of the base specification
- Rules about which API features are used, and how
- Rules about which terminologies are used in particular elements
- Descriptions of how the Resource elements and API features map to local requirements and/or implementations 

These rules and descriptions are described in FHIR Profiles which are discussed in [Profiling FHIR](https://hl7.org/fhir/R4/profiling.html). Note FHIR Profiles are not schemas, see downloads for schemas, code libraries and implementation tools.

#### FHIR Validation (Testing)

Testing FHIR resources against a FHIR Profile is called FHIR Validation, see [Validating Resources](https://hl7.org/fhir/R4/validation.html).

A series of tools are available to support creation of profiles and testing resources against them, see [Profile Tooling](https://confluence.hl7.org/display/FHIR/Profile+Tooling).

NHS England Interoperability Standards uses a HAPI FHIR based Validator to test conformance of the Implementation Guides, the source code can be found at https://github.com/NHSDigital/IOPS-FHIR-Validation-Service
