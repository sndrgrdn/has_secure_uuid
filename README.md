# HasSecureUuid

HasSecureUuid provides an easy way to generate uniques random uuid's for any model in ruby on rails. **SecureRandom::uuid** is used to generate the unique id's, so collisions are highly unlikely.

**Note** If you're worried about possible collissions, there's a way to generate a race condition in the database in the same way that [validates_uniqueness_of](http://api.rubyonrails.org/classes/ActiveRecord/Validations/ClassMethods.html) can. You're encouraged to add an unique index in the database to deal with this even more unlikely scenario.

## Installation

Add this line to your application's Gemfile:

    gem 'has_secure_uuid'

And then run:

    $ bundle

Or install it yourself as:

    $ gem install has_secure_uuid

## Setting your Model

The first step is to generate a migration in order to add the token key field.

```ruby
rails g migration AddidentifierToUsers identifier:string
=>
   invoke  active_record
   create    db/migrate/20150424010931_add_identifier_to_users.rb
```

Then run `rake db:migrate` in order to update users table in the database. The next step is to add `has_secure_uuid`
 to the model:
```ruby
# Schema: User(identifier:string, uuid:string)
class User < ActiveRecord::Base
  has_secure_uuid
end

user = User.new
user.save
user.identifier # => "6c3d256c-aaa7-443a-a16b-75a99ecde277"
user.regenerate_identifier # => true
```

To use a custom column to store the uuid field you can specify the column_name option. See example above (e.g: uuid):

```ruby
# Schema: User(identifier:string, uuid:string)
class User < ActiveRecord::Base
  has_secure_uuid :uuid
end

user = User.new
user.save
user.uuid # => "6c3d256c-aaa7-443a-a16b-75a99ecde277"
user.regenerate_uuid # => true
```

## Running tests

Running

```shell
$ rake test
```

Should return

```shell
3 runs, 5 assertions, 0 failures, 0 errors, 0 skips
```

## Contributing

1. Fork it ( https://github.com/sndrgrdn/has_secure_uuid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
