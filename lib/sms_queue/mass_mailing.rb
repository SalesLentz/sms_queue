module SmsQueue

  class MassMailing
    include ActiveModel::Validations
    include ActiveModel::MassAssignmentSecurity

    attr_accessor :message, :phone_numbers
    attr_accessible nil

    validates :message, :phone_numbers, :presence => true

    def self.new_batch_job(phone_numbers, message)
      mm = MassMailing.new
      mm.message = message
      mm.phone_numbers = phone_numbers
      mm.start_mass_mailing_worker_if_valid!
      mm
    end
    
    def start_mass_mailing_worker_if_valid!
      Workers::MassMailingWorker.perform_async(self.phone_numbers, self.message) if valid?
    end
  end

end