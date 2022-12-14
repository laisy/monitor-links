class LinksController < ApplicationController
  before_action :set_link, only: %i[ show edit update destroy ]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    @link.url = "https://" + @link.url unless @link.url.include?("https://")

    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link), notice: "Link was successfully created." }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to link_url(@link), notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    screenshots_link = Screenshot.where(link_id: @link.id)
    screenshots_link.delete_all

    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url)
    end
end
