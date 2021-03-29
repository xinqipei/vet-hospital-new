require 'rails_helper'

RSpec.describe "Notes", type: :request do
  User.destroy_all
  let!(:user) { FactoryBot.create(:user) }
  #describe "index" do
  #  context '' do
  #    before do
  #      sign_in user
  #      profile = FactoryBot.create(:profile, user_id: user.id)
  #      12.times do
  #        FactoryBot.create(:note, profile_id: profile.id, user_id: user.id )
  #      end
  #
  #      get "/profiles/#{profile.id}/notes"
  #    end
  #
  #    it { expect(response).to have_http_status(200) }
  #  end
  #end

  describe "new" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)

        get "/profiles/#{profile.id}/notes/new"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "create" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        note_params = { user_id: user.id, message: "this is test message" }

        post "/profiles/#{profile.id}/notes", params: {note: note_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Note.count).to eql 1 }
    end
  end

  describe "edit" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        note = FactoryBot.create(:note, profile_id: profile.id, user_id: user.id )

        get "/profiles/#{profile.id}/notes/#{note.id}/edit"
      end

      it { expect(response).to have_http_status(200) }
    end
  end

  describe "update" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        note = FactoryBot.create(:note, profile_id: profile.id, user_id: user.id )
        note_params = { user_id: user.id, message: "this is test message edit" }

        put "/profiles/#{profile.id}/notes/#{note.id}", params: {note: note_params }

      end
      it { expect(response).to have_http_status(302) }
      it { expect(Note.count).to eql 1 }
    end
  end

  describe "destroy" do
    context '' do
      before do
        sign_in user
        profile = FactoryBot.create(:profile, user_id: user.id)
        note = FactoryBot.create(:note, profile_id: profile.id, user_id: user.id )

        delete "/profiles/#{profile.id}/notes/#{note.id}"
      end

      it { expect(response).to have_http_status(302) }
    end
  end
end
