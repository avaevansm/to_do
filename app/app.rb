require "./config/dependencies"

class App < Sinatra::Base
  # YOU NEED DIS
  set :public_folder, File.dirname(__FILE__) + '/assets'
  # AND DIS
  use Rack::MethodOverride

  get "/" do
    @lists = List.all
    erb :"homepage.html"

  end

  # get "/list/:id/edit" do
  #   @list = List.find(params["id"])
  #   erb :"edit_list.html"
  #
  # end
  #
  # patch "/list/:id" do
  #   @list = List.find(params["id"])
  #   @list.update(params["list"])
  # end

  get "/lists/:name" do
    @list = List.find_by(name: params["name"])
    erb :"to_do.html"
  end

  post "/list" do
    List.create(params["list"])

    redirect to ('/')
  end
  #
  # post "/prick" do
  #   @list = List.all.sample
  #   @list.record_pick!
  #   erb :"pick.html"
  #
  # end

  run! if app_file == $PROGRAM_NAME
end
