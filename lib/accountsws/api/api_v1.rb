# frozen_string_literal: true

#require 'accountsws/controllers/accounts'
require 'grape'
require 'grape-entity'
require 'grape-swagger'
require 'grape-swagger-entity'

module AccountsWS
  ###
  # Version 1 of the API
  #
  class APIv1 < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json

    rescue_from :all do |errors|
      if errors.is_a?(Grape::Exceptions::Validation) ||
         errors.is_a?(Grape::Exceptions::ValidationErrors) ||
         errors.is_a?(Grape::Exceptions::InvalidMessageBody)
        error!(errors.message, 400)
      elsif ENV['RACK_ENV'] == 'production'
        Rollbar.error errors
        error!('The request could not be processed. '\
               'We apologize for the inconvenience. '\
               'Please try again later.', 500)
      else
        raise errors
      end
    end

    #mount AccountsWS::Controllers::Accounts

    add_swagger_documentation \
      mount_path: '/swagger', # produce the /swagger.json file
      doc_version: '1.0.0',   # Api Version
      info: {
        title: 'Music School Management\'s Account Services',
        description: 'A collection of professor & student accounts',
        contact_name: 'Stéphane FEUGA OSHIMA',
        contact_url: 'http://www.sfeuga.com',
        contact_email: 'sfeuga@member.fsf.org'
      }

    route :get, 'ping' do
      { ping: 'pong' }
    end

    route :any, '*path' do
      error!('Not found', 404)
    end
  end
end
