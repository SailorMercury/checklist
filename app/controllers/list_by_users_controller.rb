class ListByUsersController < ApplicationController

  def new
    @id = params[:id]
    raise params.inspect
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_by_user }
    end
  end
  
  def index
    @id = params[:id]
  end
  
end
