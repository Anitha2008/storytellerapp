require 'asana'

class StoriesController < ApplicationController


  Asana.configure do |client|
    client.api_key = '1x1wOpXJ.OxzA9Yv6W8NLjNNmjakTeTe'
  end


  def index
    @stories=Story.all
    @users = Asana::User.all

       end

  def new
    @story = Story.new

  end

  def create
    @story=Story.new(params[:story])

    if @story.valid? and @story.save
      redirect_to stories_path
    else
      render :action =>:new

    end
  end

 # private

  #def story_params
   # params.require(:story).permit(:title, :description)
  #end

end
