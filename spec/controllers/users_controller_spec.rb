require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { user: { email: 'Test@example.com', name: 'Test',
                                     password: 'Passw0rd!', password_confirmation: 'Passw0rd!',
                                     weight: 85, growth: 183, years: 27, gender: 'male' } } }

      it "creates a new user" do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)
      end

      it "signs in the user" do
        post :create, params: valid_params
        expect(controller.send(:current_user)).to eq(User.last)
      end

      it "sets a success flash message" do
        post :create, params: valid_params
        expect(flash[:success]).to eq(I18n.t('users.create.success',
           name: controller.send(:current_user).name_or_email))
      end

      it "redirects to the root path" do
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { user: { email: 'wegweg', name: '',
                                       password: 'dfq', password_confirmation: 'dfq' } } }

      it "does not create a new user" do
        expect {
          post :create, params: invalid_params
        }.not_to change(User, :count)
      end
      
      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let(:user) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }
    
    before do
      allow(controller).to receive(:require_authentication).and_return(true)
      allow(controller).to receive(:authorize_user!).and_return(true)
    end
  
    it "assigns a edit User to @user" do
      get :edit, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
    
    it 'renders the edit template' do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    let(:user) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }
    
    before do
      allow(controller).to receive(:require_authentication).and_return(true)
      allow(controller).to receive(:authorize_user!).and_return(true)
    end

    context 'with valid params' do
      let(:valid_params) { { email: 'Test@example.com', name: 'New Name',
        password: 'Passw0rd!', password_confirmation: 'Passw0rd!',
        old_password: 'Passw0rd!',
        weight: 85, growth: 183, years: 27, gender: 'male' } }

      it 'updates the user' do
        patch :update, params: { id: user.id, user: valid_params }
        user.reload
        expect(user.name).to eq('New Name')
      end

      it 'redirects to the edit user page' do
        patch :update, params: { id: user.id, user: valid_params }
        expect(response).to redirect_to(edit_user_path(user))
      end

      it 'sets a flash success message' do
        patch :update, params: { id: user.id, user: valid_params }
        expect(flash[:success]).to eq(I18n.t('users.update.success'))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { email: 'Test@example.com', name: 'New Name',
        password: 'pass', password_confirmation: 'pass',
        weight: 85, growth: 183, years: 27, gender: 'male' } }

      it 'does not update the user' do
        patch :update, params: { id: user.id, user: invalid_params }
        user.reload
        expect(user.name).not_to eq('test')
      end

      it 'renders the edit template' do
        patch :update, params: { id: user.id, user: invalid_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  context 'when user is not logged in' do
    let(:user) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }
    it 'redirects to the login page' do
      patch :update, params: { id: user.id, user: { name: 'New Name' } }
      expect(response).to redirect_to(request.referer || root_path)
    end
  end

  describe "GET #show" do
    let(:user) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }
    
    before do
      allow(controller).to receive(:require_authentication).and_return(true)
      allow(controller).to receive(:authorize_user!).and_return(true)
      get :show, params: { id: user.id }
    end

    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq(user)
    end

    it "assigns a new power to @power" do
      expect(assigns(:power)).to be_a_new(Power)
    end

    it "assigns all powers of the user to @powers in descending order" do
      powers = [
        Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
          barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
          hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
          hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
          pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10, id: 1),
        Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
          barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
          hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
          hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
          pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10, id: 2),
        Power.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
          barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
          hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
          hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
          pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10, id: 3)
      ]
            expect(assigns(:powers)).to eq(powers.reverse)
    end

    it "assigns a new crossfit to @crossfit" do
      expect(assigns(:crossfit)).to be_a_new(Crossfit)
    end

    it "assigns all crossfits of the user to @crossfits in descending order" do
      crossfits = [
        Crossfit.create(user: user, front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
          kettlebell_pull_to_the_chin: 10, russian_twist: 10,
          plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
          deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
          barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
          cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
          seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10, id: 1),

        Crossfit.create(user: user, front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10, id: 2),

        Crossfit.create(user: user, front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
          kettlebell_pull_to_the_chin: 10, russian_twist: 10,
          plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
          deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
          barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
          cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
          seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10, id: 3)
      ]
            expect(assigns(:crossfits)).to eq(crossfits.reverse)
    end

    it "assigns a new gain to @gain" do
      expect(assigns(:gain)).to be_a_new(Gain)
    end

    it "assigns all gains of the user to @gains in descending order" do
      gains = [
        Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, id: 1),

        Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, id: 2),

        Gain.create(user: user, barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
          push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
          dumbbell_abduction: 10, id: 3)
      ]
            expect(assigns(:gains)).to eq(gains.reverse)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end
  end
end