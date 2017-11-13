require 'amorail/entities/leadable'

module Amorail
  class TaskType < Amorail::Entity
    amo_names 'task_types'

    amo_field :name, :code, :id

    validates :name, presence: true

    def self.remote_url(name = '')
      '/private/api/v2/json/accounts/current/task_types'
    end

    def self.body_response(response)
      response.body['response']['account']
    end
  end
end
