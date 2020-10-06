# frozen_string_literal: true

source 'https://rubygems.org'

ruby '~> 2.7.2'

gem 'dotenv', '~> 2.7.6'
gem 'grape', '~> 1.4.0'
gem 'grape-entity', '~> 0.8.1'
gem 'grape-swagger', '~> 1.3.0'
gem 'grape-swagger-entity', '~> 0.5.1'
gem 'json', '~> 2.3.1'
gem 'jwt', '~> 2.2.2'
gem 'logging', '~> 2.3.0'
gem 'multi_json', '~> 1.15.0'
gem 'oj', '~> 3.10.14'
gem 'oj_mimic_json', '~> 1.0.1'
gem 'rack-cors', '~> 1.1.1'
gem 'rack-timeout', '~> 0.6.0'
gem 'rake', '~> 13.0.1'
gem 'rollbar', '~> 3.0.0'
gem 'thor', '~> 1.0.1'

group :production do
  gem 'puma', '~> 5.0.2'
end

group :development, :test do
  gem 'foreman'
  gem 'pry'
  gem 'rbs'
  gem 'reek'
  gem 'rspec'
  gem 'rubocop'
  gem 'shotgun'
  gem 'steep'
  gem 'webmock'
end
