# -*- encoding : utf-8 -*-

require "spec_helper"


module SmsQueue
  module Workers

    describe MassMailingWorker do
      let(:message) { "Lorem ipsum "}
      let(:phone_numbers) { ("003520001".."003520010").to_a }

      context "jobs" do
        it "increase job count by one for each new job" do
          expect { MassMailingWorker.perform_async(phone_numbers, message) }.to change { MassMailingWorker.jobs.size }.from(0).to(1)
        end
        it "process job without errors" do
          MassMailingWorker.perform_async(phone_numbers, message)
          expect { MassMailingWorker.drain }.not_to raise_error
        end
      end
    end

  end
end
