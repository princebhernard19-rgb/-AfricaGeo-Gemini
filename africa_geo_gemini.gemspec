# frozen_string_literal: true

require_relative "lib/africa_geo_gemini/version"

Gem::Specification.new do |spec|
  spec.name          = "africa_geo_gemini"
  spec.version       = AfricaGeoGemini::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your_email@example.com"]

  spec.summary       = "An AI-powered geospatial engine for the African continent."
  spec.description   = "Leverages Google Gemini to provide topographical, political, and environmental insights across Africa, including a Geo-JSON generator."
  spec.homepage      = "https://github.com/yourusername/africa_geo_gemini"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yourusername/africa_geo_gemini"
  spec.metadata["changelog_uri"] = "https://github.com/yourusername/africa_geo_gemini/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # --- Dependencies ---
  
  # The official Google Gemini AI library
  spec.add_dependency "google-generative-ai", "~> 0.1"
  
  # For handling environment variables (.env)
  spec.add_dependency "dotenv", "~> 2.8"
  
  # For JSON parsing and validation
  spec.add_dependency "json", "~> 2.6"

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
