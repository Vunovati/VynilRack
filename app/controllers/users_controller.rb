class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction

  # GET /recordings/1
  # GET /recordings/1.json
  def show
    @user = User.find(params[:id])
    @recordings = @user.recordings.search(params[:search]).order(sort_column + ' '  + sort_direction).paginate(:page => params[:page]) 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  private 
  def sort_column
    Recording.column_names.include?(params[:sort]) ? params[:sort] : "artist"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
