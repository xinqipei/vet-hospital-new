# frozen_string_literal: true

module AppointmentValidation
  module ActiveRecordExtension
    extend ActiveSupport::Concern
    included do
      validates :profile, presence: true
      validates :pet, presence: true

      validates_uniqueness_of :status,
                              scope: [:profile_id, :pet_id],
                              conditions: -> { where(status: :pending) },
                              message: 'This pet already waiting for appointment'
    end
  end
end
