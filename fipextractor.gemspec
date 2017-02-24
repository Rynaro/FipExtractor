Gem::Specification.new do |s|
  s.name        = 'fipextractor'
  s.version     = '0.0.1'
  s.summary     = 'FipExtractor'
  s.description = 'Consume, and extract data about vehicles from FIPE API'
  s.authors     = ["Rynaro"]
  s.email       = 'iam@henriquelavezzo.com.br'
  s.homepage    = 'https://github.com/Rynaro/fipextractor'
  s.license     = 'MIT'

  s.add_dependency('unirest', '~> 1.1')

  s.add_development_dependency('minitest', '~> 5.10')
  s.add_development_dependency('rake')

  s.required_ruby_version = '~> 2.0'

  s.files       = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
