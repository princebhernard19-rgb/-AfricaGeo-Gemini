# -AfricaGeo-Gemini
AfricaGeo Gemini is a high-performance Ruby gem that leverages Google's Gemini AI to act as a geospatial architect for the African continent. It doesn't just store data; it understands the topography, political boundaries, and environmental nuances of all 54 African nations.
🚀 Features
 * Intelligent Queries: Ask complex questions about African geography (e.g., "Which countries are intersected by the Great Rift Valley?").
 * The Geo-JSON Generator: Automatically converts natural language descriptions into valid GeoJSON objects for mapping.
 * Geospatial Guardrails: A built-in validation layer that ensures all coordinates generated fall strictly within the African continent's bounding box.
 * Regional Context: Specialized knowledge of African Union (AU) economic blocs like ECOWAS, SADC, and EAC.
Usage section:
client = AfricaGeoGemini::Client.new(api_key: "YOUR_KEY")
client.map("Victoria Falls") # Returns GeoJSON Point
