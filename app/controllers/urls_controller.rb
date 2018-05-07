class UrlsController < ApplicationController
  before_action :show_url, only: [:show]

  def index
  	@url = Url.all
  end

  def new
  	@url = Url.new
  end

  def show
  	redirect_to @url.long
  end

  def create
  	@url = Url.new(url_params)

		respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        render 'new'
      end
    end
  end

  private
  	def url_params
  		params.require(:url).permit(:long, :short)
  	end

    def show_url
      if params[:id].to_i == 0
        @url = Url.find_by(short: "#{params[:id]}")
      else
        @url = Url.find_by(id: params[:id])
      end
    end
end
