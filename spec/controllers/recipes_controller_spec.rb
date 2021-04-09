require 'spec_helper'

RSpec.describe RecipesController, type: :controller do
  describe '#index' do
    let(:action) { :index }

    context 'when success' do

      before do
        VCR.use_cassette('all_recipes') do
          get :index
        end
      end

      it 'returns status success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders page' do
        expect(response).to render_template(:index)
      end

      it 'sets recipies' do
        expect(assigns(:recipes)).to be_a(Contentful::Array)
      end
    end
    context 'when failure' do
      context 'when no connection could be made to contentful' do

        before do
          allow_any_instance_of(Contentful::Client).to receive(:entries).and_raise(HTTP::ConnectionError.new('no connection'))
          VCR.use_cassette('all_recipes') do
            get :index
          end
        end

        xit 'pushes error to errortracker' do

        end

        it 'recipes are empty' do
          expect(assigns(:recipes)).to be_empty
        end
      end
    end
  end
  describe '#show' do
    let(:id) { '4dT8tcb6ukGSIg2YyuGEOm' }

    context 'when success' do

      before do
        VCR.use_cassette(id) do
          get :show, params: { id: id }
        end
      end

      it 'returns status success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders page' do
        expect(response).to render_template(:show)
      end

      it 'sets recipe' do
        expect(assigns(:recipe)).to be_a(Contentful::Entry)
      end
    end
    context 'when failure' do
      context 'when recipe does not exist' do
        before do
          VCR.use_cassette(id) do
            get :show, params: { id: id }
          end
        end

        let(:id) { 'not_existing_recipe' }

        it 'redirects to recipes' do
          expect(response).to redirect_to(recipes_path)
        end

        it 'flashes message' do
          expect(subject.flash[:notice]).to eq("I'm sorry this recipe does not exist.")
        end
      end
      context 'when no connection could be made to contentful' do
        before do
          allow_any_instance_of(Contentful::Client).to receive(:entry).and_raise(HTTP::ConnectionError.new('no connection'))

          VCR.use_cassette(id) do
            get :show, params: { id: id }
          end
        end

        xit 'pushes error to errortracker' do

        end
        it 'recipe is nil' do
          expect(assigns(:recipe)).to be_nil
        end
      end
    end
  end
end
