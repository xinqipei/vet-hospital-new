FactoryBot.define do
  factory :pet do
    name { "test pet" }
    age { 12 }
    medical_history { "xyz" }
    phone { "00000000000000000" }
  end
end