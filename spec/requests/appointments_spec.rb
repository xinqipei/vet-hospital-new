require 'rails_helper'
# functional test cases
# with the appointment, before make an appontment, we need to create an user and make sure user is signed in

RSpec.describe "Appointments", type: :request do
  User.destroy_all
  let!(:user) { FactoryBot.create(:user) }
  describe "index" do
    context '' do
      before do
        sign_in user

        profile = FactoryBot.create(:profile, user_id: user.id)
        pet = FactoryBot.create(:pet, user_id: user.id )
        12.times do
          FactoryBot.create(:appointment, profile_id: profile.id, pet_id: pet.id, status: :completed )
        end

        get "/pets/#{pet.id}/appointments"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "new" do
    context '' do
      before do
        sign_in user
        pet = FactoryBot.create(:pet, user_id: user.id )
        get "/pets/#{pet.id}/appointments/new"
      end
      it { expect(response).to have_http_status(200) }
    end
  end

  describe "create" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        pet = FactoryBot.create(:pet, user_id: user.id )

        appointment_params = { profile_id: profile.id, date: Time.now, time: Time.now }

        post "/pets/#{pet.id}/appointments", params: {appointment: appointment_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Appointment.count).to eql 1 }
    end
  end

  describe "destroy" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        pet = FactoryBot.create(:pet, user_id: user.id )

        appointment = FactoryBot.create(:appointment, profile_id: profile.id, pet_id: pet.id )

        delete "/pets/#{pet.id}/appointments/#{appointment.id}"

      end
      it { expect(response).to have_http_status(302) }
    end
  end
end
