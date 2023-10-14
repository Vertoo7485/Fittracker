# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      let(:user) do
        User.create(email: 'Test@example.com', name: 'Test',
                    password: 'Passw0rd!', password_confirmation: 'Passw0rd!',
                    weight: 85, growth: 183, years: 27, gender: 'male')
      end

      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it 'signs in the user' do
        expect(controller.send(:current_user)).to eq(user)
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to be_present
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      before do
        post :create, params: { email: 'invalid@example.com', password: 'password' }
      end

      it 'does not sign in the user' do
        expect(controller.send(:current_user)).to be_nil
      end

      it 'sets a warning flash message' do
        expect(flash[:warning]).to be_present
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) do
      User.create(email: 'Test@example.com', name: 'Test',
                  password: 'Passw0rd!', password_confirmation: 'Passw0rd!',
                  weight: 85, growth: 183, years: 27, gender: 'male')
    end

    before do
      session[:user_id] = user.id
      delete :destroy
    end

    it 'signs out the user' do
      expect(controller.send(:current_user)).to be_nil
    end

    it 'sets a success flash message' do
      expect(flash[:success]).to be_present
    end

    it 'redirects to the root path' do
      expect(response).to redirect_to(root_path)
    end
  end
end
