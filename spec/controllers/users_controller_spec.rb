# frozen_string_literal: true

describe UsersController, type: :controller do
  let(:post_params) do
    { user: { **attributes_for(:user) } }

  end

  describe 'POST #create' do
    subject(:post_form) { post :create, params: post_params }

    context 'when user have valid values' do
      it 'creates a new user' do
        expect { post_form }.to change(User, :count).by(1)
      end

      it 'redirects to thank you page' do
        post_form
        expect(response).to redirect_to(thank_you_users_path)
      end
    end

    context 'when user have invalid values' do
      let(:post_params) do
        { user: { email: 'invalid email', name: 'Jo' } }
      end

      it 'does not create a new user' do
        expect { post_form }.not_to change(User, :count)
      end

      it 'renders index page' do
        post_form
        expect(response.status).to eq(422)
      end
    end

    context 'when user already exists' do
      let!(:user) { create(:user) }
      let(:post_params) do
        { user: { email: user.email, name: 'John' } }
      end

      it 'does not create a new user' do
        expect { post_form }.not_to change(User, :count)
      end

      it 'redirects to Thank You page' do
        post_form
        expect(response).to redirect_to(thank_you_users_path)
      end
    end
  end
end
