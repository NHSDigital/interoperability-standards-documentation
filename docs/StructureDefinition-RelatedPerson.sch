<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile UKCoreRelatedPerson
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:RelatedPerson</sch:title>
    <sch:rule context="f:RelatedPerson">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactPreference']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactPreference': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-CopyCorrespondenceIndicator']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-CopyCorrespondenceIndicator': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:active) &gt;= 1">active: minimum cardinality of 'active' is 1</sch:assert>
      <sch:assert test="count(f:relationship) &gt;= 1">relationship: minimum cardinality of 'relationship' is 1</sch:assert>
      <sch:assert test="count(f:relationship) &lt;= 1">relationship: maximum cardinality of 'relationship' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:RelatedPerson/f:telecom/f:system</sch:title>
    <sch:rule context="f:RelatedPerson/f:telecom/f:system">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
