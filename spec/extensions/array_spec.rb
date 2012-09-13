# -*- encoding : utf-8 -*-

require "spec_helper"


describe Array do

  context "#to_sms_recipients" do
    let(:first_sms_recipient) { double(SmsRecipient) }
    let(:first_string) do
      str = "12345"
      str.should_receive(:to_sms_recipient).and_return(first_sms_recipient)
      str
    end
    let(:second_sms_recipient) { double(SmsRecipient) }
    let(:second_string) do
      str = "12345"
      str.should_receive(:to_sms_recipient).and_return(second_sms_recipient)
      str
    end
    let(:array) { [first_string, second_string] }
    subject { array.to_sms_recipients }
    it { should have(2).sms_recipient }
    its(:first) { should eq first_sms_recipient }
    its(:last) { should eq second_sms_recipient }
  end

end
