
### References

- [IHE Patient Encounter Management](https://profiles.ihe.net/ITI/TF/Volume1/ch-14.html#14.5.2)
- <a href="HSCIC ITK HL7 V2 Message Specifications.pdf" target="_blank">NHS England (ADT) ITK HL7 v2 (2.4) Message Specification</a>

### Use Case

`Mrs Smith is being admitted to hospital following a referral by her GP Dr Townley of the Malton GP Practice. She arrives at York hospital by car, and is put under the care of Dr. Darwin, who also attends to Mrs Smith. Mrs Smith is admitted for an inpatient spell under the speciality General Medicine. She has a recorded allergy to an anaesthetic agent and has been diagnosed with stress incontinence. A colonic examination procedure is then performed.`

### HL7 v2 ADT_A04 Example

```
MSH|^~\&|PAS|RCB|ROUTE|ROUTE|201011011512||ADT^A04^ADT_A01|14038913245354|P|2.4||201011011512|||GBR|UNICODE|EN||iTKv1.0
EVN||201011011512|||111111111^Cortana^Emily^^Miss^^RCB55|201001111512
PID|1||3333333333^^^NHS||SMITH^FREDRICA^J^^MRS^^L|SCHMIDT^HELGAR^Y|196512131515|2|||29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H||+441234567890||EN|M|C22|||||A|Berlin|||GBR||DEU
PD1|||MALTON GP PRACTICE^^Y06601|G5612908^Townley^Gregory^^^Dr^^^GMC
NK1|2|SMITH^FRANCESCA^^^MRS^^L|16|29 WEST AVENUE^BURYTHORPE^MALTON^NORTH YORKSHIRE^YO32 5TT^GBR^H|+441234567890||||||||||1|196311111513||||EN
PV1|57|O|West Wing^RCB-AWRD^BED2^RCB55|13|||C3456789^Darwin^Samuel^^^Dr^^^GMC|G5612908^Townley^Gregory^^^Dr^^^GMC|C3456789^Darwin^Samuel^^^Dr^^^GMC|300||||19|||C3456789^Darwin^Samuel^^^Dr^^^GMC|OUTPATIENT|2141^^^VISITID|||||||||||||||||||||||||201011011600
AL1|1|DA|Z88.5|5||199807011755
PR1|56||U19.2^24 hour ambulatory electrocardiography^OPCS4||201011011512|D|1440|||||C3456789^Darwin^Samuel^^^Dr^^^GMC|C3
ZU1||2|C|201011011530||300||||1|||GP|2|201011011624|201011011620|02|Y|0
```

### HL7 FHIR Encounter Example

This resource has been converted from the above HL7 v2 example.

It is assumed that Fredrica Smith has been found on CPIS and so this resource is posted to CPIS. (POST /Encounter)

[Encounter Outpatient Fredrica Smith](Encounter-outpatient-fredrica-smith.html)



