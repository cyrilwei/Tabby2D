Pod::Spec.new do |s|

  s.name         = "Tabby2D"
  s.version      = "0.1"
  s.summary      = "Tabby2D, a lightweight 2D game engine based on SpriteKit and GameplayKit, for iOS, tvOS and OS X"

  s.description  = <<-DESC
                  Tabby2D, a lightweight 2D game engine based on SpriteKit and GameplayKit, for iOS, tvOS and OS X. Still in early-alpha phase.
                   DESC

  s.homepage     = "https://github.com/cyrilwei/Tabby2D.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Cyril Wei"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/cyrilwei/Tabby2D.git", :tag => '0.1' }
  s.source_files = "Tabby2D/**/*.swift", "Tabby2D-TiledMap/**/*.swift"

  s.framework    = "SpriteKit"
  s.requires_arc = true

  s.dependency     "SwiftyJSON"
end
