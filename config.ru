# frozen_string_literal: true

require 'bundler'
require 'grape'
require 'rack-timeout'
require 'rack/cors'
require 'rubygems'
require_relative 'config/rollbar'

Bundler.setup(:default)
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require 'dotenv'
Dotenv.load

use Rack::Cors do
  allow do
    origins(ENV['RACK_CORS_ORIGINS'] || '*')
    resource (ENV['RACK_CORS_RESOURCE'] || '*'),
             headers: :any,
             methods: %i[get post put delete patch options]
  end
end

# Gzip compression
use Rack::Deflater

require 'accountsws'
run AccountsWS::API

use Rack::Timeout, service_timeout: (ENV['WEB_TIMEOUT'].to_i || 30)
