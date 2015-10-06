# rrssb-rails

This gem packages [rrssb](https://github.com/kni-labs/rrssb) for the Rails 3.2+ asset pipeline.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rrssb-rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rrssb-rails
```
## Usage

To start using the rrssb-rails plugin in your Rails application, enable it via the asset pipeline.

If your server is running, you will need to **restart Rails** before using the gem.

Add the following to your JavaScript manifest file (`application.js`):
```js
//= require rrssb
```

Add the following to your style sheet file:

If you are using SCSS, modify your `application.scss` file:
```scss
@import 'rrssb';
```

If you are using LESS, modify your `application.less` file,
If you're using plain CSS, modify your `application.css` file:
```css
*= require rrssb
```

### Helper

You can use the helper `rrssb_tag` to generate and customize your social share buttons inside your view.

```ruby
rrssb_tag(url: 'http://my_url.com', buttons: %w{facebook twitter google_plus})
# => Generate 3 responsive social share buttons for facebook, twitter and google+ in this order
```

For more information, see the dummy rails application available in `/test`.

## Tests

Run:
```bash
$ rake test
```

## Contributing

1. Fork it ( https://github.com/dam/rrssb-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
