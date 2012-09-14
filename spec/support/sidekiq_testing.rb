require 'sidekiq/testing'

RSpec.configure do |config|

  config.before(:suite) do
    SmsQueue::Workers::MassMailingWorker.jobs.clear
  end

  config.before(:each) do
    SmsQueue::Workers::MassMailingWorker.jobs.clear
  end

end