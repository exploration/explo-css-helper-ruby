require 'json'

# Helper methods for doing functional CSS in the Explo style
module ExploCssHelper
  styles_path = File.join( File.dirname(__FILE__), '../explo-css-styles-classes/explo_styles.json' )
  GESTALT = JSON.parse(File.read(styles_path))
  CSS_CLASSES = GESTALT['classes']
  HTML_STYLES = GESTALT['styles']

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
