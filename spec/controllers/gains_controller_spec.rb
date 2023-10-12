require 'rails_helper'

RSpec.describe GainsController, type: :controller do
  let(:user) { User.create(email: 'Test@example.com', name: 'Test',
    password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
    weight: 85, growth: 183, years: 27, gender: 'male') }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new gain' do
        expect {
          post :create, params: { user_id: user.id, gain: { barbell_bench_press: 10, reverse_push_ups: 10,
                                          dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                          extension_with_rope_handle: 10, dumbbell_abduction: 10 } }
        }.to change(Gain, :count).by(1)
      end

      it 'sets a flash message' do
        post :create, params: { user_id: user.id, gain: { barbell_bench_press: 10, reverse_push_ups: 10,
                                          dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                          extension_with_rope_handle: 10, dumbbell_abduction: 10 } }
        
        expect(flash[:success]).to eq(I18n.t('gains.create.success'))
      end

      it 'redirects to the user page' do
        post :create, params: { user_id: user.id, gain: { barbell_bench_press: 10, reverse_push_ups: 10,
                                          dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                          extension_with_rope_handle: 10, dumbbell_abduction: 10 } }
        
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new gain' do
        expect {
          post :create, params: { user_id: user.id, gain: { barbell_bench_press: 10, reverse_push_ups: 10,
                                            dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                            extension_with_rope_handle: 10 } }
        }.not_to change(Gain, :count)
      end

      it 'renders the new template' do
        post :create, params: { user_id: user.id, gain: { barbell_bench_press: 10, reverse_push_ups: 10,
                                          dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                          extension_with_rope_handle: 10 } }
        
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:gain) { Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10,
                                           dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
                                           extension_with_rope_handle: 10, dumbbell_abduction: 10) }

    before do
      get :edit, params: { user_id: user.id, id: gain.id }
    end

    it 'assigns the requested gain to @gain' do
      expect(assigns(:gain)).to eq(gain)
    end

    it 'renders the edit template' do        
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH/PUT #update" do
    let(:gain) { Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10,
      dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
      extension_with_rope_handle: 10, dumbbell_abduction: 10) }

    context "with valid attributes" do
      let(:valid_attributes) { { barbell_bench_press: 15 } }

      before do
        patch :update, params: { user_id: user.id, id: gain.id, gain: valid_attributes }
      end

      it "updates the gain with the new parameters" do
        expect(gain.reload.barbell_bench_press).to eq(15)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update.success'))
      end

      it "redirects to the user path" do
        expect(response).to redirect_to(user_path(user))
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { { barbell_bench_press: ' ' } }
      before do
        request.env["HTTP_REFERER"] = "/previous_page"
        patch :update, params: { user_id: user.id, id: gain.id, gain: invalid_attributes }
      end

      it "does not update the gain" do
        gain.reload
        expect(gain.barbell_bench_press).not_to eq(15)
      end

      it "sets the danger flash message" do
        expect(flash[:danger]).to eq(I18n.t('gains.update.danger'))
      end

      it "redirects back to the previous page" do
        expect(response).to redirect_to(request.referer)
      end
    end
  end

  describe '#show' do
    let(:gain) { Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10,
      dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
      extension_with_rope_handle: 10, dumbbell_abduction: 10) }

    before do
      get :show, params: { user_id: user.id, id: gain.id }
    end

    it 'assigns the correct gain to @gain' do
      expect(assigns(:gain)).to eq(gain)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #destroy" do
    let(:gain) { Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10,
      dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
      extension_with_rope_handle: 10, dumbbell_abduction: 10) }

    before do
      delete :destroy, params: { user_id: user.id, id: gain.id }
    end

    it "destroys the gain record" do
      expect(Gain.exists?(gain.id)).to be_falsey
    end

    it "sets the success flash message" do
      expect(flash[:success]).to eq(I18n.t('gains.destroy.success'))
    end

    it "redirects to the user path" do
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe "PATCH/PUT #update_gain" do
    let(:gain) { Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10,
      dumbbell_bench_press: 10, push_ups_on_bars: 10, stacked_chest_press: 10,
      extension_with_rope_handle: 10, dumbbell_abduction: 10) }
    context "when complete_training is 'monday'" do
      before do
        allow(controller).to receive(:pump_gain_monday)
        put :update_gain, params: { complete_training: 'monday', user_id: user.id, id: gain.id }
      end
  
      it "updates monday_reps if it is less than or equal to 10" do
        expect(gain.reload.monday_reps).to eq(9)
      end

      it "updates monday_reps and pump_gain_monday if it is greater than 10" do
        gain.update(monday_reps: 11)
        put :update_gain, params: { complete_training: 'monday', user_id: user.id, id: gain.id }
        expect(gain.monday_reps).to eq(11)
        expect(controller).to have_received(:pump_gain_monday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'wednesday'" do
      before do
        allow(controller).to receive(:pump_gain_wednesday)
        put :update_gain, params: { complete_training: 'wednesday', user_id: user.id, id: gain.id }
      end

      it "updates wednesday_reps if it is less than or equal to 10" do
        expect(gain.reload.wednesday_reps).to eq(9)
      end

      it "updates wednesday_reps and pump_gain_wednesday if it is greater than 10" do
        gain.update(wednesday_reps: 11)
        put :update_gain, params: { complete_training: 'wednesday', user_id: user.id, id: gain.id }
        expect(gain.wednesday_reps).to eq(11)
        expect(controller).to have_received(:pump_gain_wednesday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'friday'" do
      before do
        allow(controller).to receive(:pump_gain_friday)
        put :update_gain, params: { complete_training: 'friday', user_id: user.id, id: gain.id }
      end

      it "updates friday_reps if it is less than or equal to 10" do
        expect(gain.reload.friday_reps).to eq(9)
      end

      it "updates friday_reps and pump_gain_friday if it is greater than 10" do
        gain.update(friday_reps: 11)
        put :update_gain, params: { complete_training: 'friday', user_id: user.id, id: gain.id }
        expect(gain.friday_reps).to eq(11)
        expect(controller).to have_received(:pump_gain_friday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'crossfit_monday'" do
      before do
        allow(controller).to receive(:pump_gain_crossfit_monday)
        put :update_gain, params: { complete_training: 'crossfit_monday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'crossfit_wednesday'" do
      before do
        allow(controller).to receive(:pump_gain_crossfit_wednesday)
        put :update_gain, params: { complete_training: 'crossfit_wednesday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'crossfit_friday'" do
      before do
        allow(controller).to receive(:pump_gain_crossfit_friday)
        put :update_gain, params: { complete_training: 'crossfit_friday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'tabat_monday'" do
      before do
        allow(controller).to receive(:pump_gain_tabat_monday)
        put :update_gain, params: { complete_training: 'tabat_monday', user_id: user.id, id: gain.id }
      end
  
      it "updates monday_tabat_reps if it is less than or equal to 40" do
        expect(gain.reload.monday_tabat_reps).to eq(35)
      end

      it "updates monday_tabat_reps and pump_gain_tabat_monday if it is greater than 40" do
        gain.update(monday_tabat_reps: 45)
        put :update_gain, params: { complete_training: 'tabat_monday', user_id: user.id, id: gain.id }
        expect(gain.monday_tabat_reps).to eq(45)
        expect(controller).to have_received(:pump_gain_tabat_monday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'tabat_wednesday'" do
      before do
        allow(controller).to receive(:pump_gain_tabat_wednesday)
        put :update_gain, params: { complete_training: 'tabat_wednesday', user_id: user.id, id: gain.id }
      end
  
      it "updates wednesday_tabat_reps if it is less than or equal to 40" do
        expect(gain.reload.wednesday_tabat_reps).to eq(35)
      end

      it "updates tabat_wednesday and pump_gain_tabat_wednesday if it is greater than 40" do
        gain.update(wednesday_tabat_reps: 45)
        put :update_gain, params: { complete_training: 'tabat_wednesday', user_id: user.id, id: gain.id }
        expect(gain.wednesday_tabat_reps).to eq(45)
        expect(controller).to have_received(:pump_gain_tabat_wednesday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'tabat_friday'" do
      before do
        allow(controller).to receive(:pump_gain_tabat_friday)
        put :update_gain, params: { complete_training: 'tabat_friday', user_id: user.id, id: gain.id }
      end
  
      it "updates friday_tabat_reps if it is less than or equal to 40" do
        expect(gain.reload.friday_tabat_reps).to eq(35)
      end

      it "updates tabat_friday and pump_gain_tabat_friday if it is greater than 40" do
        gain.update(friday_tabat_reps: 45)
        put :update_gain, params: { complete_training: 'tabat_friday', user_id: user.id, id: gain.id }
        expect(gain.friday_tabat_reps).to eq(45)
        expect(controller).to have_received(:pump_gain_tabat_friday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'cyrcles_monday'" do
      before do
        allow(controller).to receive(:pump_gain_cyrcles_monday)
        put :update_gain, params: { complete_training: 'cyrcles_monday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'cyrcles_wednesday'" do
      before do
        allow(controller).to receive(:pump_gain_cyrcles_wednesday)
        put :update_gain, params: { complete_training: 'cyrcles_wednesday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is 'cyrcles_friday'" do
      before do
        allow(controller).to receive(:pump_gain_cyrcles_friday)
        put :update_gain, params: { complete_training: 'cyrcles_friday', user_id: user.id, id: gain.id }
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('gains.update_gain.success'))
      end
    end

    context "when complete_training is not in the given cases" do
      it "does not call any pump methods when complete_training is not in the given cases" do
        allow(controller).to receive(:pump_gain_reps_monday)
        allow(controller).to receive(:pump_gain_monday)
        allow(controller).to receive(:pump_gain_reps_wednesday)
        allow(controller).to receive(:pump_gain_wednesday)
        allow(controller).to receive(:pump_gain_reps_friday)
        allow(controller).to receive(:pump_gain_friday)
        allow(controller).to receive(:pump_gain_crossfit_monday)
        allow(controller).to receive(:pump_gain_crossfit_wednesday)
        allow(controller).to receive(:pump_gain_crossfit_friday)
        allow(controller).to receive(:pump_gain_tabat_monday_reps)
        allow(controller).to receive(:pump_gain_tabat_monday)
        allow(controller).to receive(:pump_gain_tabat_wednesday_reps)
        allow(controller).to receive(:pump_gain_tabat_wednesday)
        allow(controller).to receive(:pump_gain_tabat_friday_reps)
        allow(controller).to receive(:pump_gain_tabat_friday)
        patch :update_gain, params: { complete_training: 'sunday', user_id: user.id, id: gain.id }
        expect(controller).not_to have_received(:pump_gain_reps_monday)
        expect(controller).not_to have_received(:pump_gain_monday)
        expect(controller).not_to have_received(:pump_gain_reps_wednesday)
        expect(controller).not_to have_received(:pump_gain_wednesday)
        expect(controller).not_to have_received(:pump_gain_reps_friday)
        expect(controller).not_to have_received(:pump_gain_friday)
        expect(controller).not_to have_received(:pump_gain_crossfit_monday)
        expect(controller).not_to have_received(:pump_gain_crossfit_wednesday)
        expect(controller).not_to have_received(:pump_gain_crossfit_friday)
        expect(controller).not_to have_received(:pump_gain_tabat_monday_reps)
        expect(controller).not_to have_received(:pump_gain_tabat_monday)
        expect(controller).not_to have_received(:pump_gain_tabat_wednesday_reps)
        expect(controller).not_to have_received(:pump_gain_tabat_wednesday)
        expect(controller).not_to have_received(:pump_gain_tabat_friday_reps)
        expect(controller).not_to have_received(:pump_gain_tabat_friday)
      end

      it "does not set the success flash message" do
        patch :update_gain, params: { complete_training: 'sunday', user_id: user.id, id: gain.id }
        expect(flash[:success]).to be_nil
      end

      it "redirects to the root path" do
        patch :update_gain, params: { complete_training: 'sunday', user_id: user.id, id: gain.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end