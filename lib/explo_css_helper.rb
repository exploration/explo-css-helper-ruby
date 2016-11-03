# Helper methods for doing functional CSS in the Explo style
module ExploCssHelper
  CSS_CLASSES = {
    "btn" => "dib pv2 ph5 ba bw0 br1 x-bg-orange x-hover-bg-darkorange lh-copy tc f6 white pointer",
    "btn-gray" => "dib pv2 ph5 ba br1 x-b--coolgray bg-white x-hover-bg-palegray lh-copy tc f6 x-gray pointer",
    "btn-l" => "dib pv2 ph5 ph6-ns ba bw0 br1 x-bg-orange x-hover-bg-darkorange lh-copy tc f5 white pointer",
    "btn-l-gray" => "dib pv2 ph5 ph6-ns ba br1 x-b--coolgray bg-white x-hover-bg-palegray lh-copy tc f5 x-gray pointer",
    "btn-s" => "dib pv1 ph4 ba bw0 br1 x-bg-orange x-hover-bg-darkorange lh-copy tc f6 white pointer",
    "btn-s-gray" => "dib pv1 ph4 ba br1 x-b--coolgray bg-white x-hover-bg-palegray lh-copy tc f6 x-gray pointer",
    "fieldset" => "mt3 pv3 ph0 bn",
    "flash-alert" => "pa3 ba bw0 br1 x-bg-palered x-red",
    "flash-notice" => "pa3 ba bw0 br1 x-bg-palegreen x-green",
    "form" => "w5 pa3 br1 bn x-bg-palegray pa3",
    "form-wide" => "w6 pa4 br1 bn x-bg-palegray pa3",
    "h1" => "mt5 mb1 f2 f1-ns fw9 x-museo",
    "h2" => "mt4 mb1 f3 f2-ns fw7 sans-serif x-orange",
    "h3" => "mt3 mb1 f4 f3-ns fw6 sans-serif",
    "h4" => "mt2 mb1 f5 f4-ns fw5 sans-serif",
    "input-error-label" => "mt1 pa2 br1 bn x-bg-palered f6 lh-copy x-red",
    "input-text" => "input-reset w-100 pa2 ba br1 x-b--coolgray x-focus-b-orange x-on lh-copy",
    "input-text-narrow" => "input-reset db w-100 w5-ns pa2 ba br1 x-b--coolgray x-focus-b-orange x-on lh-copy",
    "label" => "db mb1 f6 x-coolgray",
    "lead" => "measure lh-copy f4",
    "legend" => "tc fw7",
    "link" => "link x-orange x-hover-darkorange pointer",
    "p" => "measure lh-copy f5 fw5",
    "select" => "input-reset w-100 pa2 ba br1 x-b--coolgray x-focus-b-orange x-on lh-copy pointer",
    "select-narrow" => "input-reset w-100 w5-ns pa2 ba br1 x-b--coolgray x-focus-b-orange x-on lh-copy pointer",
    "textarea" => "input-reset w-100 h4 pa2 ba br1 x-b--coolgray x-focus-b-orange x-on lh-copy"
  }
  HTML_STYLES = {
    "select" => "appearance: none; background:transparent; background: url(http://cdn.lab.explo.org/images/input_select_arrow.svg) 96% / 15% no-repeat #FFF;"
  }


  # Short for "eXplo css Class substitution"
  # Give it an HTML component name and it'll return the CSS classes necessary
  # to make that component happen. This is best for simpler components like
  # buttons, headers, etc.
  #
  # Example:
  #   >> xc('p')
  #   => "measure lh-copy f4"
  #
  # You can pass the following options in your "options" hash:
  #
  # Replace all instances of keys with values
  #     replace: {"key1" => "value1", "key2" => "value2"}
  # Add the given keys to the CSS string
  #     add: ["value1", "value2"]
  def xc(key, options={})
    string_update ExploCssHelper::CSS_CLASSES.fetch(key, ""), options
  end

  # Same as "xc", except that it returns HTML "style" attributes instead of CSS
  # classes
  def xs(key, options={})
    string_update ExploCssHelper::HTML_STYLES.fetch(key, ""), options
  end


  private

  # this does the work for xc() and xs(). See xc() for options.
  def string_update(string, options)
    local_string = string.clone
    
    # perform any passed substitutions
    options.fetch(:replace, {}).each do |key, value|
      local_string.gsub!(key, value)
    end

    # add any passed keys
    additions = options.fetch(:add, []).join(" ")
    local_string.concat(" " + additions) unless additions.empty?

    return local_string
  end
end
