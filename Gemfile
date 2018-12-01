source 'https://rubygems.org'

unless Gem.win_platform?
  ruby_version_file_path = File.join(File.dirname(__FILE__), '.ruby-version')
  ruby File.read(ruby_version_file_path)[/(\d\.){2}\d/]
end

group :development, :test do
  gem 'rspec', '3.7.0'
  # Generate code coverate reports
  gem 'codecov', '~> 0.1.10', require: false
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rubocop'
  gem 'rubocop', require: false
  gem 'simplecov', '~> 0.15.1', require: false
end
