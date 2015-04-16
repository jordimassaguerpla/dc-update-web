class DockerCfgsController < ApplicationController
  before_action :set_docker_cfg, only: [:show, :edit, :update, :destroy]

  # GET /docker_cfgs
  # GET /docker_cfgs.json
  def index
    @docker_cfgs = DockerCfg.all
  end

  # GET /docker_cfgs/1
  # GET /docker_cfgs/1.json
  def show
  end

  # GET /docker_cfgs/new
  def new
    @docker_cfg = DockerCfg.new
  end

  # GET /docker_cfgs/1/edit
  def edit
  end

  # POST /docker_cfgs
  # POST /docker_cfgs.json
  def create
    @docker_cfg = DockerCfg.new(docker_cfg_params)

    respond_to do |format|
      if @docker_cfg.save
        format.html { redirect_to @docker_cfg, notice: 'Docker cfg was successfully created.' }
        format.json { render :show, status: :created, location: @docker_cfg }
      else
        format.html { render :new }
        format.json { render json: @docker_cfg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docker_cfgs/1
  # PATCH/PUT /docker_cfgs/1.json
  def update
    respond_to do |format|
      if @docker_cfg.update(docker_cfg_params)
        format.html { redirect_to @docker_cfg, notice: 'Docker cfg was successfully updated.' }
        format.json { render :show, status: :ok, location: @docker_cfg }
      else
        format.html { render :edit }
        format.json { render json: @docker_cfg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docker_cfgs/1
  # DELETE /docker_cfgs/1.json
  def destroy
    @docker_cfg.destroy
    respond_to do |format|
      format.html { redirect_to docker_cfgs_url, notice: 'Docker cfg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docker_cfg
      @docker_cfg = DockerCfg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docker_cfg_params
      params.require(:docker_cfg).permit(:url, :auth, :email)
    end
end
