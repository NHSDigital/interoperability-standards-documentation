
This implementation guide is based on the HL7 FHIR standard. It uses terminology, notations and design principles that are specific to FHIR. Before reading this implementation guide, it is important to be familiar with some of the basic principles of FHIR as well as general guidance on how to read FHIR specifications. Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

### Understanding HL7 FHIR for Managers

#### Introduction

Healthcare providers often face challenges in coordinating care for patients, especially when dealing with multiple healthcare systems, diverse specialties, and various data formats. Traditional methods of sharing patient information are often cumbersome and inefficient. The implementation of HL7 FHIR addresses these challenges by providing a standardized and interoperable framework for exchanging healthcare data.

Key Features

#### Interoperability

   HL7 FHIR is designed to enhance interoperability by providing a standardized way to exchange healthcare information across different systems and organizations. This interoperability is crucial for care coordination, as it enables healthcare providers, hospitals, clinics, and other entities to share relevant patient information, improving the continuity of care.

#### RESTful APIs

   FHIR employs RESTful APIs, making it easier for developers to implement and integrate with existing systems. This approach allows for efficient communication between applications over the internet, promoting flexibility and scalability in healthcare IT solutions.

#### Modulaity and Scalability

   FHIR's modular design allows for incremental adoption, making it easier for healthcare organizations to integrate FHIR into their existing infrastructure, allowing for gradual expansion as needed.

#### Extensibility
   
HL7 FHIR is extensible, allowing organizations to customize and extend the standard to meet specific business needs. This flexibility ensures that FHIR can evolve with technological advancements and adapt to the unique requirements of different healthcare settings.

#### Workflow Integration
   FHIR is designed to integrate seamlessly into existing healthcare workflows. This makes it easier for healthcare professionals to incorporate FHIR-enabled systems and applications into their daily routines.
   
### Benefits for Managers
   
#### Improved Efficiency
   
FHIR facilitates seamless information exchange, reducing the need for manual data entry and minimizing errors. This leads to increased operational efficiency and enables healthcare professionals to focus more on patient care.

#### Enhanced Collaboration
   
Interoperability provided by FHIR fosters collaboration between different healthcare systems and stakeholders. Managers can leverage this to establish integrated care networks, enabling better coordination and communication across the continuum of care.

#### Accelerated Innovation
   
The use of modern web standards in FHIR promotes innovation by making it easier for developers to create and deploy new healthcare applications. This accelerates the adoption of cutting-edge technologies in healthcare, positioning organizations at the forefront of industry advancements.


### Scenario:

> Imagine a patient, Sarah, who has a chronic condition requiring care from multiple healthcare providers, including primary care physicians, specialists, and a care coordinator. Each of these providers uses different electronic health record (EHR) systems.

#### Implementation Steps:

- **Patient Enrollment:**

  Sarah's primary care physician initiates her care plan using their native system which shares the record using FHIR resources such as Patient, Observation/CarePlan, and Practitioner.
  The care plan includes details about Sarah's condition, medications, scheduled appointments, and relevant healthcare providers.

- **Interoperable Data Exchange:**

  FHIR APIs are implemented to enable seamless communication between Sarah's primary care physician's EHR system, specialist EHR systems, and the care coordinator's system.
  Each system communicates using FHIR resources, ensuring standardized and interoperable data exchange.

- **Appointment Scheduling:**

  Sarah's primary care physician schedules appointments with specialists using FHIR Appointment resources.
  The appointments are automatically shared with the specialists, eliminating the need for manual communication and reducing the risk of scheduling conflicts.

- **Medication Management:**

  FHIR Medication resources are utilized to manage Sarah's medications across different healthcare providers.
  Any changes to Sarah's medication plan made by one provider are instantly available for all other providers involved in her care.

- **Care Coordination:**

  The care coordinator utilizes FHIR CareTeam resources to organize and coordinate Sarah's care team, including all relevant healthcare providers.
  Timely information sharing to the appropriate persons involved with Sarah's care, including practitioners, family members, guardians and Sarah herself.

#### Internationally Recognised

HL7 FHIR is internationally recognized and has gained widespread acceptance as a standard for health data exchange. This is evident through its adoption in various countries, engagement by healthcare organizations globally, and its inclusion in interoperability initiatives on a global scale. This includes counties such as  United States, Australia, European Union, and Belgium, standards such as [Integrating the Healthcare Enterprise (IHE)](https://www.ihe.net/),  [International Patient Summary (IPS)](https://build.fhir.org/ig/HL7/fhir-ips/index.html) , and supported by companies such as Google, AWS, and IBM.

The United Kingdom has its own flavour of FHIR which extends the resources and guidance to ensure suitability and interoperability across the four nations.

A full list of HL7 Organisational members can be found [here](https://www.hl7.org/about/yellowpages/index.cfm?category=alpha&company=&Submit=Search).

<!--
<video width="320" height="240" controls>
    <source type="video/mp4" 
    src="https://vimeo.com/112905640">
</video>
-->

### Understanding FHIR

HL7 FHIR (Fast Healthcare Interoperability Resources) is a standards framework for healthcare data exchange, published by HL7®

- [FHIR Summary](http://hl7.org/fhir/summary.html)
  - A high level summary of what FHIR is, where it came from, and what the benefits are
- [FHIR overview](http://hl7.org/fhir/R4/overview.html)
  - The FHIR (Fast Healthcare Interoperability Resources) Specification, which is a standard for exchanging healthcare information electronically.
  - This page provides an overview of the standard, and serves as a road map for first-time readers of the specification to help find your way around FHIR quickly.
- [Developer's introduction](http://hl7.org/fhir/R4/overview-dev.html)
  - This page is similar to the FHIR Overview above but targeted at developers
  - [Open Source Implementations and Code Libraries](https://confluence.hl7.org/display/FHIR/Open+Source+Implementations) This page lists known open source implementations of the FHIR specification.
  - [(or Clinical introduction)](http://hl7.org/fhir/R4/overview-clinical.html)
- [FHIR data types](http://hl7.org/fhir/R4/datatypes.html)
- [Using codes](http://hl7.org/fhir/R4/terminologies.html)
- [References between resources](http://hl7.org/fhir/R4/references.html)
- [How to read resource & profile definitions](http://hl7.org/fhir/R4/formats.html)
- [Base resource](http://hl7.org/fhir/R4/resource.html)
- [RESTful operations](http://hl7.org/fhir/R4/http.html)
- [Search](http://hl7.org/fhir/R4/search.html)
- Security
  - [SMART App Launch](https://build.fhir.org/ig/HL7/smart-app-launch/index.html) OAuth2 extension for context application launch.
