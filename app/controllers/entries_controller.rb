class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    @place = @entry.place
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to place_path(@entry.place)
    else
      render 'new'
    end
  end
  
  private

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on, :place_id)
  end
end
