# frozen_string_literal: true
RSpec.shared_examples 'a Valkyrie::Derivatives::DerivativeService' do
  before do
    raise 'valid_id must be set with `let(:valid_id)`' unless
      defined? valid_id
    raise 'derivative_service must be set with `let(:derivative_service)`' unless
      defined? derivative_service
  end

  subject { derivative_service.new(id: valid_id) }

  it { is_expected.to respond_to(:create_derivatives).with(0).arguments }

  it { is_expected.to respond_to(:cleanup_derivatives).with(0).arguments }

  it { is_expected.to respond_to(:id) }

  describe "#valid?" do
    context "when given a resource it handles" do
      it { is_expected.to be_valid }
    end
  end

  it "takes an id as an argument" do
    obj = derivative_service.new(id: valid_id)
    expect(obj.id).to eq valid_id
  end
end
