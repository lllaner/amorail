require 'amorail/entities/leadable'

module Amorail
  class LeadStatus < Amorail::Entity
    amo_names 'leads_statuses'

    amo_field :name, :pipeline_id, :id

    validates :name, presence: true

    def self.remote_url(name = '')
      '/private/api/v2/json/accounts/current/leads_statuses'
    end

    def self.body_response(response)
      response.body['response']['account']
    end
  end
end
