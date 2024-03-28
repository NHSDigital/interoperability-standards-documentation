Profile: Subscription
Parent: http://hl7.org/fhir/StructureDefinition/Subscription
Id: Subscription
Description: "NHS England Subscription"

* criteria.extension contains
    http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria named filterCriteria 0..1
* channel.payload.extension contains
    http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content named payloadContent 0..1
