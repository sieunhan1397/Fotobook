class PicturesController < ApplicationController
  def destroy
    @picture = Picture.find(params[:id])
    id_album = @picture.album
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to edit_album_path(id_album), notice: 'Pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
