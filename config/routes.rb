Rails.application.routes.draw do
devise_for :users
  scope "/forum" do
	resources :forum_threads do
		resources :forum_posts, module: :forum_threads
        end
  end

  resources :users do
    collection do
      post :import
    end
  end
root 'forum_threads#index'
end
