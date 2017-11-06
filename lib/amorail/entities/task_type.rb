require 'amorail/entities/leadable'

module Amorail
  class TaskType < Amorail::Entity
    include Leadable

    amo_names 'users'

    amo_field :name, :code, :id

    validates :name, presence: true

    def self.remote_url(name = '')
      '/private/api/v2/json/accounts/current/task_types'
    end

    def body_response(response)
      response.body['response']['account']
    end

    def params
      data = super
      data[:type] = 'task_types'
      data
    end
  end
end
