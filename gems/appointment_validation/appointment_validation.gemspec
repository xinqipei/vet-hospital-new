Gem::Specification.new do |s|
  s.name = 'appointment_validation'
  s.version = '0.1.0'
  s.date = '2021-03-26'
  s.summary = 'Appointments validations'
  s.author = 'XinqiPei'
  s.email = 'xinqipei@gmail.com'
  s.files = [
    'lib/appointment_validation.rb',
    'lib/appointment_validation/activerecord.rb',
    'lib/appointment_validation/activerecord/extension.rb',
  ]
  s.license = 'MIT'
  s.add_runtime_dependency 'rails', '>= 4.0'

end
