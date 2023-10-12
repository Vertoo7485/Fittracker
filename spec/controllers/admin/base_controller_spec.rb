require 'rails_helper'

RSpec.describe Admin::BaseController, type: :controller do
  controller(Admin::BaseController) do
    def index
      authorize(User)
      render plain: "Authorized"
    end
  end

  describe "GET #index" do
    context "when admin is authorized" do
      before do
        allow(controller).to receive(:authorize).and_return(true)
        get :index
      end

      it "renders the 'Authorized' message" do
        expect(response.body).to eq("Authorized")
      end
    end

    context "when admin is not authorized" do
      before do
        allow(controller).to receive(:authorize).and_raise(Pundit::NotAuthorizedError)
        get :index
      end

      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end

      it "sets the danger flash message" do
        expect(flash[:danger]).to eq(I18n.t('global.flash.not_authorized'))
      end
    end
  end
end