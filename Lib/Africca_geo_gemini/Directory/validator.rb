# lib/africa_geo_gemini/validator.rb
module AfricaGeoGemini
  class Validator
    # Approximate bounding box for the African Continent
    LAT_RANGE = (-34.85..37.35)
    LNG_RANGE = (-17.55..51.46)

    def self.validate_geojson(geojson)
      points = extract_coordinates(geojson)
      
      # Ensure at least one coordinate is found and all are within bounds
      return false if points.empty?
      
      points.all? do |lng, lat|
        LAT_RANGE.cover?(lat) && LNG_RANGE.cover?(lng)
      end
    end

    private

    def self.extract_coordinates(json)
      case json["type"]
      when "Point"
        [json["coordinates"]]
      when "LineString", "MultiPoint"
        json["coordinates"]
      when "Polygon"
        json["coordinates"].flatten(1)
      when "Feature"
        extract_coordinates(json["geometry"])
      when "FeatureCollection"
        json["features"].flat_map { |f| extract_coordinates(f["geometry"]) }
      else
        []
      end
    end
  end
end
