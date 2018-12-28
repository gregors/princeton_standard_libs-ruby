# Princeton Standard Libs

I was going through the [Algorithms 4th edition](https://algs4.cs.princeton.edu/home/) and wanted to write the algorithms in ruby instead of the default java. The book uses the [Princeton Standard Libraries](https://introcs.cs.princeton.edu/java/stdlib/) to help clarify the code. 

This is a pure ruby port of that library. I plan to include everything except for the Standard Draw library - due to the complexity I am breaking that out into it's own gem [Standard Draw TK](https://github.com/gregors/standard_draw_tk) which uses Tck/Tk for the gui layer. I may add other toolkits in the future. 

Until this port is complete - For those willing to use Jruby can make use of the [jruby wrapper gem](https://rubygems.org/gems/princeton_standard_libraries) that lets you call the original java code with minimal pain.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'princeton_standard_libs-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install princeton_standard_libs-ruby

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gregors/princeton_standard_libs-ruby.

## License

The gem is available as open source under the terms of the [GNU General Public License, version 3 (GPLv3)](http://www.gnu.org/copyleft/gpl.html).
