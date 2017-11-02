class BlobsController < ApplicationController
  before_action :authenticate_user! #, :set_blob, only: [:show, :edit, :update, :destroy]

  # GET /blobs
  # GET /blobs.json
  def index
    @blobs = current_user.blobs
  end

  # GET /blobs/1
  # GET /blobs/1.json
  def show
    @blob = current_user.blobs.find(params[:id])
  end

  # GET /blobs/new
  def new
    @blob = current_user.blobs.new
  end

  # GET /blobs/1/edit
  def edit
    @blob = current_user.blobs.find(params[:id])
  end

  # POST /blobs
  # POST /blobs.json
  def create
    #@blob = Blob.new(blob_params)
    @blob = current_user.blobs.new(blob_params)
    @blob[:user_id] = current_user.id
    respond_to do |format|
      if @blob.save
        format.html { redirect_to @blob, notice: 'Blob was successfully created.' }
        format.json { render :show, status: :created, location: @blob }
      else
        format.html { render :new }
        format.json { render json: @blob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blobs/1
  # PATCH/PUT /blobs/1.json
  def update
    @blob = current_user.blobs.find(params[:id])
    respond_to do |format|
      if @blob.update(blob_params)
        format.html { redirect_to @blob, notice: 'Blob was successfully updated.' }
        format.json { render :show, status: :ok, location: @blob }
      else
        format.html { render :edit }
        format.json { render json: @blob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blobs/1
  # DELETE /blobs/1.json
  def destroy
    @blob = current_user.blobs.find(params[:id])
    @blob.destroy
    respond_to do |format|
      format.html { redirect_to blobs_url, notice: 'Blob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get
    blob = current_user.blobs.find_by_id(params[:id])
    if blob
      send_file blob.blob_data.path, :type => blob.blob_data_content_type
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blob
      @blob = current_user.blobs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blob_params
      params.require(:blob).permit(:user_id, :blob_data)
    end
end
