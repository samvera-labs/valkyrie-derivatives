# frozen_string_literal: true
require 'spec_helper'
require 'valkyrie/derivatives/specs/shared_specs'

RSpec.describe Valkyrie::Derivatives::DerivativeService do
  it_behaves_like "a Valkyrie::Derivatives::DerivativeService"
  let(:valid_id) { Valkyrie::ID.new(SecureRandom.uuid) }
  let(:derivative_service) { described_class }
  it "can have a registered service" do
    new_service = instance_double(described_class, valid?: true)
    service_class = class_double(described_class, new: new_service)
    described_class.services << service_class
    expect(described_class.for(id: valid_id)).to eq new_service
  end
end
