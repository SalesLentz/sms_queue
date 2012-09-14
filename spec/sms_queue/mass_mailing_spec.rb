# -*- encoding: utf-8 -*-

require 'spec_helper'

module SmsQueue

  describe MassMailing do
    let(:phone_numbers) { ("1".."10").to_a }
    let(:message) { "Lorem ipsum "}

    context "#self.new_batch_job" do
      it "should not raise an error" do
        expect { MassMailing.new_batch_job(phone_numbers, message) }.not_to raise_error
      end
    end
  end

end
