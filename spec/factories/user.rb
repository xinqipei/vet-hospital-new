FactoryBot.define do
  #  required a signed user and do the rest of stuff which we created these method by using   gem 'factory_bot_rails'
  # and these method will be called in models and requests ,
  # this way will save us a lot time rather than create the method in every models and requests under spec folder
  factory :user do
    email { "test@test.com" }
    password { "12345678" }
    first_name { "test" }
    last_name { "user" }
  end
end
