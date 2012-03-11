class RecordingsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /recordings
  # GET /recordings.json
  def index
    @recordings = Recording.search(params[:search]).order(sort_column + ' '  + sort_direction).paginate(:page => params[:page]) 
    #@recordings_found = Recording.where(:title.matches => "%#{params[:search]}")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recordings }
    end
  end

  # GET /recordings/1
  # GET /recordings/1.json
  def show
    @recording = Recording.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recording }
    end
  end

  # GET /recordings/new
  # GET /recordings/new.json
  def new
    @recording = Recording.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recording }
    end
  end

  # GET /recordings/1/edit
  def edit
    @recording = Recording.find(params[:id])
  end

  # POST /recordings
  # POST /recordings.json
  def create
    @recording = Recording.new(params[:recording])

    respond_to do |format|
      if @recording.save
        format.html { redirect_to @recording, notice: 'Recording was successfully created.' }
        format.json { render json: @recording, status: :created, location: @recording }
      else
        format.html { render action: "new" }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recordings/1
  # PUT /recordings/1.json
  def update
    @recording = Recording.find(params[:id])

    respond_to do |format|
      if @recording.update_attributes(params[:recording])
        format.html { redirect_to @recording, :notice => 'Recording was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_recording_path(@recording), :notice => 'An error occured, Artist and Title must be entered' }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordings/1
  # DELETE /recordings/1.json
  def destroy
    @recording = Recording.find(params[:id])
    @recording.destroy

    respond_to do |format|
      format.html { redirect_to recordings_url, :notice => @recording.artist + " " + @recording.title + " deleted" }
      format.json { head :no_content }
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
