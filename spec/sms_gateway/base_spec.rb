# -*- encoding: utf-8 -*-

require 'spec_helper'


module SmsGateway

  describe Base do
    let(:message) { "Lorem ipsum" }
    let(:phone_number) { "003521234567890" }

    context "validations" do
      it { should validate_presence_of(:message) }
      it { should validate_presence_of(:phone_number) }
      it { should allow_value("prepared").for(:status) }
      it { should_not allow_value("other").for(:status) }
    end

    context "mass assignment security" do
      it { should_not allow_mass_assignment_of(:message) }
      it { should_not allow_mass_assignment_of(:phone_number) }
      it { should_not allow_mass_assignment_of(:status) }
    end

    context "#self.setup" do
      it "raise error that all inherited classes have to implement this method" do
        expect { Base.setup }.to raise_error(NotImplementedError, "You must implement #self.setup in a class inherited from SmsGateway::Base")
      end
    end

    context "#self.new_sms" do
      subject { Base.new_sms(message, phone_number) }
      its(:message) { should eq "Lorem ipsum" }
      its(:phone_number) { should eq "003521234567890" }
      its(:status) { should eq "prepared" }
      it { should be_valid }
    end

    context "#deliver" do
      subject { Base.new_sms(message, phone_number) }
      it "raise error that this method has to be implemented in class inherited from SmsGateway::Base to implement sms delivery for the selected SMS-Gateway" do
        expect { subject.deliver }.to raise_error(NotImplementedError, "You must implement #deliver in a class inherited from SmsGateway::Base to implement sms delivery for the selected SMS-Gateway")
      end
    end
  end

end
