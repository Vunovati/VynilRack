class RecordingsController < ApplicationController
  # GET /recordings
  # GET /recordings.json
  def index
    @recordings = Recording.all

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
        format.html { redirect_to @recording, notice: 'Recording was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to recordings_url }
      format.json { head :no_content }
    end
  end
end
