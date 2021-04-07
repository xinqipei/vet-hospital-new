class PetForm
  include ActiveModel::Model
  include Virtus.model

  attribute :id, Integer
  attribute :name, String
  attribute :age, String
  attribute :medical_history, String
  attribute :phone, String
  attribute :user_id, Integer

  validates_presence_of :name, :age, :medical_history
  
  attr_reader :record

  def persist
   @record = id ? Pet.find(id) : Pet.new
   if valid?
    @record.attributes = attributes
    @record.save!
    true
   else
    false
   end
  end
end
  