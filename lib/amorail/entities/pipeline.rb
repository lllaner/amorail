module Amorail
  class Pipeline < Amorail::Entity
    amo_names 'pipelines'

    amo_field :id, :label, :sort, :name

    validates :name, presence: true

    def merge_params(attrs)
      attrs.last.each do |k, v|
        action = "#{k}="
        next unless respond_to?(action)
        send(action, v)
      end
      self
    end
  end
end
