# -*- encoding : utf-8 -*-

require "spec_helper"


describe Object do
  let(:probe) { Object.new }

  context "#to_sms_recipients" do
    it { expect { probe.to_sms_recipients }.to raise_error("don't know how to convert #{probe.class} to SmsRecipient's: #{probe.inspect}") }
  end

  context "#to_sms_recipient" do
    it { expect { probe.to_sms_recipient }.to raise_error("don't know how to convert #{probe.class} to a SmsRecipient: #{probe.inspect}") }
  end

end
