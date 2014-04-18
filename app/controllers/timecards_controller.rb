class TimecardsController < ApplicationController
  respond_to :html

  def index
    @timecards = Timecard.all
    respond_with @timecards.sort_by!{ |m| m.first_name }
  end
end
