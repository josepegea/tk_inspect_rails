# TkInspectRails

Use [TkInspect](https://github.com/josepegea/tk_inspect) with Rails
applications.

At this time it provides:

- A custom inspector for `ActiveRecord::Relation`
- A panel to perform raw SQL queries

See [TkInspect](https://github.com/josepegea/tk_inspect) for more
details about using the environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tk_inspect_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tk_inspect_rails

## Usage

You need to add the `tk_inspect_rails` gem to your Rails project and
run `bundle install`.


After that you can launch the graphic console with Rails loaded with
this command.

    bundle exec tk_rails_console

Inside the console you should have access to all classes in your app,
including models.

**WARNING**: This is very much a work in progress. More documentation
to come!!

## Author

Josep Egea
  - <https://github.com/josepegea>
  - <https://www.josepegea.com/>

## Why this?

See [TkInspect](https://github.com/josepegea/tk_inspect).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/josepegea/tk_inspect_rails. This project is
intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TkComponent project’s codebases, issue
trackers, chat rooms and mailing lists is expected to follow the [code
of
conduct](https://github.com/josepegea/tk_inspect_rails/blob/master/CODE_OF_CONDUCT.md).
