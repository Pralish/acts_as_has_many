# ActsAsHasMany

[![CI](https://github.com/pralish/acts_as_has_many/workflows/Ruby/badge.svg)](https://github.com/Pralish/acts_as_has_many/actions)
[![Gem Version](https://badge.fury.io/rb/acts_as_has_many.svg)](https://badge.fury.io/rb/acts_as_has_many)
[![Coverage Status](https://coveralls.io/repos/github/Pralish/acts_as_has_many/badge.svg)](https://coveralls.io/github/Pralish/acts_as_has_many)

 ActsAsHasMany mimics a has_many association within an array stored in your ActiveRecord models. It provides a flexible way to define and manage custom associations using array attributes, without relying solely on standard ActiveRecord associations.  Additionally, it supports nested forms by mimicking accepts_nested_attributes_for.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add acts_as_has_many

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install acts_as_has_many

## Usage

Use the acts_as_has_many method to define custom array associations within your model:

```
class MyModel < ActiveRecord::Base
  acts_as_has_many :some_attribute
end
```

`some_attribute` is an attrubute with in your model, and is expected to return an Array. It could be of any type `jsonb`, `text`, etc.

The gem will look for a class with the same name as the attribute, eg. `RelatedObject` 

### Custom Class and OpenStruct

You can also specify custom class names for your associations.

```
class MyModel < ActiveRecord::Base
  acts_as_has_many :some_attribute, class_name: 'OtherClass'
end
```

If you prefer not to create a new class, you can use OpenStruct.

```
class MyModel < ActiveRecord::Base
  acts_as_has_many :some_attribute, class_name: 'OpenStruct'
end
```

### Custom Attribute

By default, ActsAsHasMany overrides the attribute getter and setter methods. If you prefer to use different attribute, you can specify a custom attribute using the :attribute option:

```
class MyModel < ActiveRecord::Base
  acts_as_has_many :some_attribute, attribute: :some_other_attribute
end
```

### Nested Form Atributes

ActsAsHasMany supports nested forms by mimicking accepts_nested_attributes_for, allowing you to work with nested attributes and create more complex forms with ease:

```
class MyModel < ActiveRecord::Base
  acts_as_has_many :some_attributes
  acts_as_accepts_nested_attributes_for :some_attributes
end
```

```
= f.fields_for :some_attributes, @model.some_attributes |ff|
  = ff.text_field :name
```

This combination enables you to use nested forms for some_attribute.

## Support and Contact

If you have any questions, issues, or feedback, please open an issue on the GitHub repository.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/acts_as_has_many. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Pralish/acts_as_has_many/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActsAsHasMany project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Pralish/acts_as_has_many/blob/main/CODE_OF_CONDUCT.md).
