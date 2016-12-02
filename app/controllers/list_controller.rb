class ListController < ApplicationController
  def show
  	@list = List.friendly.find(params[:slug])
  end
end
