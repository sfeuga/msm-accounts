# frozen_string_literal: true

require 'grape'
require 'accountsws/api/api_v1'

module AccountsWS
  ###
  # API of Accounts
  #
  class API < Grape::API
    mount APIv1
  end
end
