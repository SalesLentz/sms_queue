module SmsQueue
  module Workers

    class MassMailingWorker
      include Sidekiq::Worker

      def perform(phone_numbers, message)
        puts "Doing hard work: #{phone_numbers} - #{message}"
      end
    end

  end
end
