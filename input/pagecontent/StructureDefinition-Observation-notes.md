### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1.  SHALL support searching using the combination of the patient and category search parameters:

    `GET [base]/Observation?patient={Type/}[id]&category={system|}social-history`

    Example:

    `GET [base]/Observation?patient=1134281&category=social-history`

    Implementation Notes: Fetches a bundle of all Observation resources for the specified patient and a category code = social-history (how to search by reference and how to search by token)


2. SHALL support searching using the combination of the patient and code search parameters:
   including optional support for OR search on code (e.g.code={system|}[code],{system|}[code],...)

   `GET [base]/Observation?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}`

   Example:

   `GET [base]/Observation?patient=1134281&code=http://loinc.org|[code]`

   Implementation Notes: Fetches a bundle of all Observation resources for the specified patient and observation code(s). SHOULD support search by multiple report codes. The Observation code parameter searches `Observation.code only. (how to search by reference and how to search by token)

3. SHALL support searching using the combination of the patient and category and date search parameters:
    - including support for these date comparators: gt,lt,ge,le
    - including optional support for AND search on date (e.g.date=[date]&date=[date]]&...)

   `GET [base]/Observation?patient={Type/}[id]&category={system|}social-history&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

   Example:

   `GET [base]Observation?patient=555580&category=social-history&date=ge2018-03-14T00:00:00Z`

   Implementation Notes: Fetches a bundle of all Observation resources for the specified patient and date and a category code = social-history (how to search by reference and how to search by token and how to search by date)


### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

SHOULD support searching using the combination of the patient and category and status search parameters:
including support for OR search on status (e.g.status={system|}[code],{system|}[code],...)
GET [base]/Observation?patient={Type/}[id]&category={system|}social-history&status={system|}[code]{,{system|}[code],...}

Example:

`GET [base]/Observation?patient=1134281&category=social-history&status=final`

Implementation Notes: Fetches a bundle of all Observation resources for the specified patient and category = social-history and status (how to search by reference and how to search by token)

SHOULD support searching using the combination of the patient and code and date search parameters:
including optional support for OR search on code (e.g.code={system|}[code],{system|}[code],...)
including support for these date comparators: gt,lt,ge,le
including optional support for AND search on date (e.g.date=[date]&date=[date]]&...)

`GET [base]/Observation?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

Example:

`GET [base]Observation?patient=555580&code=http://loinc.org|[code]&date=ge2019-01-01T00:00:00Z`

Implementation Notes: Fetches a bundle of all Observation resources for the specified patient and date and report code(s). SHOULD support search by multiple report codes. (how to search by reference and how to search by token and how to search by date)
