module SmsQueue
  module Extensions

    module Object
      def to_sms_recipient(*args)
        raise "don't know how to convert #{self.class} to a SmsRecipient: #{self.inspect}"
      end

      def to_sms_recipients(*args)
        raise "don't know how to convert #{self.class} to SmsRecipient's: #{self.inspect}"
      end
    end

  end
end

Object.send(:include, SmsQueue::Extensions::Object)