# ChineseNumber

Convert integers to Traditional Chinese financial numerals, such as the
uppercase characters commonly used on Taiwan banking and accounting documents.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chinese_number'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install chinese_number

## Usage

```ruby
require 'chinese_number'

ChineseNumber.convert(2_131_231)
# => "貳佰壹拾參萬壹仟貳佰參拾壹元整"

ChineseNumber.convert('0010001')
# => "壹萬零壹元整"
```

`nil` returns `nil`. Non-integer input raises `ArgumentError`.

## Ruby on Rails

Add the gem to your Rails application's `Gemfile`:

```ruby
gem 'chinese_number'
```

Then install it:

```bash
bundle install
```

Rails loads gems from the bundle automatically, so you can call it from models,
controllers, helpers, jobs, or views:

```ruby
ChineseNumber.convert(10_001)
# => "壹萬零壹元整"
```

Example controller usage:

```ruby
class InvoicesController < ApplicationController
  def show
    @invoice = Invoice.find(params[:id])
    @total_in_chinese = ChineseNumber.convert(@invoice.total_cents / 100)
  end
end
```

Example view usage:

```erb
<%= ChineseNumber.convert(@invoice.total_amount) %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jct808/chinese_number. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
