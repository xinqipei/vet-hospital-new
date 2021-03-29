class Appointment < ApplicationRecord
  belongs_to :profile
  belongs_to :pet
  include AppointmentValidation::ActiveRecordExtension

  enum status: { pending: 0, completed: 1 }
end
