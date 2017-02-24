## FipExtractor 

[![Build Status](https://travis-ci.org/Rynaro/FipExtractor.svg?branch=master)](https://travis-ci.org/Rynaro/FipExtractor)
[![Gem Version](https://badge.fury.io/rb/fipextractor.svg)](https://badge.fury.io/rb/fipextractor)

FipExtractor is a easy-to-use translator of the FIPE API.

Actually FIPE only release the information about their vehicle market search on
your website. To get information generally you need to do many DOM manipulations,
with your user common behaviour (clicking in selects, and buttons).

FipExtractor is here for you! We consumes the FIPE API directly, and
translates the some parameters that have non-sense labels. Making this gem more useful for you.

### Install FipExtractor
---
FipExtractor is a gem builted.

``gem install fipextractor``  or ``gem 'fipextractor', '~> 0.0.1'``


### Using FipExtractor
---

FipExtractor only provides a easy way to consume FIPE informations, we don't create any
conversions to generate SQL, or another way to insert data into databases.
You can do this with the FipExtractor application result data.

We use the FIPE API, and with this information, we clearly need to work under their
API rules. FipExtractor provides a validator that shows to you if your request parameters
are malformed.

FipExtractor creates a huge and simple abstraction around API requests.

The API routes are:

|Route|Parameters|
|------|----------|
|reference_table|none|
|brand|reference_table_id, vehicle_type|
|model|reference_table_id, vehicle_type, brand_id|
|model_year|reference_table_id, vehicle_type, brand_id, model_id|
|model_through_year|reference_table_id, vehicle_type, brand_id, model_id, year, model_year|
|full|reference_table_id, vehicle_type, brand_id, model_id, year, model_year, fuel_type_id|

---
#### Building a request

````ruby
extractor = FipExtractor.new(:full, {reference_table_id: 189, vehicle_type: :car, brand_id: 3, model_id: 7, model_year: "1999", year: "1999", fuel_type_id: 1})
````

You only need to create your FipExtractor object, and fill the parameters ``method`` and ``parameters``

The ``method`` only accepts the Symbol reference.

The ``parameters`` only accepts a Hash. (optional on ``:reference_table`` method)

---
#### Checking the request parameters

FipExtractor allows to submit a request directly, or check your parameters. You can choose, if you will validate your parameters, or not.

Example of validation:

````ruby
extractor = FipExtractor.new(:brand, {reference_table_id: 189, vehicle_type: :truck})
validator = extractor.validate_parameters
if validator.is_ok?
  api = extractor.request
  api = api.send
  puts api.response
else
  puts validator.message
end
````

The validation layer is a object like everything in Ruby. Calling ``validate_parameters``, you automatic validate your parameters and generate a object with the ``is_ok?`` and ``message`` methods.

``is_ok?`` Returns a ``boolean``, if all parameters are OK, you get a ``true`` value here, otherwise a ``false`` value appears.

``message`` Returns an array of String with the parameters problems with the request method, if have one.

---
#### Getting the data

FipExtractor provides a friendly response data layout. All original API parameters are converted to a FipExtractor pattern. This pattern is more developer-like.

The original API response layout provides some JSON keys like ``Label`` and ``Value``. This patterns isn't a good pattern. FipExtractor converts these kind of parameters, in a specific Hash based on request method.

Getting data response:
````ruby
extractor = FipExtractor.new(:model, {reference_table_id: 189, vehicle_type: :truck, brand_id: 102})
api = extractor.request
api = api.send
puts api.response
````

Output:

````ruby
{:brand_name=>"AGRALE", :brand_id=>"102"}
{:brand_name=>"CHEVROLET", :brand_id=>"103"}
{:brand_name=>"CICCOBUS", :brand_id=>"121"}
{:brand_name=>"DAF", :brand_id=>"197"}
{:brand_name=>"EFFA-JMC", :brand_id=>"179"}
{:brand_name=>"FIAT", :brand_id=>"104"}
{:brand_name=>"FORD", :brand_id=>"105"}
{:brand_name=>"FOTON", :brand_id=>"191"}
{:brand_name=>"GMC", :brand_id=>"106"}
{:brand_name=>"HYUNDAI", :brand_id=>"181"}
{:brand_name=>"IVECO", :brand_id=>"122"}
{:brand_name=>"MAN", :brand_id=>"184"}
{:brand_name=>"MARCOPOLO", :brand_id=>"108"}
{:brand_name=>"MASCARELLO", :brand_id=>"196"}
{:brand_name=>"MAXIBUS", :brand_id=>"194"}
{:brand_name=>"MERCEDES-BENZ", :brand_id=>"109"}
{:brand_name=>"NAVISTAR", :brand_id=>"110"}
{:brand_name=>"NEOBUS", :brand_id=>"111"}
{:brand_name=>"PUMA-ALFA", :brand_id=>"112"}
{:brand_name=>"SAAB-SCANIA", :brand_id=>"113"}
{:brand_name=>"SCANIA", :brand_id=>"114"}
{:brand_name=>"SHACMAN", :brand_id=>"193"}
{:brand_name=>"SINOTRUK", :brand_id=>"166"}
{:brand_name=>"VOLKSWAGEN", :brand_id=>"115"}
{:brand_name=>"VOLVO", :brand_id=>"116"}
{:brand_name=>"WALKBUS", :brand_id=>"144"}
````
