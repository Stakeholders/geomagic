require 'spec_helper'
require 'geo_ruby'

describe "PointInPolygon" do
  describe "Added point" do
    it "is in the polygon" do
      polygon = GeoRuby::SimpleFeatures::Polygon.from_coordinates([[[25.774252, -80.190262], [18.466465, -66.118292],[32.321384, -64.75737],[25.774252, -80.190262]]])
      polygon.includes?( GeoRuby::SimpleFeatures::Point.from_coordinates([25.774252, -70.190261]) ).should == true
    end

    it "is not in the polygon" do
      polygon = GeoRuby::SimpleFeatures::Polygon.from_coordinates([[[25.774252, -80.190262], [18.466465, -66.118292],[32.321384, -64.75737],[25.774252, -80.190262]]])
      polygon.includes?( GeoRuby::SimpleFeatures::Point.from_coordinates([25.774252, -65.190261]) ).should == false
    end

  end
end