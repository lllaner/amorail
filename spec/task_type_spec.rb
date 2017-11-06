require "spec_helper"

describe Amorail::TaskType do
  before { mock_api }

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe ".attributes" do
    subject { described_class.attributes }

    it_behaves_like 'entity_class'

    specify do
      is_expected.to include(
                         :name,
                         :code,
                         :id
                     )
    end
  end

  describe "#params" do
    let(:task_type) do
      described_class.new(
          name: 'Mars',
          code: 321,
          id: 123
      )
    end

    subject { task_type.params }

    specify { is_expected.to include(:last_modified) }
    specify { is_expected.to include(name: 'Mars') }
    specify { is_expected.to include(code: 321) }
    specify { is_expected.to include(id: 123) }
  end
end
