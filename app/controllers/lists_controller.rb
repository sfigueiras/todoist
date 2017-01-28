class ListsController < ApplicationController
  def index
      @list = List.new
  	@lists = List.all
  end

  def show
  	@new_task = Task.new
  	@list = List.friendly.find(params[:id])
  end

  def create
    list = List.create(list_params)
    session[:top] = (session[:top] || []) << list.id

    redirect_to list_path(list)
  end

  def update
  	List.friendly.find(params[:id]).update(list_params)

  	respond_to do |format|
  		format.js { render status: 200 }
  		format.html { redirect_to list_path(params[:id]) }
  	end
  end

  def destroy
    l = List.friendly.find(params[:id])
    
    session[:top].reject! {|list_id| list_id.eql? l.id } if session[:top]
    
    l.destroy
    
    respond_to do |format|
      format.js { render :index }
      format.html { redirect_to lists_path }
    end
  end

  def last
    @lists = List.find(session[:top]).reverse.take(5)

    respond_to do |format|
      format.html { render :last }
      format.js { render :last}
    end
  end

  def list_params
  	params.require(:list).permit(:id, :name, :slug)
  end
end
