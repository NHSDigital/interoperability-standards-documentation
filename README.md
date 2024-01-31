# instructions

Sushi require packages with snapshots - work around with UKCore is to follow these instructions

https://fshschool.org/docs/sushi/running/#structure-definition-is-missing-snapshot-error

Then run (windows only and on simplifier generated packages only)

fhir inflate --package fhir.r4.nhsengland.stu1
fhir inflate --package fhir.r4.ukcore.stu3.currentbuild
