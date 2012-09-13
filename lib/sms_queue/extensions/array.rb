module SmsQueue
  module Extensions

    module Array
      def to_sms_recipients
        self.map {|item| item.to_sms_recipient }
      end
    end

  end
end

Array.send(:include, SmsQueue::Extensions::Array)