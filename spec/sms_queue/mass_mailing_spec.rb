# -*- encoding: utf-8 -*-

require 'spec_helper'


module SmsQueue

  describe MassMailing do
    let(:message) { "Lorem ipsum "}
    let(:phone_numbers) { ("1".."10").to_a }

    context "#self.new_batch_job" do
      before { Workers::MassMailingWorker.stub(:perform_async => true) }
      
      it "should not raise an error" do
        expect { MassMailing.new_batch_job(phone_numbers, message) }.not_to raise_error
      end
      context "MassMailingWorker" do
        it "should start the mass mailing worker if it is valid" do
          Workers::MassMailingWorker.should_receive(:perform_async).with(phone_numbers, message).and_return(true)
          MassMailing.new_batch_job(phone_numbers, message)
        end
        it "should not start the mass mailing worker unless it is valid" do
          Workers::MassMailingWorker.should_not_receive(:perform_async)
          MassMailing.new_batch_job(nil, nil)
        end
      end
      context "return something like a MassMailing instance" do
        subject { MassMailing.new_batch_job(phone_numbers, message) }
        its(:message) { should eq message }
        its(:phone_numbers) { should eq phone_numbers }
        it { should be_valid }
      end
    end
    
    context "validations" do
      it { should validate_presence_of(:message) }
      it { should validate_presence_of(:phone_numbers) }
    end
    
    context "mass assignment security" do
      it { should_not allow_mass_assignment_of(:message) }
      it { should_not allow_mass_assignment_of(:phone_numbers) }
    end
  end

end
