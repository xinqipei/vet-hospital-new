require 'rails_helper'

RSpec.describe "Pets", type: :request do
  User.destroy_all
  let!(:user) { FactoryBot.create(:user) }
  describe "index" do
    context '' do
      before do
        sign_in user
        FactoryBot.create(:pet, user_id: user.id )

        get "/pets"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "new" do
    context '' do
      before do
        sign_in user
        get "/pets/new"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "create" do
    context '' do
      before do
        sign_in user
        pet_params = { name: 'test', age: 12, medical_history: 'abc xyz', user_id: user.id }

        post "/pets", params: {pet: pet_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Pet.count).to eql 1 }
    end
  end

  describe "edit" do
    context '' do
      before do
        sign_in user
        pet = FactoryBot.create(:pet, user_id: user.id )

        get "/pets/#{pet.id}/edit"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "update" do
    context '' do
      before do
        sign_in user
        pet = FactoryBot.create(:pet, user_id: user.id )
        pet_params = { name: 'test', age: 12, medical_history: 'abc xyz edit', user_id: user.id }

        put "/pets/#{pet.id}", params: {pet: pet_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Pet.count).to eql 1 }
    end
  end

  describe "destroy" do
    context '' do
      before do
        sign_in user
        pet = FactoryBot.create(:pet, user_id: user.id )

        delete "/pets/#{pet.id}"
      end

      it { expect(response).to have_http_status(302) }
    end
  end
end
