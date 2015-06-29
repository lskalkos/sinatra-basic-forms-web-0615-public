class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do

    puts "On an edit page"

    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find_by(params[:id])

    params[:song][:title]

    @song.update(title: params[:song][:title], artist: params[:song][:artist], album: params[:song][:album], genre: params[:song][:genre], length: params[:song][:length])

    url = "/songs/#{params[:id]}"
    redirect_to(url)

  end


  
end

