source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version'))[/(\d\.){2}\d/]

group :development, :test do
  gem 'rspec', '3.6.0'
  # Generate code coverate reports
  gem 'codeclimate-test-reporter', '~> 1.0.8', require: false
  gem 'codecov', '~> 0.1.10', require: false
  gem 'simplecov', '~> 0.13.0', require: false
end
