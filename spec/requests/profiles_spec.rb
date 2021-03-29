require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  User.destroy_all
  let!(:user) { FactoryBot.create(:user) }
  describe "index" do
    context '' do
      before do
        sign_in user
        FactoryBot.create(:profile, user_id: user.id)

        get "/profiles"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "new" do
    context '' do
      before do
        sign_in user
        get "/profiles/new"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "create" do
    context '' do
      before do
        sign_in user
        profile_params = { first_name: 'test', last_name: 'user', age: 12, dob: Time.now,
                           language: 'english', sex: 'etc', phone: '12345345', street: 'abc xyz',
                           city: 'xyz', state: 'state xyz', zip: 1234, user_id: user.id }

        post "/profiles", params: {profile: profile_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Profile.count).to eql 1 }
    end
  end

  describe "edit" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)

        get "/profiles/#{profile.id}/edit"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "update" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        profile_params = { first_name: 'test', last_name: 'user', age: 12, dob: Time.now,
                           language: 'english', sex: 'etc', phone: '12345345', street: 'abc xyz',
                           city: 'xyz', state: 'state xyz', zip: 1234, user_id: user.id }

        put "/profiles/#{profile.id}", params: {profile: profile_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Profile.count).to eql 1 }
    end
  end

  describe "destroy" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)

        delete "/profiles/#{profile.id}"
      end

      it { expect(response).to have_http_status(302) }
    end
  end
end
