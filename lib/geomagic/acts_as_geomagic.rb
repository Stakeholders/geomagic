module Geomagic
  module ActsAsGeomagic
    extend ActiveSupport::Concern
    
    included do
    end

    module ClassMethods
      def acts_as_geomagic

        include InstanceMethodsOnActivation

      end

    end

    module InstanceMethodsOnActivation
      
    end
  end
end

ActiveRecord::Base.send :include, Geomagic::ActsAsGeomagic