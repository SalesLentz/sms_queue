# -*- encoding: utf-8 -*-

require 'spec_helper'

describe SmsQueue do
  let(:mass_mailing) { double(SmsQueue::MassMailing) }
  let(:message) { "Lorem ipsum "}
  let(:phone_numbers) { ("1".."10").to_a }

  before { SmsQueue::MassMailing.stub(:new_batch_job => mass_mailing) }

  context "#self.send_mass_mailing" do
    it "should not raise an error" do
      expect { SmsQueue.send_mass_mailing(phone_numbers, message) }.not_to raise_error
    end
    it "should create a new MassMailing" do
      SmsQueue::MassMailing.should_receive(:new_batch_job).with(phone_numbers, message).and_return(mass_mailing)
      SmsQueue.send_mass_mailing(phone_numbers, message).should eq mass_mailing
    end
  end

end