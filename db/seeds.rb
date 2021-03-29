# specialties = ["Allergy & Immunology", "Anesthesiology", "Dermatology", "Diagnostic Radiology", "Emergency Medicine", "Family Medicine", "Internal Medicine", "Medical Genetics", "Neurology", "Nuclear Medicine", "Obstetrics and Gynecology", "Opthamology", "Pathology", "Pediatrics", "Physical Medicine & Rehabilation", "Preventice Medicine", "Psychiatry", "Radiation Oncology", "Surgery", "Urology"]
# languages = ["English", "English", "English","Chinese", "Spanish"]
# sex = ["Male", "Female"]
# users = [2,3]

# @profiles = Profile.all
# @profiles.each do |p|
#   rand(1..7).times do
#     note = Note.create(
#       message: Faker::Lorem.paragraph_by_chars(300),
#       user_id: users.sample,
#       patient_id: p.id
#     )
#   end
# end


# 20.times do
#   pet = Pet.create(
#     name: Faker::Name.name,
#     specialty: specialties.sample,
#     phone: Faker::PhoneNumber.cell_phone,
#     school: Faker::Educator.university
#   )
#   rand(2...50).times do 
#     profile = Profile.create(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       dob: Faker::Date.birthday(18, 100),
#       age: nil,
#       language: languages.sample,
#       sex: sex.sample,
#       phone: Faker::PhoneNumber.cell_phone,
#       street: Faker::Address.street_name,
#       city: Faker::Address.city,
#       state: Faker::Address.state_abbr,
#       zip: Faker::Address.zip
#     )
#     rand(1...5).times do
#       Appointment.create(
#         date: Faker::Date.forward(60).to_date,
#         time: Faker::Time.forward(2, :morning),
#         patient_id: profile.id,
#         doctor_id: pet.id
#       )
#     end
#   end
# end

# @profiles = Profile.all
# @profiles.each do |p|
#     age = (Time.current.year - p.dob.year)
#     p.update(age: age)
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?