# produces api.host.com/v1
namespace :api, defaults: { format: :json },
          constraints: { subdomain: 'api' },
          path: '/' do
  #list resources for version 1
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
  	resources :users, only: [:show, :create, :update, :destroy] do
     resources :products, only: [:create, :update, :destroy]
    end
  	resources :sessions, only: [:create, :destroy]
    resources :products, only: [:show, :index]
  end

end

class ApiConstraints

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.kinaapi.v#{@version}")
  end

end