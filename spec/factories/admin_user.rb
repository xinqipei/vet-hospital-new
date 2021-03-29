# factory_bot allows you to generate valid one-off objects as needed, and you can
# dynamically send in data to override default
# attributes and create the variants that you need on a test-specific basis.

#create admin user requires email and password
FactoryBot.define do
  factory :admin_user do
    email { "admin@example.com" }
    password { "password" }
  end
end
