module Geomagic
  module Extensions
    module GeoRubyExt
      module Utility
        class GeoRuby::SimpleFeatures::Polygon
          def to_coordinates
            _points = []
            self.rings.each do |points|
              points.each do |point|
                _points << [point.lat, point.lng]
              end 
            end
            _points
          end
          
          
          
        end
      end
    end
  end
end