source 'https://rubygems.org'

ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version'))[/(\d\.){2}\d/]

group :development, :test do
  gem 'rspec', '3.7.0'
  # Generate code coverate reports
  gem 'codecov', '~> 0.1.10', require: false
  gem 'simplecov', '~> 0.15.1', require: false
  gem 'rubocop', require: false
  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-bundler'
end
