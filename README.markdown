# Explo CSS Helper

This is a Ruby module, which you can include in your classes, to return the appropriate CSS class definitions for a given HTML element.

In practice, you'll mostly use this inline in ERB code eg:

    #in index.html.erb
    <h1 class="<%= xc('h1') %>">Properly Formatted Header!</h1>
    ...etc


# Installation

In general, you'll want to add the following line to your `Gemfile`:

    gem 'explo_css_helper', git: 'git@bitbucket.org:explo/explo-css-helper.git'

(If your computer doesn't have read access to that URL, you'll need add your SSH key to this repo).


## Using with Rails

Typically, you just `include` this module in your `ApplicationHelper` in Rails:

    module ApplicationHelper
      include ExploCssHelper
      #... the rest of your application helper code
    end


## Using with Sinatra

At the top of your Sinatra file, just:

    require 'explo_css_helper'

Inside of your main Sinatra CSS class:

    class MySweetSinatraApp < Sinatra::Base
      include ExploCssHelper
      ...
    end
