# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'quick_insight'
  s.version       = '0.0.1'
  s.authors       = ['Stanley Shilov']
  s.email         = ['stanleyshilov@gmail.com']
  s.summary       = %q{Expose key data points from within your models as JSON endpoints}
  s.homepage      = 'https://github.com/shilov/quick_insight'

  s.require_paths = %w(lib app/controllers)
end
