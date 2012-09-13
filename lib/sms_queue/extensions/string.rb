module SmsQueue
  module Extensions

    module String
      def to_sms_recipient
        SmsRecipient.build_in_processed_status(self)
      end

      def to_sms_recipients
        [ self.to_sms_recipient ]
      end
    end

  end
end

String.send(:include, SmsQueue::Extensions::String)
