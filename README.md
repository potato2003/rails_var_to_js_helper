# RailsVarToJsHelper
Pass the Rails variable to JavaScript

## Usage
```
<%== pass_to_js_tag({a: 1, b: "str"}) %>

#=> 
# <script>
#   window.a = 1;
#   window.b = "str";
# </script>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_var_to_js_helper'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_var_to_js_helper
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
