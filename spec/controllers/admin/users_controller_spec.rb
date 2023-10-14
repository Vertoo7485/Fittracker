# frozen_string_literal: true

require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) do
    User.create(email: 'Test@example.com', name: 'Test',
                password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                weight: 85, growth: 183, years: 27, gender: 'male')
  end
  before do
    allow(controller).to receive(:require_authentication).and_return(true)
    allow(controller).to receive(:authorize_user!).and_return(true)
    allow(controller).to receive(:verify_authorized).and_return(true)
  end

  describe 'GET #index' do
    context 'when format is html' do
      it 'assigns @users and renders html template' do
        user1 = User.create(email: 'Marry@example.com', name: 'Marry',
                            password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                            weight: 85, growth: 183, years: 27, gender: 'female')
        user2 = User.create(email: 'Test@example.com', name: 'Test',
                            password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                            weight: 85, growth: 183, years: 27, gender: 'male')

        get :index, format: :html
        expect(assigns(:users)).to eq([user2, user1])
        expect(response).to render_template(:index)
      end
    end

    context 'when format is zip' do
      it 'enqueues UserBulkExportJob and redirects to index with success message' do
        user = User.create(email: 'Test@example.com', name: 'Test',
                           password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                           weight: 85, growth: 183, years: 27, gender: 'male')
        expect do
          get :index, format: :zip
        end.to have_enqueued_job(UserBulkExportJob)
        expect(flash[:success]).to eq(I18n.t('admin.users.index.success'))
        expect(response).to redirect_to(admin_users_path)
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the user' do
        patch :update, params: { id: user.id, user: { name: 'New Name' } }
        expect(user.reload.name).to eq('New Name')
      end

      it 'redirects to admin_users_path' do
        patch :update, params: { id: user.id, user: { name: 'New Name' } }
        expect(response).to redirect_to(admin_users_path)
      end

      it 'sets flash[:success] message' do
        patch :update, params: { id: user.id, user: { name: 'New Name' } }
        expect(flash[:success]).to eq(I18n.t('admin.users.update.success'))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        { email: 'Test@example.com', name: 'qwrqwr',
          password: 'pass', password_confirmation: 'pass',
          weight: 85, growth: 183, years: 27, gender: 'male' }
      end
      it 'renders the edit template' do
        patch :update, params: { id: user.id, user: invalid_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'POST #create' do
    context 'with archive parameter present' do
      let(:archive_file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'demo1.zip'), 'text/csv') }

      context 'when archive param is present' do
        before do
          post :create, params: { archive: archive_file }
        end
        it 'enqueues UserBulkImportJob' do
          have_enqueued_job(UserBulkImportJob)
        end

        it 'creates a blob with the uploaded file' do
          expect(ActiveStorage::Blob.last.filename.to_s).to eq('demo1.zip')
        end

        it 'sets the flash success message' do
          expect(flash[:success]).to eq(I18n.t('admin.users.create.success'))
        end

        it 'redirects to admin_users_path' do
          expect(response).to redirect_to(admin_users_path)
        end
      end
    end

    context 'when archive param is not present' do
      it 'does not enqueue UserBulkImportJob' do
        expect do
          post :create
        end.not_to have_enqueued_job(UserBulkImportJob)
      end

      it 'does not create a blob' do
        expect do
          post :create
        end.not_to change(ActiveStorage::Blob, :count)
      end

      it 'does not set the flash success message' do
        post :create
        expect(flash[:success]).to be_nil
      end

      it 'redirects to admin_users_path' do
        post :create
        expect(response).to redirect_to(admin_users_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, params: { id: user.id }
    end

    it 'deletes the user' do
      expect(User.exists?(user.id)).to be_falsey
    end

    it 'sets a flash message' do
      expect(flash[:success]).to eq(I18n.t('admin.users.destroy.success'))
    end

    it 'redirects to admin_users_path' do
      expect(response).to redirect_to(admin_users_path)
    end
  end
end
