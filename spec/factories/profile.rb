FactoryBot.define do
  factory :profile do
    first_name { "test"  }
    last_name { "user"  }
    age { 12 }
    dob { Time.now - 3.years }
    language { "english" }
    sex { "male" }
    phone { "000000000000000" }
    street { 'test steet' }
    city { "abc" }
    state { "xyz state" }
    zip { 12345677 }
  end
end