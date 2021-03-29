# create apointment will requires date and time
FactoryBot.define do
  factory :appointment do
    date { Time.now }
    time { Time.now }
  end
end
