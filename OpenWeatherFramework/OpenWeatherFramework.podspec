Pod::Spec.new do |spec|
  spec.name         = 'OpenWeatherFramework'
  spec.version      = '0.1.0'
  spec.authors      = { 
    'Faissal Faleh' => 'faisselfaleh@hotmail.fr'
  }
  spec.license      = { 
    :type => 'MIT',
    :file => 'LICENSE' 
  }
  spec.homepage     = 'https://github.com/fifo25/weather'
  spec.source       = { 
    :git => 'https://github.com/fifo25/weather.git',
    :branch => 'master',
    :tag => spec.version.to_s 
  }
  spec.summary      = 'PSA OpenWeather Framework'
  spec.source_files = '**/*.swift', '*.swift'
  spec.swift_versions = '5.0'
  spec.ios.deployment_target = '11.0'
end
