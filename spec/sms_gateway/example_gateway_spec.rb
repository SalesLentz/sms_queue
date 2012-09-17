# -*- encoding: utf-8 -*-

require 'spec_helper'


# Example implementation of a SMS gateway to send SMS via a specific provider
# It should inherit from SmsGateway::Base to inherit the base functionallity.
# Because the necessary setup and delivery is different for each provider,
# it has to implement #self.setup and #deliver by its own.
#
#
class ExampleGateway < SmsGateway::Base
  require "cgi"
  mattr_accessor :username, :password, :url

  def self.setup
    yield self
  end

  def deliver
    # implement sms sending via the provider specific API here ...
    "#{url}/send_sms?username=#{username}&password=#{password}&message=#{CGI::escape(message)}&phone_number=#{CGI::escape(phone_number)}"
  end
end



# Don't forget to wirte tests for each gateway implementation !
#
#
describe ExampleGateway do
  let(:message) { "Hi Mom & Dad" }
  let(:phone_number) { "+3521234567890" }

  it "should inherit from SmsGateway::Base" do
    should be_kind_of(SmsGateway::Base)
  end

  it "should define its setup method" do
    expect { ExampleGateway.setup }.not_to raise_error(NotImplementedError)
  end

  context "configure gateway and deliver sms" do
    before do
      ExampleGateway.setup do |config|
        config.username = "admin"
        config.password = "secret"
        config.url = "https://url.to.gateway.example.com"
      end
    end
    subject { ExampleGateway.new_sms(message, phone_number) }
    its(:username) { should eq "admin"}
    its(:password) { should eq "secret"}
    its(:url) { should eq "https://url.to.gateway.example.com"}
    it "implemented #deliver with a dummy response without using any third-party API" do
      subject.deliver.should be_true
      subject.deliver.should eq "https://url.to.gateway.example.com/send_sms?username=admin&password=secret&message=Hi+Mom+%26+Dad&phone_number=%2B3521234567890"
    end
  end

end
