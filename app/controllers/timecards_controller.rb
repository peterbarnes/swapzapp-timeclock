class TimecardsController < ApplicationController
  respond_to :html

  def index
    @timecards = Timecard.all
    respond_with @timecards
  end
end
