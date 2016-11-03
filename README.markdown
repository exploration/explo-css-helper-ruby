# Explo CSS Helper

This is a Ruby module, which you can include in your classes, to return the appropriate CSS class definitions for a given HTML element.

In practice, you'll mostly use this inline in ERB code:

    index.html.erb
    <h1 class="<%= xc('h1') %>">Properly Formatted Header!</h1>
    ...etc
