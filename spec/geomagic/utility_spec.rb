require 'spec_helper'
require 'geo_ruby'

describe "Utility" do
  describe "polygon method" do
    it "retrives coordinates" do
      polygon = GeoRuby::SimpleFeatures::Polygon.from_coordinates([[[25.774252, -80.190262], [18.466465, -66.118292],[32.321384, -64.75737],[25.774252, -80.190262]]]) 
      polygon.to_coordinates.should == [[-80.190262, 25.774252], [-66.118292, 18.466465], [-64.75737, 32.321384], [-80.190262, 25.774252]]
    end

    
  end
end