class Timecard
  include ActiveModel::Model

  attr_accessor :id, :first_name, :last_name

  validates_presence_of :first_name

  def self.all
    @timecards = []
    @data = JSON.parse(RestClient.get(self._base_url))
    @data.each do |_timecard|
      @timecards << Timecard.new(id: _timecard[0], first_name: _timecard[4], last_name: _timecard[6])
    end
    @timecards
  end

  private

    def self._base_url
      Rails.env.production? ? 'http://gameroom.swapzapp.com/api/users/' : 'http://x:8e3949f0a49e013164600c2937e6c8c6@example.swapzapp.dev/api/users?clocked_in=true'
    end
end