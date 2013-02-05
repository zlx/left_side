LeftSide [![build status](https://secure.travis-ci.org/zlx/left_side.png)](https://travis-ci.org/zlx/left_side)
========


left_side is a smart tool to render sidebar for your rails app

Demo: ![left side demo](http://blog.zlxstar.me/images/left_side_demo.png)

## Installation

Add this line to your application's Gemfile:

    gem 'left_side'

And then execute:

    $ bundle

Then run:

    $ rails g left_side:install

## Usage

- require left-side in application.css

- add 
   ```ruby
   <aside class='span3'>
     <% if content_for? :nav_left %>
       <%= yield :nav_left %>
     <% else %>
       <%= render_left_side controller_name %>
     <% end %>
   </aside>
   <section class='span21'>
     <%= yield %>
   </section>
   ```
   to your layout

### Dependency

- cells

- bootstrap

### How to disable left_side in some special page

- in the action

```ruby
render :layout => false
```

### How to change the default left_side in some special page

- in the page

```ruby
<% content_for :nav_left do%>
  <%= render_left_side :tasks %>
<% end %>
```

*tasks is the top string in the section.yml*

### How to modify the stylesheet

+ run

    rails g left_side:stylesheet

+ modify *assets/stylesheets/left-side.css.scss*

## TODO

- use url_helper in yml file

- add section_hint command to valid the section config

- refactor the code

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Test

`rake test`
