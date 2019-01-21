# FipExtractor

Unofficial client gem for FIPE vehicle table.

## Installation

Add this line in your Gemfile:

```ruby
gem 'fipextractor', '~> 1.0'
```

    $ bundle

Or

    $ gem install fipextractor

## Implemented Calls

- [ReferenceTable](#referencetable)
- [Brand](#brand)
- [Model](#Model)
- [ModelYear](#modelyear)
- [ModelThroughYear](#modelthroughyear)
- [Vehicle](#vehicle)

### ReferenceTable

```ruby
response = FipExtractor::ReferenceTable.new.call
response.all # array of reference tables id
```

### Brand

```ruby
response = FipExtractor::Brand.new(vehicle_type: :car, reference_table_id: 66).call
response.all # array of vehicle brands
```

### Model

```ruby
response = FipExtractor::Model.new(vehicle_type: :car, reference_table_id: 66, brand_id: 44).call
response.all # array of model and years
response.models # array of model hashes
response.years # array of year designated
```

### ModelYear

```ruby
response = FipExtractor::ModelYear.new(vehicle_type: :car, reference_table_id: 66, brand_id: 44, model_id: 1878).call
response.all # array of models with aging
```

### ModelThroughYear

```ruby
response = FipExtractor::ModelThroughYear.new(vehicle_type: :car, reference_table_id: 66, brand_id: 44, year: 1999, fuel: 1).call
response.all # array of models ordered by year, and/or fuel filter
```

### Vehicle

```ruby
response = FipExtractor::Vehicle.new(vehicle_type: :car, reference_table_id: 237, brand_id: 59, model_id: 2365, year: 1999, fuel: 3).call
response.details # detailed fipe information of vehicle
```

#### Vehicle Types

```ruby
  { car: 1, motorcycle: 2, truck: 3 }
```

### Tests

`rake spec`

### Console

`bundle console`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
