# frozen_string_literal: true
module Valkyrie::Derivatives
  ##
  # Container for registering DerivativeServices.
  #
  # To add a new service:
  #   DerivativeService.services << MyDerivativeService
  class DerivativeService
    Hydra::Derivatives.source_file_service = Valkyrie::Derivatives::LocalFileService
    Hydra::Derivatives.output_file_service = Valkyrie::Derivatives::PersistDerivatives
    class_attribute :services
    self.services = []
    # Returns a derivative service for a change_set.
    # @param resource [Valkyrie::ChangeSet]
    # @return [Valkyrie::DerivativeService]
    def self.for(id:)
      services.map { |service| service.new(id: id) }.find(&:valid?) ||
        new(id: id)
    end
    attr_reader :id
    delegate :mime_type, :uri, to: :change_set
    # @param id [Valkyrie::ID]
    def initialize(id:)
      @id = id
    end

    # Deletes any derivatives generated.
    def cleanup_derivatives; end

    # Creates derivatives.
    def create_derivatives; end

    # Returns true if the given resource is valid for this derivative service.
    # @return [Boolean]
    def valid?
      true
    end
  end
end
