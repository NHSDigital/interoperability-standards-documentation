# Introduction

The purpose of this page is to give a very brief introduction into Interoperability in Healthcare for those starting an Interoperability journey. 


The majority of the information below is taken from the book Principles of Health Interoperability: FHIR HL7 and SMOMED CT 2020 Tim Benson and Grahame Grieve.

## What is Interoperability?

The IEEE Computer Society defines interoperability as:

`“the ability of two or more systems or components to exchange information and to use the information that has been exchanged.”`

For the purposes of these pages, “system” refers to IT applications, devices and other technical solutions & components used in healthcare.

In the context of healthcare, it is the ability of different information systems, devices and applications (systems) to access, exchange, integrate and cooperatively use data in a coordinated manner, within and across organisational, regional and national boundaries, to provide timely and seamless portability of information and optimise the health of individuals and populations globally.

Health data exchange architectures, application interfaces and standards enable data to be accessed and shared appropriately and securely across the complete spectrum of care, within all applicable settings and with relevant stakeholders, including individual clinicians and patients.

### The Layers of Interoperability

#### Technical Interoperability (the technology layer):

Concerned with the process of making information available between System A and System B regardless of the type of data being shared (domain independent).




Refer to: APIs, Standards including HL7 FHIR and IHE, JSON, XML, HTTPS, TLS (Transport Layer Security) and OAuth sit in this layer as technologies that enable information exchange.

####  Semantic Interoperability (the data layer):

`"the ability to import utterances from another computer without prior negotiation and have your decision support, data queries and business rules continue to work reliably against these utterances."`
Dolin and Alschuler 2011

In other words the process of ensuring that each system can understand the information received from the other, it must ensure that information can be used and interpreted without ambiguity.
Critical to this is the need for aligning both terminology and data models (storing information using a common way of organising the stored data) .
This involves the use of specific coding and messaging schemes and is at the core of health and social care integration.
Semantic Interoperability is core to the success of health and social care interoperability programmes.




Refer to: Identifiers, Clinical coding SNOMED CT, Loinc, OpenEHR, ISO 13606 

#### Process Interoperability (the human layer):

Process interoperability is achieved when human beings share a common understanding across a network, business systems interoperate, and work processes are coordinated.
People obtain benefits when they use information originating elsewhere in their day-to-day work.



Refer to: IHE Profiles which describe how the technical interoperability supports process interoperability.

##### Clinical Interoperability

In health care we need to focus on clinical interoperability, which is a subset of process interoperability.  Clinical interoperability can be defined as: 
the ability for two or more clinicians in different care teams to transfer patients and provide seamless care to the patient. 
This requires changes in workflow and in the way clinicians and clinical systems function at a fine level of detail.

#### Institutional Interoperability:

Interoperability can save an enormous amount of duplication, waste and errors but relatively few of those responsible for commissioning and paying for health care yet understand enough about interoperability and what is required to achieve the business benefits. 

This is the institutional layer and involves culture, education, politics, regulation, information governance and incentives.

### Why health interoperability is hard?

#### Structured and coded data availability

Achieving semantic interoperability (the exchange of structured and coded data) requires that this data is available to be exchanged. Historically, much of the data in clinical systems is poorly structured or uses free text, and there is little standardisation of clinical processes, terms or code systems. Where new standards are applied, historical data is not usually re-coded or restructured, limiting the amount of information available for semantic exchange. 

#### Terminology

Healthcare is an exceptionally complex area covering multiple information levels with each clinical domain having their own specific sub-terminology.

Clinicians are no different from everyday people in that they communicate in ways that they and their immediate contacts understand. This does not necessarily translate across healthcare departments, regions, or internationally.

#### Clinical Safety

Interoperability in finance and other sectors has come on leaps and bounds but health interoperability deals with patients' lives and therefore more stringent governance tends to be put in place with regard to change management which leads to slower development.

#### Domain knowledge

Software developers don't understand clinical requirements and clinicians don't understand software development.

#### Vendors and software development

It is quicker and cheaper to develop a bespoke interface for an individual issue than a standards based interface for an domain area, e.g. it is easy to develop a lab management system for a single pathology lab it is much harder to develop a standards-based reporting system that all pathology labs can implement.

This is not specific to healthcare interoperability but each vendor that develops software for healthcare will be developing in their own unique way. This currently does not have to be developed in such a way to communicate with other systems i.e. be interoperable. In fact, some vendors see interoperability as a commercial threat and prefer to limit the amount of access to data from other systems, e.g. so that they can sell additional functionality add-ons and capabilities.

### The importance of Interoperability Standards

If every system adopted the same language and exchange patterns then interoperability would not be an issue
Interoperability Standards aim to collate these commonly used patterns and set out the best practice for vendors and developers to adopt in order to move closer to true interoperability

There are many benefits to improving interoperability through the adoption of standards in both Health and Care, such as:

 - Informed Decision Making - The right information available at the right time
 - Efficient Care - Reduce duplication, save time, share data
 - Person Level Data – For example maintenance of a Shared Care Record that is up-to-date, accurate and widely available
 - Improved Experience - By joining up care through different settings
 - Better data re-use - To inform research and developing trends (secondary purposes)

### The Interoperability Standards

[Interoperability Standards](interoperability-standards.html)

For further reading on the development and current state of Interoperability Standards.

### Dependencies

{% include dependency-table.xhtml %}

