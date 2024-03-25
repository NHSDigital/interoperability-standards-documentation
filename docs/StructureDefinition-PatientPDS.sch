<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile UKCorePatient
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Patient</sch:title>
    <sch:rule context="f:Patient">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/patient-birthPlace': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-BirthSex']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-BirthSex': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-cadavericDonor']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/patient-cadavericDonor': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactPreference']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactPreference': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-DeathNotificationStatus']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-DeathNotificationStatus': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-EthnicCategory']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-EthnicCategory': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ResidentialStatus']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ResidentialStatus': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-interpreterRequired']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/patient-interpreterRequired': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberUnavailableReason']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberUnavailableReason': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:name) &gt;= 1">name: minimum cardinality of 'name' is 1</sch:assert>
      <sch:assert test="count(f:birthDate) &gt;= 1">birthDate: minimum cardinality of 'birthDate' is 1</sch:assert>
      <sch:assert test="count(f:address) &gt;= 1">address: minimum cardinality of 'address' is 1</sch:assert>
      <sch:assert test="count(f:communication) &gt;= 1">communication: minimum cardinality of 'communication' is 1</sch:assert>
      <sch:assert test="count(f:communication) &lt;= 1">communication: maximum cardinality of 'communication' is 1</sch:assert>
      <sch:assert test="count(f:generalPractitioner) &gt;= 1">generalPractitioner: minimum cardinality of 'generalPractitioner' is 1</sch:assert>
      <sch:assert test="count(f:generalPractitioner) &lt;= 1">generalPractitioner: maximum cardinality of 'generalPractitioner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:identifier</sch:title>
    <sch:rule context="f:Patient/f:identifier">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:telecom/f:system</sch:title>
    <sch:rule context="f:Patient/f:telecom/f:system">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:birthDate</sch:title>
    <sch:rule context="f:Patient/f:birthDate">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-birthTime']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/patient-birthTime': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:contact</sch:title>
    <sch:rule context="f:Patient/f:contact">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactRank']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-ContactRank': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-CopyCorrespondenceIndicator']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-CopyCorrespondenceIndicator': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:contact/f:telecom/f:system</sch:title>
    <sch:rule context="f:Patient/f:contact/f:telecom/f:system">
      <sch:assert test="count(f:extension[@url = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem']) &lt;= 1">extension with URL = 'https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-OtherContactSystem': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:communication</sch:title>
    <sch:rule context="f:Patient/f:communication">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-proficiency']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/patient-proficiency': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:communication/f:extension</sch:title>
    <sch:rule context="f:Patient/f:communication/f:extension">
      <sch:assert test="count(f:extension[@url = 'level']) &lt;= 1">extension with URL = 'level': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:generalPractitioner</sch:title>
    <sch:rule context="f:Patient/f:generalPractitioner">
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Patient/f:generalPractitioner/f:identifier</sch:title>
    <sch:rule context="f:Patient/f:generalPractitioner/f:identifier">
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
