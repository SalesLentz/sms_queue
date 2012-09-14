# SmsQueue

Provides SMS mass mailing capability to your Ruby on Rails application. 
A batch job is splitted into single jobs for each recipient and pushed into a queue. 
The queue will be processed in background to not affect your applications response time. 
The final SMS sending will be done via an third-party SMS gateway

Processing the jobs in background is done with the help of [http://mperham.github.com/sidekiq](http://mperham.github.com/sidekiq). 
Please check the requirements of Sidekiq if you want to use this gem.


## Installation

Add this line to your application's Gemfile:

    gem 'sms_queue'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sms_queue

Now run the install generator

    $ bundle exec rails g sms_queue:install

to copy the needed migrations to `db/migrations`. After this you can migrate your database.


## Usage

You can start a new mass mailing by running `SmsQueue.send_mass_mailing(phone_numbers, message)`. Just provide an array of phone numbers as first, and the desired message as second parameter.


## Testing

All tests are written in RSpec, so if you checkout this gem from Github [https://github.com/SalesLentz/sms_queue](https://github.com/SalesLentz/sms_queue) you can run the tests with

    $ bundle exec rake


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
