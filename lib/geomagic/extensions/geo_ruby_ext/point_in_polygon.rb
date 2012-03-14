module Geomagic
	module Extensions
		module GeoRubyExt
			module PointInPolygon
				class GeoRuby::SimpleFeatures::Polygon
					
				  def includes? point
				    self.each do |linear_ring|
				      return true if linear_ring.contains_point? point
				    end
				    false
				  end
				  
				end

				class GeoRuby::SimpleFeatures::LinearRing
				 
				  def contains_point? point
				    return false if outside_bounding_box? point
				    i = -1
				    j = self.size-1
				    contains_point = false
				    while (i += 1) < self.size
				      a_point_on_polygon = self[i]
				      trailing_point_on_polygon = self[j]
				      if point_is_between_the_ys_of_the_line_segment?(point, a_point_on_polygon, trailing_point_on_polygon)
				        if ray_crosses_through_line_segment?(point, a_point_on_polygon, trailing_point_on_polygon)
				          contains_point = !contains_point
				        end
				      end
				      j = i
				    end
				    contains_point
				  end

				  private
				  
				    def point_is_between_the_ys_of_the_line_segment?(point, a_point_on_polygon, trailing_point_on_polygon)
				      (a_point_on_polygon.lat <= point.lat && point.lat < trailing_point_on_polygon.lat) || 
				      (trailing_point_on_polygon.lat <= point.lat && point.lat < a_point_on_polygon.lat)
				    end

				    def ray_crosses_through_line_segment?(point, a_point_on_polygon, trailing_point_on_polygon)
				      (point.lng < (trailing_point_on_polygon.lng - a_point_on_polygon.lng) * (point.lat - a_point_on_polygon.lat) / 
				      (trailing_point_on_polygon.lat - a_point_on_polygon.lat) + a_point_on_polygon.lng)
				    end
				  
				    def outside_bounding_box? point
				      bb_point_1, bb_point_2 = bounding_box
				      max_x = [bb_point_1.lng, bb_point_2.lng].max
				      max_y = [bb_point_1.lat, bb_point_2.lat].max
				      min_x = [bb_point_1.lng, bb_point_2.lng].min
				      min_y = [bb_point_1.lat, bb_point_2.lat].min

				      point.lng < min_x || point.lng > max_x || point.lat < min_y || point.lat > max_y
				    end
				end
			end
		end
	end
end