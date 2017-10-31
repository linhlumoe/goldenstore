require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'GET #index' do
    def do_request
      get :index
    end

    before { do_request }

    # it { expect(response).to render_template(:index) }

    it 'render template index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    def do_request
      post :create, category: category_params
    end

    context 'with valid attributes' do
      let(:category_params) { attributes_for(:category) }

      it 'create new category' do
        expect{do_request}.to change{Category.count}.from(0).to(1)
        expect(flash[:notice]).to eq 'Added category successfully.'
        expect(response).to redirect_to crawl_categories_categories_path
      end
    end

    context 'with invalid attributes' do
      let(:category_params) { { external_id: '' } }

      it 'create new category unsuccessfully' do
        expect{do_request}.to_not change{Category.count}
        expect(flash[:notice]).to eq 'Added category unsuccessfully.'
        expect(response).to redirect_to crawl_categories_categories_path
      end
    end
  end
end
