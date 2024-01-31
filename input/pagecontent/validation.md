### Overview

FHIR validation aims to verify that the exchanged healthcare information is well-formed, follows the prescribed data structures, and complies with the rules and constraints specified by FHIR profiles.

Here are key aspects of FHIR validation:

- Syntax Validation: This involves checking the syntactical correctness of FHIR resources. It ensures that the resource is properly formatted according to the FHIR XML or JSON representation.
- Profile Validation: FHIR resources can be constrained or extended using profiles. Profile validation checks whether a resource adheres to the constraints defined in a specific profile. Profiles define additional rules, extensions, and constraints on top of the base FHIR resources.
- ValueSet Validation: FHIR resources often use coded elements, and these codes may be constrained by a ValueSet. ValueSet validation ensures that the codes used in a resource are valid within the specified ValueSet.
- Business Rules Validation: FHIR resources may have specific business rules associated with them. Validation ensures that these business rules are satisfied.
- Reference Integrity Validation: FHIR resources often refer to other resources within the same or different profiles. Reference integrity validation checks that the references are valid and point to existing resources.

FHIR validation is essential for achieving interoperability in healthcare systems. It helps ensure that systems exchanging FHIR resources can trust the data being shared and that the data conforms to the expectations of both the sender and the receiver. Validators and validation tools are often used to perform these checks during the development, integration, and operation of FHIR-enabled systems.


| Testing of:                                   | Development | Conformance | Production | Requires                                                  |
|-----------------------------------------------|------|------|------|-----------------------------------------------------------|
| FHIR Schema/Structure (JSON/XML)              | &#9989; 	| &#9989;	| &#9989;| 	FHIR Validator                                           | 
| Cardinality and Value domains                 | 	&#9989; | 	&#9989;|  	&#9989; | 	FHIR Validator                                           | 
| Profiles and Questionnaires including UK Core | 	&#9989; | 	&#9989; 	| &#9989; | 	FHIR Validator and conformance packages                  | 
| Coding (SNOMED CT)                            | &#9989; | 	&#9989; | 	&#10060;| 	FHIR Validator, conformance packages and ontology server | 


The [NHS England Ontology Server](https://ontology.nhs.uk/) does not work with the HL7 FHIR Validator due to the security model used.

Coding validation can be done in production but this is a more intensive operation and so may not be optimal.

It is recommended that FHIR Validation is aimed at individual resources during early stages of developments, validation against FHIR Bundles can quickly get complicated.

The use of conformance packages is not mandatory but does make validation easier. The example below will use UK Core in it's distribution package form.

### Tools

There are several tools available for validating FHIR resources. These tools can help you ensure that your FHIR resources comply with the FHIR specifications and any specific profiles or requirements you are working with. Here are some commonly used tools for FHIR validation:

Remember to check the documentation and user guides associated with each tool for instructions on how to use them effectively for FHIR resource validation. The choice of tool may depend on your specific use case, programming language preference, and workflow requirements.

#### Official FHIR Validator:

- The FHIR community provides an official FHIR validation tool that you can use online or download and run locally. It supports validating both XML and JSON representations of FHIR resources.
- Command Line Validation: [Using the FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator)
- Online Validation: [https://validator.fhir.org/](https://validator.fhir.org/)

#### HAPI FHIR Validator:

- The HAPI FHIR library, which is a Java-based implementation of the FHIR standard, includes a validator and HL7 validation libraries. You can use this validator programmatically within your Java projects.
- Documentation: [HAPI FHIR Validation](https://hapifhir.io/hapi-fhir/docs/validation/introduction.html) 
- Example Implementation: [NHS England Validator (Interoperability Standards)](https://github.com/NHSDigital/IOPS-FHIR-Validation-Service) (used to test UK Core)

#### Simplifier.net:

- [Simplifier.net](http://simplifier.net/) is a platform that provides various FHIR-related services, including validation. It allows you to upload, validate, and manage FHIR profiles and resources. (some features may require paid for subscription)
- Command Line: [Firely Terminal command line tool](https://fire.ly/products/firely-terminal/). (some features may require paid for subscription)

#### Forge (FHIR Profile Editor):

- Forge is a tool for creating and editing FHIR profiles, and it includes a validation feature. It allows you to define profiles and then use them to validate FHIR resources.
- Website: [Forge](https://fire.ly/products/forge/)

#### Schematron for FHIR:

- Schematron is a rule-based validation language, and it can be used for more advanced validation scenarios. FHIR supports Schematron rules, and you can create custom rules to check specific conditions in your FHIR resources.
- Schematron for FHIR: Schematron on GitHub

#### FHIR Implementation Guide Publisher:

- [FHIR Implementation Guide Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation) is a tool used for working with FHIR implementation guides. While its primary purpose is not resource validation, it can be used to generate validated Implementation Guides.
