require 'sms_queue/extensions/array'
require 'sms_queue/extensions/object'
require 'sms_queue/extensions/string'
require 'sms_queue/mass_mailing'
require 'sms_queue/sms_recipient'
require 'sms_queue/version'


module SmsQueue

  def self.send_mass_mailing(phone_numbers, message)
    MassMailing.new_batch_job(phone_numbers, message)
  end

end
