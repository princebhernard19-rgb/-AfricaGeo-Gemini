# lib/africa_geo_gemini/client.rb
require 'google_generative_ai'
require 'json'

module AfricaGeoGemini
  class Client
    SYSTEM_INSTRUCTION = <<~TEXT
      You are the Geo-JSON engine for the Africa Geography Gem. 
      Your task is to convert descriptions of African geography into valid GeoJSON.
      1. Use WGS 84 coordinates.
      2. For countries, use MultiPolygon; for landmarks, use Point; for rivers, use LineString.
      3. Return ONLY valid JSON. No conversational text or markdown blocks.
      4. If the location is outside Africa, return: {"error": "out_of_bounds"}.
    TEXT

    def initialize(api_key:)
      @client = GoogleGenerativeAI::Client.new(api_key: api_key)
    end

    def map(query)
      response = @client.generate_content(
        model: "gemini-1.5-flash",
        system_instruction: SYSTEM_INSTRUCTION,
        contents: [{ role: "user", parts: [{ text: "Generate GeoJSON for: #{query}" }] }]
      )

      begin
        raw_json = response.text.gsub(/```json|```/, '').strip
        data = JSON.parse(raw_json)

        if Validator.validate_geojson(data)
          data
        else
          { error: "Coordinates fall outside the African continent.", raw_data: data }
        end
      rescue JSON::ParserError
        { error: "Failed to parse AI response into valid JSON." }
      end
    end

    def ask(question)
      # A general method for non-map geography questions
      @client.generate_content(
        model: "gemini-1.5-flash",
        system_instruction: "You are an expert in African Geography. Answer concisely.",
        contents: [{ role: "user", parts: [{ text: question }] }]
      ).text
    end
  end
end
