# -*- encoding : utf-8 -*-

require "spec_helper"


describe String do

  context "#to_sms_recipient" do
    let(:string) { "1234567890" }
    let(:sms_recipient) { double(SmsRecipient) }
    before { SmsRecipient.should_receive(:build_in_processed_status).with("1234567890").and_return(sms_recipient) }
    subject { string.to_sms_recipient }
    it { should eq sms_recipient }
  end

  context "#to_sms_recipients" do
    let(:string) { "1234567890" }
    let(:first_sms_recipient) { double(SmsRecipient) }
    before { string.should_receive(:to_sms_recipient).and_return(first_sms_recipient) }
    subject { string.to_sms_recipients }
    it { should have(1).sms_recipient }
    its(:first) { should eq first_sms_recipient }
  end

end
