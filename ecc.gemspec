Gem::Specification.new do |s|
  s.name        = 'ecc'
  s.version     = '0.0.0'
  s.date        = '2015-05-10'
  s.summary     = "ecc"
  s.description = "ecc"
  s.authors     = ["Benjamin Kanouse"]
  s.email       = 'kanobt61@gmail.com'
  s.files       = ["lib/ecc.rb"]
  s.homepage    = 'https://github.com/BenKanouse/ecc'
  s.license     = 'MIT'
  s.add_development_dependency 'guard-minitest', '~> 2.4', '>= 2.4.4'
  s.add_development_dependency 'guard', '~> 2.12', '>= 2.12.5'
  s.add_development_dependency 'minitest', '~> 5.6', '>= 5.6.1'
end
