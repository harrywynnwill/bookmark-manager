ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/' do
    redirect to('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
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
