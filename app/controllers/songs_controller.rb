class SongsController < ApplicationController
  def index
    if params[:q].present?
      @songs = Song.where('title LIKE ?', "%#{params[:q]}%")
    else
      @songs = Song.all
    end

    if turbo_frame_request?
      render partial: "songs", locals: { songs: @songs }
    else
      render :index
    end
  end
end
