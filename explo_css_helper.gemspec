# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'explo_css_helper'
  s.version     = '0.5.4'
  s.date        = '2018-01-05'
  s.summary     = "Helper methods for Explo's functional CSS classes"
  s.description = <<~DESC
    If you use Tachyons + work for Explo, you'll want these
    functional CSS classes to help you get the right fonts,
    colors, and components.
  DESC
  s.authors     = ['Donald L. Merand']
  s.email       = 'donald@explo.org'
  s.files       = Dir[
                    'lib/explo_css_helper.rb',
                    'lib/explo-css-styles-classes/explo_styles.json',
                    'README.markdown'
                  ]
  s.homepage    = 'https://bitbucket.org/explo/explo-css-helper'
  s.license     = 'MIT'
end
