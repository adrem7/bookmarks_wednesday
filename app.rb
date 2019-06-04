require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
     p ENV
    'Bookmark Manager'
    # p ENV
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  run! if app_file == $0
end
