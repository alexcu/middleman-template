# Lightweight Middleman Template

A simple static website template using [Middleman](http://middlemanapp.com) and can be hosted via [GitHub pages](https://pages.github.com).

You can template using [Ruby Slim](http://slim-lang.com/index.html) (default) or [ERB](http://www.stuartellis.eu/articles/erb/).

## Getting started

Start by ensuring you have ruby on your system. You may want to install [rbenv](https://github.com/rbenv/rbenv) to keep your ruby versions under control. Refer to rbenv's [installation guide](https://github.com/rbenv/rbenv#installation) on how to do so.

Then, install [bundler](http://bundler.io) to sort out your ruby dependencies:

```bash
$ [sudo] gem install bundler
$ bundle install
```

## Developing

Develop using:

```bash
$ middleman
```

Your website will be watched and hosted locally at **[http://localhost:4567/](http://localhost:4567/)**.

### ERB vs. Slim

By default, Slim templates are used - refer to `layouts/layout.slim`, `index.html.slim`.

You can optionally use ERB templates instead of Slim templates, however.

### Directory structure

#### `data`

Place all data `yml` files in here. You can then access them in any page.

Define your data file, e.g. `data/foo.yml`

```yaml
# foo.yml
shopping_list:
  default_price: 2.50
  items:
    - eggs
    - milk
    - coffee
```

Then use them in your slim templates:

```slim
// index.html.slim
h1 My shopping list:
ul
  = data.foo.shopping_list.each do | item |
    li= item
  = end
```

Or, if using ERB templates:

```erb
<!-- index.html.erb -->
<h1> My shopping list: </h1>
<ul>
  <% data.foo.shopping_list.each do | item | %>
  <li><%= item %></li>
  <% end %>
</ul>
```

#### `helpers`

Write helpers to be used in either your templates or `config.rb` here.

A sample one provided is a page title generator, that uses the website's sitemap to generate a title. E.g.: `foo/bar/qux.html` would generate a page title `Foo - Bar - Qux`.

#### `source`

Anything that is used on your website should be placed in here.

##### `fonts`

This is where any custom fonts live. By default, [FontAwesome](http://fontawesome.io) is included. You can use `icon_tag` to generate a FontAwesome icon:

```slim
= icon_tag "flag"          // 1x
= icon_tag "flag", size: 3 // 3x
```

##### `images`

Place any images you will use in here. You can then use them using the `image_tag` helper:

```slim
= image_tag "middleman.png"
```

##### `javascripts`

Place all JavaScript code in this folder, or in `main.js`.

##### `layouts`

Place all of your custom layouts in here.

##### `stylesheets`

Place all stylesheets in here, where:

- `modules` contain global styles, such as typography
- `partials` contain styles for specific sections

## Deploying

Deploy using:

```bash
$ rake deploy
```

## Custom Domains

If you have a custom domain you would like to use, instead of using a GitHub pages URL, update the CNAME file inside `source`
