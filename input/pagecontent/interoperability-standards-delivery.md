
### Team Breakdown

This page assumes Interoperability Standards is broken down as follows

- UK Core and NHS England Implementation Guides (Team A)
- Administration and Clinical (Team B)
- Diagnostics, Medications and Workflow (Team C)

### TSAS Prior Success

This is the old NHS X and Digital teams working together before the merger to support the wider English NHS.

It is believed this is happening in the NHS based on feedback, it is not definitive (i.e. can be incorrect).

In this diagram several NHS X teams provided input (along with INTEROPen Care Connect Data Standards (FHIR Profiles)) to the IOPS NHS Digital team. 
It is believed both IOPS products were elaborated with the wider English NHS via either HL7 UK or INTEROPen.

<figure>{% include tsas-prior-success-delivery-gantt-with-ihe.svg %}</figure>
<br clear="all"/>

#### Post Exercise Report (PXR)

With respect to `Enterprise Architecture`
- NHS England HL7 v2 ADT was an English supplement to:
  - IHE PDQ Patient Demographic Query
  - IHE PIX Patient Identifer Cross Referencing
  - IHE PAM/PEM
- INTEROPen CareConnect RESTful API is an early version of:
  - IHE QEDm Query for Existing Data mobile (and influenced by US standards in this area)


### Success Mapped to current TSAS

Most of the teams involved in this success are now part of NHS England TSAS/TIS???

If we applied the same pipeline now we would get:

<figure>{% include tsas-overview-delivery-gantt-with-ihe.svg %}</figure>
<br clear="all"/>

In this diagram two `Interoperability Standards` teams are primarily after `Enterprise Standards` and also take in inputs the other `UK Core and NHS England Implementation Guides`. 

This is assuming that `English NHS Solutions` are the primary **customer** of `Interoperability Standards`.


### Pre TSAS Issues

Using `Transfer of Care` as an example, the prior delivery pipeline can be summarised as:

PRSB (Information Statdards) -> Platforms / Solution Architecture -> IOPS 

As can be seen from the diagram below this can result in issues, the main issue here is low adoption and the English NHS finding alternative solutions.

<figure>{% include tsas-prior-issues-delivery-gantt-with-ihe.svg %}</figure>
<br clear="all"/>

#### Post Exercise Report (PXR)

`Kettering XML` is an uncontrolled specification (which uses a MESH transport) which appears to meet English NHS **customer** requirements. If IOPS had been asked to standardise `Kettering XML`, the options include:

- IHE XDS - [ITI-41] Provide and Register Document Set 
- IHE MHD 
  - [ITI-65] Provide Document Bundle
  - [ITI-105] Simplified Document Publish
- HL7 v2 MDM_T02 (is used as an alternatvie to [ITI-41])

We are firmly back in `Enterprise Architecture` and focused around IHE XDS/MHD

It should also be noted that 
- NHS X Architecture introduced `National Record Locator`, which would be a more generic method of solving the initial `Transfer of Care` use case.
- English NHS Architecture (especially regional LHCRE) also tended towards Enterprise Architecture based roughly similar to both IHE XDS and MHD.

#### PXR Actions

Is looking quite clearly that `Interoperability Standards` should be based on `Enterprise Architecture` and not `Solutions Architecture`.

All the `English NHS - GREEN` paths have strong links to `Enterprise Architecture` 


### Relation to current Interoperability Standards Delivery

The conclusion would be:

> We should have a solid foundation from **Enterprise Architecture** which is probably IHE profile and HL7 FHIR framework based. 
> Working solely on **Solution Architecture** or **Products and Platforms** appears to be an **antipattern**
