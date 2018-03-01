# frozen_string_literal: true
require "valkyrie/derivatives/version"
require 'hydra/derivatives'
require 'valkyrie'

module Valkyrie
  module Derivatives
    require 'valkyrie/derivatives/local_file_service'
    require 'valkyrie/derivatives/persist_derivatives'
    require 'valkyrie/derivatives/derivative_service'
    require 'valkyrie/derivatives/file_characterization_service'
  end
end
