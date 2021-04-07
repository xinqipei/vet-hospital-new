class ProfileForm
  include ActiveModel::Model
  include Virtus.model

  attribute :id, Integer
  attribute :first_name, String
  attribute :last_name, String
  attribute :age, Integer
  attribute :dob, DateTime
  attribute :language, String
  attribute :sex, String
  attribute :phone, String
  attribute :street, String
  attribute :city, String
  attribute :state, String
  attribute :zip, Integer
  attribute :user_id, Integer

  validates_presence_of :first_name, :last_name, :dob, :language, :sex,
                        :phone, :street, :city
  
  attr_reader :record

  def persist
   @record = id ? Profile.find(id) : Profile.new
   if valid?
    @record.attributes = attributes
    @record.age = Date.today.year - @record.dob.year
    @record.save!
    true
   else
    false
   end
  end
end
  