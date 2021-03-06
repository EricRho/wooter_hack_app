 
 class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize_admin, only: :create

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    if params[:search]
      @videos = Video.search(params[:search]).order('created_at DESC')
    else
      @videos = Video.order('created_at DESC')
    end

  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    # @video = Video.new
    # if current_user.admin == true
    if current_user.admin == true
      @video = Video.new
    else
      alert('Admins only')
    end
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    # if current_user.admin == true
    if current_user.admin == true
      @video = Video.new(video_params)
      respond_to do |format|
        if @video.save
          format.html { redirect_to @video, notice: 'Video was successfully created.' }
          format.json { render :show, status: :created, location: @video }
        else
          format.html { render :new }
          format.json { render json: @video.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { render :new }
      format.json { render json: @video.errors, status: :unprocessable_entity }
    end

    # @video = Video.new(video_params)

    # respond_to do |format|
    #   if @video.save
    #     format.html { redirect_to @video, notice: 'Your Video was successfully added'}
    #     format.json {render :show, status: :created, location: @video}
    #   else
    #     format.html { render :new}
    #     format.json {render json: @video.errors, status: :unprocessable_entity}
    #   end
    # end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:title, :author, :link, :duration, :sport, :skill)
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
