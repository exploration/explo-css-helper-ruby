Gem::Specification.new do |s|
  s.name        = 'explo_css_helper'
  s.version     = '0.4.3'
  s.date        = '2017-03-10'
  s.summary     = "Helper methods for Explo's functional CSS classes"
  s.description = "If you use Tachyons + work for Explo, you'll want these functional CSS classes to help you get the right fonts, colors, and components."
  s.authors     = ['Donald L. Merand']
  s.email       = 'donald@explo.org'
  s.files       = ["lib/explo_css_helper.rb",
                  "explo-css-styles-classes/explo_styles.json"]
  s.require_paths = ["lib","explo-css-styles-classes"]
  s.homepage    = 'https://bitbucket.org/explo/explo-css-helper'
  s.license       = 'MIT'
end
