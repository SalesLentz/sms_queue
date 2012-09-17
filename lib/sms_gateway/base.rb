module SmsGateway

  class Base
    include ActiveModel::Validations
    include ActiveModel::MassAssignmentSecurity

    attr_accessor :message, :phone_number, :status
    attr_accessible nil

    validates :message, :phone_number, :presence => true
    validates :status, :inclusion => { :in => %w(prepared) }

    def self.setup(*args)
      raise(NotImplementedError, 'You must implement #self.setup in a class inherited from SmsGateway::Base')
    end

    def self.new_sms(message, phone_number)
      gateway = self.new_in_prepared_state
      gateway.message = message
      gateway.phone_number = phone_number
      gateway
    end

    def deliver
      raise(NotImplementedError, 'You must implement #deliver in a class inherited from SmsGateway::Base to implement sms delivery for the selected SMS-Gateway')
    end
    
    
    private
    
    
    def self.new_in_prepared_state
      gateway = self.new
      gateway.status = "prepared"
      gateway
    end
  end

end