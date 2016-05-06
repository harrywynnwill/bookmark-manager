ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/data_mapper_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    redirect to('/links')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/links')
  end

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end


  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/links' do
    link = Link.first_or_create(url: params[:url], title: params[:title])
    params[:name].split(" ").each do |name|
      tag = Tag.first_or_create(name: name)
      link.tags << tag
     end
    link.save
    redirect to('/links')
  end


    run! if app_file == $0

end
