require "active_model"
require 'sms_queue/extensions/base'
require 'sms_queue/mass_mailing'
require 'sms_queue/sms_recipient'
require 'sms_queue/version'


module SmsQueue

  def self.send_mass_mailing(phone_numbers, message)
    MassMailing.new_batch_job(phone_numbers, message)
  end

end
