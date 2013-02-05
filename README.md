# LeftSide

[<img src="https://secure.travis-ci.org/zlx/left_side.png" />](https://travis-ci.org/zlx/left_side)


left_side is a small tool to render sidebar for your rails app

demo
    ![left side demo](http://blog.zlxstar.me/images/left_side_demo.png)

## Installation

Add this line to your application's Gemfile:

    gem 'left_side'

And then execute:

    $ bundle

Then run:

    $ rails g left_side:install

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

- move css to app assets to make it modify

- use url_helper in yml file

- refactor the code

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Test

`rake test`
