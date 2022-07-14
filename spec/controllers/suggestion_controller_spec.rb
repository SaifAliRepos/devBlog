require 'rails_helper'

RSpec.describe SuggestionsController, type: :controller do
  describe 'before actions' do
    describe 'set_suggestion' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_suggestion)
      end
    end
  end

  describe 'GET #index' do
    before do
      get :index, params: { post_id: 1 }
    end

    it 'is expected to assign suggestion instance variable' do
      expect(assigns[:suggestions]).to eq(Suggestion.all)
    end
  end

  describe 'GET #new' do
    before do
      get :new, params: { post_id: 1 }
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:suggestion]).to be_instance_of(Suggestion)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  describe 'GET #edit' do
    before do
      # something that you want to execute before running `it` block
      get :edit, params: params
    end

    context 'when post id is valid' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: suggestion.post_id } }

      it 'is expected to set post instance variable' do
        expect(assigns[:suggestion]).to eq(Suggestion.find_by(id: params[:id]))
      end

      it 'is expected to set user instance variable' do
        expect(assigns[:suggestion]).to eq(Suggestion.find_by(post_id: params[:post_id]))
      end

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(200)
      end
    end

    context 'when params are not correct' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: suggestion.post_id, find: '' } }

      it 'is expected to name render :edit' do
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'GET #show' do
    before do
      # something that you want to execute before running `it` block
      get :show, params: params
    end

    context 'when post id is valid' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: suggestion.post_id } }

      it 'is expected to set post instance variable' do
        expect(assigns[:suggestion]).to eq(Suggestion.find_by(id: params[:id]))
      end

      it 'is expected to set user instance variable' do
        expect(assigns[:suggestion]).to eq(Suggestion.find_by(post_id: params[:post_id]))
      end

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(200)
      end
    end

    context 'when params are not correct' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: 2, find: '' } }

      it 'is expected to name render :edit' do
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'PATCH #update' do
    before do
      # something that you want to execute before running `it` block
      patch :update, params: params
    end

    context 'when user exist in database' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: suggestion.post_id, suggestion: { find: 'Hello' } } }
      # let(:post) { FactoryBot.create :post }
      # let(:params) { { id: post.id, post: { name: 'First Post' } } }

      context 'when data is provided is valid' do
        it 'is expected to update user' do
          expect(suggestion.reload.find).to eq('Hello')
        end

        it 'is_expected to redirect_to users_path' do
          expect(response.status).to eq(302)
        end

        it 'is expected to set flash message' do
          expect(flash[:notice]).to eq('Suggestion was successfully updated.')
        end
      end

      context 'when data is invalid' do
        let(:post) { FactoryBot.create :post }
        let(:suggestion) { FactoryBot.create :suggestion }
        let(:params) { { id: suggestion.id, post_id: suggestion.post_id, suggestion: { find: '' } } }

        it 'is expected not to update user name' do
          expect(suggestion.reload.find).not_to be_empty
        end

        it 'is expected to render edit template' do
          is_expected.to render_template(:edit)
        end
      end
    end
  end

  describe 'GET #destroy' do
    before do
      # something that you want to execute before running `it` block
      get :destroy, params: params
    end

    context 'when post id is valid' do
      let(:post) { FactoryBot.create :post }
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: suggestion.post_id } }
      # let(:post) { FactoryBot.create :post }
      # let(:params) { { id: post.id, user_id: post.user_id } }

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(302)
      end

      it 'is expected to redirect to posts path' do
        is_expected.to redirect_to post_path(suggestion.post_id)
      end
    end
  end

  describe 'POST #create' do

    before do
      # something that you want to execute before running `it` block
      post :create, params: {post_id: 1}
    end

    context 'when post id is valid' do
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, post_id: 1 } }

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(302)
      end
    end

    context 'when params are not correct' do
      let(:suggestion) { FactoryBot.create :suggestion }
      let(:params) { { id: suggestion.id, find: '' } }

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(302)
      end
    end

  end


  describe PostPolicy do
    subject { described_class.new(user, post) }

    let(:post) { Post.create }

    context 'being a visitor' do
      let(:user) { FactoryBot.create :user, role: 'user' }

      it { is_expected.to forbid_action(:approve) }
    end

    context 'being an administrator' do
      let(:user) { FactoryBot.create :user, id: post.id, role: 'admin' }

      it { is_expected.to permit_actions([:approve]) }
    end
  end


end
