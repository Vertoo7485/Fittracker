require 'rails_helper'

RSpec.describe PowersController, type: :controller do
  let(:user) { User.create(email: 'Test@example.com', name: 'Test',
    password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
    weight: 85, growth: 183, years: 27, gender: 'male') }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new power' do
        expect {
          post :create, params: { user_id: user.id, power: { barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
            stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
            horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
            vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10,
            leg_press: 10, hamer_shoulder_press: 10, dumbbells_through_the_side: 10,
            lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10 } }
        }.to change(Power, :count).by(1)
      end

      it 'sets a flash message' do
        post :create, params: { user_id: user.id, power: { barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
          stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
          horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
          vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10,
          leg_press: 10, hamer_shoulder_press: 10, dumbbells_through_the_side: 10,
          lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10 } }
        
        expect(flash[:success]).to eq(I18n.t('powers.create.success'))
      end

      it 'redirects to the user page' do
        post :create, params: { user_id: user.id, power: { barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
          stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
          horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
          vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10,
          leg_press: 10, hamer_shoulder_press: 10, dumbbells_through_the_side: 10,
          lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10 } }
        
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new power' do
        expect {
          post :create, params: { user_id: user.id, power: { barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
            stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
            horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
            vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10,
            leg_press: 10, hamer_shoulder_press: 10, dumbbells_through_the_side: 10,
            lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10 } }
        }.not_to change(Power, :count)
      end

      it 'renders the new template' do
        post :create, params: { user_id: user.id, power: { barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
          stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
          horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
          vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10,
          leg_press: 10, hamer_shoulder_press: 10, dumbbells_through_the_side: 10,
          lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10 } }
        
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:power) { Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
      push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
      dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
      barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
      hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
      hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
      pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10) }

    before do
      get :edit, params: { user_id: user.id, id: power.id }
    end

    it 'assigns the requested power to @power' do
      expect(assigns(:power)).to eq(power)
    end

    it 'renders the edit template' do        
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:power) { Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
      push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
      dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
      barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
      hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
      hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
      pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10) }
      
    context 'with valid attributes' do
      let(:valid_attributes) { { barbell_bench_press: 15 } }
                              
      before do
        patch :update, params: { user_id: user.id, id: power.id, power: valid_attributes }
      end

      it 'updates the power with the new attributes' do
        power.reload
        expect(power.barbell_bench_press).to eq(15)
      end

      it 'redirects to the user page' do
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { barbell_bench_press: ' ' } }

      before do
        patch :update, params: { user_id: user.id, id: power.id, power: invalid_attributes }
      end

      it 'does not update the power' do
        power.reload
        expect(power.barbell_bench_press).not_to eq(15)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:power) { Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
      push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
      dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
      barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
      hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
      hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
      pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10) }

    before do
      delete :destroy, params: { user_id: user.id, id: power.id }
    end

    it "destroys the power record" do
      expect(Power.exists?(power.id)).to be_falsey
    end

    it "sets the success flash message" do
      expect(flash[:success]).to eq(I18n.t('powers.destroy.success'))
    end

    it "redirects to the user path" do
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe '#show' do
    let(:power) { Power.create(
      user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
      push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
      dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
      barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
      hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
      hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
      pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10
    ) }

    before do
      get :show, params: { user_id: user.id, id: power.id }
    end

    it 'assigns the correct power to @power' do
      expect(assigns(:power)).to eq(power)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe "PUT #update_power" do
    let(:power) { Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
      push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
      dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
      barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
      hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
      hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
      pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10, monday_reps: 8, wednesday_reps: 8,
      friday_reps: 8) }

    context "when complete_training is 'monday'" do
      before do
        allow(controller).to receive(:pump_power_monday)
        put :update_power, params: { complete_training: 'monday', user_id: user.id, id: power.id }
      end

      it "updates monday_reps if it is less than or equal to 10" do
        expect(power.reload.monday_reps).to eq(9)
      end

      it "updates monday_reps and pump_power_monday if it is greater than 10" do
        power.update(monday_reps: 11)
        put :update_power, params: { complete_training: 'monday', user_id: user.id, id: power.id }
        expect(power.monday_reps).to eq(11)
        expect(controller).to have_received(:pump_power_monday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('powers.update_power.success'))
      end

      it "redirects to the root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is 'wednesday'" do
      before do
        allow(controller).to receive(:pump_power_wednesday)
        put :update_power, params: { complete_training: 'wednesday', user_id: user.id, id: power.id }
      end

      it "updates wednesday_reps if it is less than or equal to 10" do
        expect(power.reload.wednesday_reps).to eq(9)
      end

      it "updates wednesday_reps and pump_power_wednesday if it is greater than 10" do
        power.update(wednesday_reps: 11)
        put :update_power, params: { complete_training: 'wednesday', user_id: user.id, id: power.id }
        expect(power.wednesday_reps).to eq(11)
        expect(controller).to have_received(:pump_power_wednesday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('powers.update_power.success'))
      end

      it "redirects to the root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is 'friday'" do
      before do
        allow(controller).to receive(:pump_power_friday)
        put :update_power, params: { complete_training: 'friday', user_id: user.id, id: power.id }
      end

      it "updates friday_reps if it is less than or equal to 10" do
        expect(power.reload.friday_reps).to eq(9)
      end

      it "updates friday_reps and pump_power_friday if it is greater than 10" do
        power.update(friday_reps: 11)
        put :update_power, params: { complete_training: 'friday', user_id: user.id, id: power.id }
        expect(power.friday_reps).to eq(11)
        expect(controller).to have_received(:pump_power_friday)
      end

      it "sets the success flash message" do
        expect(flash[:success]).to eq(I18n.t('powers.update_power.success'))
      end

      it "redirects to the root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is not 'monday', 'wednesday', or 'friday'" do
      it "does not update anything" do
        expect {
          put :update_power, params: { complete_training: 'sunday', user_id: user.id, id: power.id }
        }.not_to change { power.reload.monday_reps }
      end

      it "does not set the success flash message" do
        put :update_power, params: { complete_training: 'sunday', user_id: user.id, id: power.id }
        expect(flash[:success]).to be_nil
      end

      it "redirects to the root path" do
        put :update_power, params: { complete_training: 'sunday', user_id: user.id, id: power.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end