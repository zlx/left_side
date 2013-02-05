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

### dependency

- cells

- bootstrap

### how to disable left_side in some special page

- 在对应的 action 里面

    render :layout => false

- 在对应的页面里面

    <%= content_for :left_side %>
    <% end %>

### how to modify the stylesheet

+ 执行

    rails g left_side:stylesheet

+ 在 *assets/stylesheets/left-side.css.scss* 里面添加或者修改你自己的样式

## TODO

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
