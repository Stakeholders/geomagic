require "geomagic/version"

# Requires
require "rails"
require "active_support/dependencies"
require "active_record"
require "action_controller"

require "geokit-rails"
require "geocoder"
require 'geo_ruby'

# require "geomagic/point_in_polygon"
require "geomagic/extensions"
require 'geomagic/acts_as_geomagic'

module Geomagic
  def self.setup
    yield self
  end
end

# Require our engine
require "geomagic/engine"
