class ScreenshotsController < ApplicationController
  before_action :set_screenshot, only: %i[ show destroy]

  def index
    @screenshots = Screenshot.all.order("created_at DESC")
  end

  # GET /screenshots/1 or /screenshots/1.json
  def show
  end
  
  # DELETE /screenshots/1 or /screenshots/1.json
  def destroy
    @screenshot.destroy

    respond_to do |format|
      format.html { redirect_to screenshots_url, notice: "Screenshot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screenshot
      @screenshot = Screenshot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screenshot_params
      params.require(:screenshot).permit(:title, :image, :link_id)
    end
end
