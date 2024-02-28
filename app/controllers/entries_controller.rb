class EntriesController < ApplicationController
  before_action :set_place, only: [:new, :create]
  before_action :set_entry, only: [:create]

  def new
    @entry = Entry.new
    @entry.place_id = @place.id
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to place_path(@place), notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_entry
    @entry = Entry.new(entry_params)
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on, :place_id)
  end
end
