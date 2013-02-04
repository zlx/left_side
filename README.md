# LeftSide

left_side is a small tool to render sidebar for your rails app

demo
    ![left side demo](http://blog.zlxstar.me/images/left_side_demo.png)

## Installation

Add this line to your application's Gemfile:

    gem 'left_side'

And then execute:

    $ bundle

Then create config/left_side/section.yml [example](https://github.com/zlx/left_side/blob/master/lib/left_side/section.yml)

## Usage

1. require left-side in application.css

2. add 
   ```ruby
   <% if content_for? :nav_left %>
     <%= yield :nav_left %>
   <% else %>
     <%= render_left_side controller_name %>
   <% end %>
   ```
   to your layout

## TODO

1. add generate command to create section: copy example to left_side/section.yml

2. move css to app assets to make it modify

3. use url_helper in yml file

4. refactor the code

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Test

`rake test`