require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'before actions' do
    describe 'set_post' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_post)
      end
    end
  end


  describe 'GET #index' do
    before do
      get :index
    end
    context 'when post id is valid' do
      it 'is expected to assign user instance variable' do
        expect(assigns[:posts]).to eq(Post.not_publish_post.order(created_at: :desc))
      end
    end
  end



  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:post]).to be_instance_of(Post)
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
      let(:params) { { id: post.id, user_id: post.user_id } }

      it 'is expected to set post instance variable' do
        expect(assigns[:post]).to eq(Post.find_by(id: params[:id]))
      end

      it 'is expected to set user instance variable' do
        expect(assigns[:post]).to eq(Post.find_by(user_id: params[:user_id]))
      end

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(200)
      end
    end

    context 'when params are not correct' do
      let(:post) { FactoryBot.create :post }
      let(:params) { { id: post.id, user_id: post.user_id, name: '' } }

      it 'is expected to name render :edit' do
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'POST #create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do
      let(:current_user) { User.create!(id: 1, name: 'Saif Ali', email: 'saif@gmail.com', password: '123456') }
      let(:params) { { post: { user_id: current_user.id, name: 'Abc', title: 'Xyz', status: 'pending' } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:post]).to be_instance_of(Post)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:post].name).to eq('Abc')
      end

      it 'is expected to have status assigned to it' do
        expect(assigns[:post].status).to eq('pending')
      end
    end

    context 'when params are not correct' do
      let(:params) { { post: { status: '', name: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(422)
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
      let(:params) { { id: post.id, post: { name: 'First Post' } } }

      context 'when data is provided is valid' do
        it 'is expected to update user' do
          expect(post.reload.name).to eq('First Post')
        end

        it 'is_expected to redirect_to users_path' do
          expect(response.status).to eq(302)
        end

        it 'is expected to set flash message' do
          expect(flash[:notice]).to eq('Post was successfully updated.')
        end
      end

      context 'when data is invalid' do
        let(:post) { FactoryBot.create :post }
        let(:params) { { id: post.id, post: { name: '' } } }

        it 'is expected not to update user name' do
          expect(post.reload.name).not_to be_empty
        end

        it 'is expected to render edit template' do
          is_expected.to render_template(:edit)
        end
      end
    end
  end

  describe 'GET #dashboard' do
    before do
      get :dashboard
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:posts]).to eq(Post.published_post.order(created_at: :desc))
    end
  end

  describe 'POST #report' do
    context 'when post id is valid' do
      let(:post) { FactoryBot.create :post }
      it 'is expected to report ' do
        UserMailer.report_email(post)
        expect(ActionMailer::Base.deliveries.count).to eq(0)
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
      let(:params) { { id: post.id, user_id: post.user_id } }

      it 'is expected to redirect to posts path' do
        expect(response.status).to eq(302)
      end

      it 'is expected to redirect to posts path' do
        is_expected.to redirect_to posts_url
      end
    end
  end

  describe PostPolicy do
    subject { described_class.new(user, post) }

    let(:post) { Post.create }

    context 'being a visitor' do
      let(:user) { FactoryBot.create :user }

      it { is_expected.to forbid_action(:show) }
    end

    context 'being an administrator' do
      let(:user) { FactoryBot.create :user, role: 'admin' }

      it { is_expected.to permit_actions([:show]) }
    end
  end
end
