# frozen_string_literal: true
module Valkyrie::Derivatives
  # Abstract base class for file characterization
  # registers file characterization service a ValkyrieFileCharacterization service
  # initializes the interface for file characterization
  # @since 0.1.0
  class FileCharacterizationService
    class_attribute :services
    self.services = []
    # initializes the file characterization service
    # @param file_set [FileNode] the FileNode to be characterized
    # @param persister [AppendingPersister] the Persister used to save the FileNode
    # @return [TikaFileCharacterizationService] the file characterization service, currently only TikaFileCharacterizationService is implemented
    def self.for(file_set:, persister:)
      services.map { |service| service.new(file_set: file_set, persister: persister) }.find(&:valid?) ||
        new(file_set: file_set, persister: persister)
    end
    attr_reader :file_set, :persister
    delegate :mime_type, :height, :width, :checksum, to: :file_set
    def initialize(file_set:, persister:)
      @file_set = file_set
      @persister = persister
    end

    # characterizes the file_set passed into this service
    # Default options are:
    #   save: true
    # @param save [Boolean] should the persister save the file_set after Characterization
    # @return [FileNode]
    def characterize(save: true)
      persister.save(resource: @file_set) if save
      @file_set
    end

    # Stub function that sets this service as valid for all FileNode types
    def valid?
      true
    end
  end
end
