# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CrossfitsController, type: :controller do
  let(:user) do
    User.create(email: 'Test@example.com', name: 'Test',
                password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                weight: 85, growth: 183, years: 27, gender: 'male')
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new crossfit' do
        expect do
          post :create, params: { user_id: user.id, crossfit: {
            front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
            kettlebell_pull_to_the_chin: 10, russian_twist: 10,
            plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
            deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
            barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
            cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
            seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
          } }
        end.to change(Crossfit, :count).by(1)
      end

      it 'sets a flash message' do
        post :create, params: { user_id: user.id, crossfit: {
          front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
          kettlebell_pull_to_the_chin: 10, russian_twist: 10,
          plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
          deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
          barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
          cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
          seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
        } }

        expect(flash[:success]).to eq(I18n.t('crossfits.create.success'))
      end

      it 'redirects to the user page' do
        post :create, params: { user_id: user.id, crossfit: {
          front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
          kettlebell_pull_to_the_chin: 10, russian_twist: 10,
          plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
          deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
          barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
          cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
          seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
        } }

        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new crossfit' do
        expect do
          post :create, params: { user_id: user.id, crossfit: {
            front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
            kettlebell_pull_to_the_chin: 10, russian_twist: 10,
            plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
            deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
            barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
            cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
            seated_leg_extension: 10, sumo_squats: 10
          } }
        end.not_to change(Crossfit, :count)
      end

      it 'renders the new template' do
        post :create, params: { user_id: user.id, crossfit: {
          front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
          kettlebell_pull_to_the_chin: 10, russian_twist: 10,
          plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
          deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
          barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
          cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
          seated_leg_extension: 10, sumo_squats: 10
        } }

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:crossfit) do
      Crossfit.create(
        user:, front_squat: 10, hang_grab: 10, overhead_press: 10,
        kettlebell_swing: 10, kettlebell_pull_to_the_chin: 10, russian_twist: 10, plank_with_kettlebell_pull: 10,
        trusters: 10, bent_over_barbell_pull: 10, deadlift: 10, mahi_dumbbells_through_the_sides: 10,
        dumbbell_layout: 10, barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
        cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
        seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
      )
    end

    before do
      get :edit, params: { user_id: user.id, id: crossfit.id }
    end

    it 'assigns the requested crossfit to @crossfit' do
      expect(assigns(:crossfit)).to eq(crossfit)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:crossfit) do
      Crossfit.create(
        user:, front_squat: 10, hang_grab: 10, overhead_press: 10,
        kettlebell_swing: 10, kettlebell_pull_to_the_chin: 10, russian_twist: 10, plank_with_kettlebell_pull: 10,
        trusters: 10, bent_over_barbell_pull: 10, deadlift: 10, mahi_dumbbells_through_the_sides: 10,
        dumbbell_layout: 10, barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
        cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
        seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
      )
    end

    context 'with valid attributes' do
      let(:valid_attributes) { { front_squat: 15 } }

      before do
        patch :update, params: { user_id: user.id, id: crossfit.id, crossfit: valid_attributes }
      end

      it 'updates the crossfit with the new attributes' do
        crossfit.reload
        expect(crossfit.front_squat).to eq(15)
      end

      it 'redirects to the user page' do
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { front_squat: ' ' } }

      before do
        patch :update, params: { user_id: user.id, id: crossfit.id, crossfit: invalid_attributes }
      end

      it 'does not update the crossfit' do
        crossfit.reload
        expect(crossfit.front_squat).not_to eq(15)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:crossfit) do
      Crossfit.create(
        user:, front_squat: 10, hang_grab: 10, overhead_press: 10,
        kettlebell_swing: 10, kettlebell_pull_to_the_chin: 10, russian_twist: 10, plank_with_kettlebell_pull: 10,
        trusters: 10, bent_over_barbell_pull: 10, deadlift: 10, mahi_dumbbells_through_the_sides: 10,
        dumbbell_layout: 10, barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
        cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
        seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
      )
    end

    before do
      delete :destroy, params: { user_id: user.id, id: crossfit.id }
    end

    it 'destroys the crossfit record' do
      expect(Crossfit.exists?(crossfit.id)).to be_falsey
    end

    it 'sets the success flash message' do
      expect(flash[:success]).to eq(I18n.t('crossfits.destroy.success'))
    end

    it 'redirects to the user path' do
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe '#show' do
    let(:crossfit) do
      Crossfit.create(
        user:, front_squat: 10, hang_grab: 10, overhead_press: 10,
        kettlebell_swing: 10, kettlebell_pull_to_the_chin: 10, russian_twist: 10, plank_with_kettlebell_pull: 10,
        trusters: 10, bent_over_barbell_pull: 10, deadlift: 10, mahi_dumbbells_through_the_sides: 10,
        dumbbell_layout: 10, barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
        cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
        seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
      )
    end

    before do
      get :show, params: { user_id: user.id, id: crossfit.id }
    end

    it 'assigns the correct crossfit to @crossfit' do
      expect(assigns(:crossfit)).to eq(crossfit)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'PUT #update_crossfit' do
    let(:crossfit) do
      Crossfit.create(
        user:, front_squat: 10, hang_grab: 10, overhead_press: 10,
        kettlebell_swing: 10, kettlebell_pull_to_the_chin: 10, russian_twist: 10, plank_with_kettlebell_pull: 10,
        trusters: 10, bent_over_barbell_pull: 10, deadlift: 10, mahi_dumbbells_through_the_sides: 10,
        dumbbell_layout: 10, barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
        cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
        seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10
      )
    end

    context "when complete_training is 'monday'" do
      before do
        allow(controller).to receive(:pump_crossfit_monday)
        put :update_crossfit, params: { complete_training: 'monday', user_id: user.id, id: crossfit.id }
      end

      it 'sets the success flash message' do
        expect(flash[:success]).to eq(I18n.t('crossfits.update_crossfit.success'))
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is 'wednesday'" do
      before do
        allow(controller).to receive(:pump_crossfit_wednesday)
        put :update_crossfit, params: { complete_training: 'wednesday', user_id: user.id, id: crossfit.id }
      end

      it 'sets the success flash message' do
        expect(flash[:success]).to eq(I18n.t('crossfits.update_crossfit.success'))
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is 'friday'" do
      before do
        allow(controller).to receive(:pump_crossfit_friday)
        put :update_crossfit, params: { complete_training: 'friday', user_id: user.id, id: crossfit.id }
      end

      it 'sets the success flash message' do
        expect(flash[:success]).to eq(I18n.t('crossfits.update_crossfit.success'))
      end

      it 'redirects to the root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when complete_training is not 'monday', 'wednesday', or 'friday'" do
      it 'does not set the success flash message' do
        put :update_crossfit, params: { complete_training: 'sunday', user_id: user.id, id: crossfit.id }
        expect(flash[:success]).to be_nil
      end

      it 'redirects to the root path' do
        put :update_crossfit, params: { complete_training: 'sunday', user_id: user.id, id: crossfit.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
